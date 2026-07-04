; Declare an uninterpreted sort for people
(declare-sort Person 0)

; Predicates and functions needed
(declare-fun is_child (Person) Bool)                     ; true if the person is a child
(declare-fun is_parent (Person Person) Bool)             ; (is_parent p c) = p is a parent of c
(declare-fun is_registered_contact (Person Person) Bool) ; contact for the child's CTF
(declare-fun special_condition (Person Person) Bool)    ; e.g., terminal illness or court deputyship
(declare-fun receives_money (Person Person Int) Bool)   ; (receives_money r c a) = r receives c's money at age a

; Individuals in the scenario
(declare-const parent Person)   ; the asker / registered contact
(declare-const richard Person)  ; the child

; Knowledge base extracted from the document
(assert (is_child richard))                                 ; Richard is a child
(assert (is_parent parent richard))                         ; parent relationship
(assert (is_registered_contact parent richard))             ; parent is the registered contact

; Rule: the child himself may receive the money when he turns 18
(assert (forall ((c Person) (a Int))
  (=> (and (is_child c) (= a 18))
      (receives_money c c a))))

; Rule: nobody else may receive the child's money at 18 unless a special condition applies
(assert (forall ((p Person) (c Person) (a Int))
  (=> (and (is_child c) (= a 18) (not (= p c)) (not (special_condition p c)))
      (not (receives_money p c a)))))

; In this scenario there is no special condition (no terminal illness, no court order)
(assert (not (special_condition parent richard)))

; Test statement: "Can the parent decide when and how the child receives the money?"
; We model this by asserting that the parent receives the child's money at age 18.
(assert (receives_money parent richard 18))

; Check whether this situation is possible under the rules
(check-sat)
(get-model)