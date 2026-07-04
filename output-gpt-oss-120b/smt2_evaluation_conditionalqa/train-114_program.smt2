;------------------------------
; 1. Declare sorts
;------------------------------
(declare-sort Person 0)

;------------------------------
; 2. Declare functions / constants
;------------------------------
; Age of a person
(declare-fun age (Person) Int)

; Number of caring hours per week
(declare-fun caring_hours (Person) Int)

; State‑pension age (same for everybody)
(declare-fun state_pension_age () Int)

; Eligibility for Carer’s Credit
(declare-fun eligible (Person) Bool)

; The person asking the question
(declare-const me Person)

;------------------------------
; 3. Knowledge base (facts from the scenario)
;------------------------------
; The asker cares 22 hours a week
(assert (= (caring_hours me) 22))

; The asker is 30 years old (≥16 and < pension age)
(assert (= (age me) 30))

; State‑pension age is 65
(assert (= (state_p pension_age) 65))

;------------------------------
; 4. Eligibility rule (income is irrelevant)
;------------------------------
; A person is eligible iff they are 16‑plus, under pension age,
; and care at least 20 hours per week.
(assert (forall ((p Person))
  (=> (and (>= (age p) 16)
           (< (age p) (state_pension_age))
           (>= (caring_hours p) 20))
      (eligible p))))

;------------------------------
; 5. Test the question: "Will I be eligible for Carer’s Credit?"
;------------------------------
; We ask the solver to make the eligibility statement true.
(assert (eligible me))

;------------------------------
; 6. Check satisfiability
;------------------------------
(check-sat)   ; sat  → the person can be eligible
(get-model)