;--- Sorts -------------------------------------------------
(declare-sort Person 0)

;--- Predicates --------------------------------------------
(declare-fun Student (Person) Bool)
(declare-fun Drink (Person) Bool)
(declare-fun Dependent (Person) Bool)
(declare-fun Want (Person) Bool)          ; wants to be addicted
(declare-fun Aware (Person) Bool)         ; knows caffeine is a drug

;--- Constant ---------------------------------------------
(declare-const rina Person)

;--- Knowledge base ----------------------------------------

; 1. All coffee drinkers are dependent
(assert (forall ((p Person))
  (=> (Drink p) (Dependent p))))

; 2. Everyone drinks coffee or does NOT want to be addicted (or both)
(assert (forall ((p Person))
  (or (Drink p) (not (Want p)))))   ; Drink ∨ ¬Want

; 3. No one who doesn't want to be addicted is unaware
(assert (forall ((p Person))
  (=> (not (Want p)) (Aware p))))   ; ¬Want → Aware

; 4. Rina: (Student ∧ ¬Aware) ∨ (¬Student ∧ Aware)
(assert (or (and (Student rina) (not (Aware rina)))
            (and (not (Student rina)) (Aware rina))))

; 5. Rina: (Student ∧ Dependent) ∨ (¬Student ∧ ¬Dependent)
(assert (or (and (Student rina) (Dependent rina))
            (and (not (Student rina)) (not (Dependent rina)))))

;--- Test the negation of the target statement -------------
; Target statement: (or (not (Want rina)) (not (Aware rina)))
; Negation: (and (Want rina) (Aware rina))
(assert (and (Want rina) (Aware rina)))

;--- Solve -------------------------------------------------
(check-sat)   ; Expected result: unsat → the original statement is true
(get-model)