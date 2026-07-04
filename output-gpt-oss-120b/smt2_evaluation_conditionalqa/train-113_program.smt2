;--- Sorts ---------------------------------------------------------
(declare-sort Person 0)

;--- Boolean predicates --------------------------------------------
(declare-fun diagnosis_after_25July2012 (Person) Bool)
(declare-fun exposure_UK                (Person) Bool)
(declare-fun cannot_trace_employer      (Person) Bool)
(declare-fun not_made_civil_claim      (Person) Bool)
(declare-fun not_received_other_payment(Person) Bool)
(declare-fun within_3_years_of_diagnosis(Person) Bool)

;--- Derived eligibility predicate ----------------------------------
(declare-fun eligible_DMPS (Person) Bool)

;--- Constants -----------------------------------------------------
(declare-const me Person)

;--- Knowledge base (facts from the scenario) ----------------------
; Person is 54 and was diagnosed 6 months ago → within 3 years
(assert (within_3_years_of_diagnosis me))

; Diagnosis was on/after 25 July 2012
(assert (diagnosis_after_25July2012 me))

; Exposure occurred in the United Kingdom
(assert (exposure_UK me))

; Employer and its insurers cannot be traced
(assert (cannot_trace_employer me))

; No civil claim has been made against any employer/insurer
(assert (not_made_civil_claim me))

; No other payment (2008 scheme, 1979 Act, MOD) has been received
(assert (not_received_other_payment me))

;--- Eligibility rule (DMPS) ---------------------------------------
; If all the above conditions hold, the person is eligible for state compensation
(assert (forall ((p Person))
  (=> (and (diagnosis_after_25July2012 p)
           (exposure_UK p)
           (cannot_trace_employer p)
           (not_made_civil_claim p)
           (not_received_other_payment p)
           (within_3_years_of_diagnosis p))
      (eligible_DMPS p))))

;--- Test the question ---------------------------------------------
; Are we entitled to compensation from the state?  (i.e., eligible for DMPS)
(assert (eligible_DMPS me))

;--- Check the result ------------------------------------------------
(check-sat)
(get-model)