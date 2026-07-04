;--- Sorts -------------------------------------------------
(declare-sort Person 0)

;--- Predicates -------------------------------------------
(declare-fun Kid (Person) Bool)
(declare-fun Young (Person) Bool)
(declare-fun Toddler (Person) Bool)
(declare-fun Elderly (Person) Bool)
(declare-fun Pirate (Person) Bool)
(declare-fun Seafarer (Person) Bool)

;--- Constant ---------------------------------------------
(declare-const Nancy Person)

;--- Premises ---------------------------------------------
; 1. All kids are young.
(assert (forall ((x Person)) (=> (Kid x) (Young x))))

; 2. All toddlers are kids.
(assert (forall ((x Person)) (=> (Toddler x) (Kid x))))

; 3. If someone is young, then they are not elderly.
(assert (forall ((x Person)) (=> (Young x) (not (Elderly x)))))

; 4. All pirates are seafarers.
(assert (forall ((x Person)) (=> (Pirate x) (Seafarer x))))

; 5. If Nancy is not a pirate, then Nancy is young.
(assert (=> (not (Pirate Nancy)) (Young Nancy)))

; 6. If Nancy is not a toddler, then Nancy is a seafarer.
(assert (=> (not (Toddler Nancy)) (Seafarer Nancy)))

;--- Statement to test ------------------------------------
; S : Nancy is (pirate ∧ toddler) ∨ (¬pirate ∧ ¬toddler)
; We assert the negation of S and see if it is satisfiable.
(define-fun S () Bool
  (or (and (Pirate Nancy) (Toddler Nancy))
      (and (not (Pirate Nancy)) (not (Toddler Nancy)))))

; Negate the statement
(assert (not S))

;--- Check -------------------------------------------------
(check-sat)
(get-model)