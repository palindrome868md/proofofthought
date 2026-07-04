;--- Sorts ---------------------------------------------------------
(declare-sort Person 0)

;--- Functions / Predicates ----------------------------------------
; Personal attributes
(declare-fun is_retired (Person) Bool)
(declare-fun low_income (Person) Bool)

; Pension Credit elements
(declare-fun gets_pension_credit (Person) Bool)
(declare-fun guarantee_credit (Person) Bool)   ; core‑group element
(declare-fun savings_credit   (Person) Bool)   ; additional element

; Warm Home Discount eligibility
(declare-fun warm_home_eligible (Person) Bool)

;--- Constants ------------------------------------------------------
(declare-const husband Person)
(declare-const wife    Person)

;--- Knowledge base (facts from the scenario) ----------------------
; Both are retired and on a low income
(assert (is_retired husband))
(assert (is_retired wife))
(assert (low_income husband))
(assert (low_income wife))

; They receive Pension Credit (which includes Guarantee Credit)
(assert (gets_pension_credit husband))
(assert (gets_pension_credit wife))
; Guarantee Credit element (required for the core group)
(assert (guarantee_credit husband))
(assert (guarantee_credit wife))
; They also receive Savings Credit
(assert (savings_credit husband))
(assert (savings_credit wife))

;--- Eligibility rule (core‑group) ---------------------------------
; If a person gets Guarantee Credit, they are eligible for the Warm Home Discount,
; regardless of any other credits they may receive.
(assert (forall ((p Person))
  (=> (guarantee_credit p)
      (warm_home_eligible p))))

;--- Test the question ---------------------------------------------
; Are both husband and wife eligible even though they have Savings Credit?
(assert (and (warm_home_eligible husband)
             (warm_home_eligible wife)))

;--- Query ---------------------------------------------------------
(check-sat)    ; Expected result: sat  (they are eligible)
(get-model)