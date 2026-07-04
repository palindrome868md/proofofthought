;--- Sorts ---------------------------------------------------------
(declare-sort Person 0)

;--- Functions ------------------------------------------------------
; Number of weeks the person has been continuously employed
(declare-fun weeks_employed (Person) Int)

; Predicate: the person qualifies for statutory paternity leave
(declare-fun qualifies_for_paternity_leave (Person) Bool)

;--- Constants ------------------------------------------------------
(declare-const me Person)   ; the employee in the scenario

;--- Knowledge base ------------------------------------------------
; The employee has worked for only 2 months ≈ 8 weeks
(assert (= (weeks_employed me) 8))

; Eligibility rule: to qualify you must have at least 26 weeks of continuous employment
(assert (forall ((p Person))
  (=> (qualifies_for_paternity_leave p)
      (>= (weeks_employed p) 26))))

;--- Test the question ---------------------------------------------
; Assert that the employee does qualify for paternity leave
(assert (qualifies_for_paternity_leave me))

;--- Solve ----------------------------------------------------------
(check-sat)   ; Expected result: unsat (i.e., you do NOT qualify)
(get-model)