;-------------------------------------------------
; 1. Declare uninterpreted sorts
;-------------------------------------------------
(declare-sort Person 0)
(declare-sort Child 0)

;-------------------------------------------------
; 2. Declare functions / predicates
;-------------------------------------------------
; The parent shares responsibility for the child at birth
(declare-fun shares-at-birth (Person Child) Bool)

; The parent meets the work‑and‑earnings criteria for SPL / ShPP
(declare-fun meets-work-criteria (Person) Bool)

; Eligibility for Shared Parental Leave / Pay
(declare-fun eligible (Person Child) Bool)

;-------------------------------------------------
; 3. Declare constants for the two parents and the baby
;-------------------------------------------------
(declare-const mother Person)
(declare-const father Person)
(declare-const baby   Child)

;-------------------------------------------------
; 4. Knowledge base (facts from the scenario)
;-------------------------------------------------
; They have shared responsibility from birth
(assert (shares-at-birth mother baby))
(assert (shares-at-birth father baby))

; Assume they satisfy the work/earnings conditions
; (the document does not give contradictory data)
(assert (meets-work-criteria mother))
(assert (meets-work-criteria father))

;-------------------------------------------------
; 5. Eligibility rule for birth parents
;    If a birth parent shared responsibility at birth
;    and meets the work criteria, then they are eligible.
;-------------------------------------------------
(assert
  (forall ((p Person) (c Child))
    (=> (and (shares-at-birth p c) (meets-work-criteria p))
        (eligible p c))))

;-------------------------------------------------
; 6. Test the question:
;    "Given the baby is already born, are we eligible?"
;    We assert that both parents are eligible and ask Z3
;    if this can be satisfied.
;-------------------------------------------------
(assert (eligible mother baby))
(assert (eligible father baby))

;-------------------------------------------------
; 7. Check satisfiability
;-------------------------------------------------
(check-sat)
(get-model)