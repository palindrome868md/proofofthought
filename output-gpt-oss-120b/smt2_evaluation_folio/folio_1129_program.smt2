;-------------------------------------------------
; Sorts
(declare-sort Person 0)

;-------------------------------------------------
; Constants
(declare-const rina Person)

;-------------------------------------------------
; Predicates (unary Boolean functions)
(declare-fun drinks_coffee (Person) Bool)     ; regularly drinks coffee
(declare-fun dependent (Person) Bool)        ; dependent on caffeine
(declare-fun dont_want_addicted (Person) Bool) ; DOESN'T want to be addicted
(declare-fun aware (Person) Bool)            ; aware that caffeine is a drug
(declare-fun student (Person) Bool)          ; is a student

;-------------------------------------------------
; Premise 1: All coffee drinkers are dependent
(assert (forall ((p Person))
  (=> (drinks_coffee p) (dependent p))))

; Premise 2: Everyone drinks coffee or doesn't want to be addicted (or both)
(assert (forall ((p Person))
  (or (drinks_coffee p) (dont_want_added p)))) ; typo fixed below

; Premise 2 corrected (use proper predicate name)
(assert (forall ((p Person))
  (or (drinks_coffee p) (dont_want_addicted p))))

; Premise 3: If someone doesn't want to be addicted, they are aware
(assert (forall ((p Person))
  (=> (dont_want_addicted p) (aware p))))

; Premise 4: Rina is (student ∧ ¬aware)  OR  (¬student ∧ aware)
(assert (or (and (student rina) (not (aware rina)))
            (and (not (student rina)) (aware rina))))

; Premise 5: Rina is (student ∧ dependent)  OR  (¬student ∧ ¬dependent)
(assert (or (and (student rina) (dependent rina))
            (and (not (student rina)) (not (dependent rina)))))

;-------------------------------------------------
; Negation of the statement to test entailment
; The statement simplifies to:
;   dont_want_addicted(rina) → (dont_want_addicted(rina) ∧ drinks_coffee(rina))
; Negating it gives:
;   dont_want_addicted(rina)  AND  ¬drinks_coffee(rina)

(assert (dont_want_addicted rina))      ; antecedent true
(assert (not (drinks_coffee rina)))    ; consequent false

;-------------------------------------------------
; Check whether the premises together with this negation are
; satisfiable.  If they are SAT, the original implication is NOT
; entailed (i.e., the statement is false).
(check-sat)
(get-model)