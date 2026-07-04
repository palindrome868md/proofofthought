; Sorts
(declare-sort Person 0)

; Predicates
(declare-fun Pirate (Person) Bool)
(declare-fun Toddler (Person) Bool)
(declare-fun Kid (Person) Bool)
(declare-fun Young (Person) Bool)
(declare-fun Elderly (Person) Bool)
(declare-fun Seafarer (Person) Bool)

; Constant
(declare-const Nancy Person)

; Premises
; All kids are young
(assert (forall ((p Person)) (=> (Kid p) (Young p))))
; All toddlers are kids
(assert (forall ((p Person)) (=> (Toddler p) (Kid p))))
; If someone is young, then not elderly
(assert (forall ((p Person)) (=> (Young p) (not (Elderly p)))))
; All pirates are seafarers
(assert (forall ((p Person)) (=> (Pirate p) (Seafarer p))))
; If Nancy is not a pirate, then Nancy is young
(assert (=> (not (Pirate Nancy)) (Young Nancy)))
; If Nancy is not a toddler, then Nancy is a seafarer
(assert (=> (not (Toddler Nancy)) (Seafarer Nancy)))

; Statement S: "Nancy is either both a pirate and a toddler, or neither a pirate nor a toddler."
; We test the negation of S to determine entailment
; S = (Pirate Nancy ∧ Toddler Nancy) ∨ (¬Pirate Nancy ∧ ¬Toddler Nancy)
; ¬S = ¬[(Pirate Nancy ∧ Toddler Nancy) ∨ (¬Pirate Nancy ∧ ¬Toddler Nancy)]
; which is equivalent to (Pirate Nancy ∧ ¬Toddler Nancy) ∨ (¬Pirate Nancy ∧ Toddler Nancy)
(assert (not (or
  (and (Pirate Nancy) (Toddler Nancy))
  (and (not (Pirate Nancy)) (not (Toddler Nancy))))
))

; Check satisfiability: this will indicate whether S is entailed by the premises
(check-sat)
(get-model)