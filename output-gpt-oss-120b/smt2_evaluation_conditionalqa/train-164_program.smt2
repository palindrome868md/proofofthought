;--- Declarations ----------------------------------------------------
(declare-sort Person 0)

; Predicates (all return Bool)
(declare-fun lives_in_england (Person) Bool)
(declare-fun first_child (Person) Bool)          ; expecting first child
(declare-fun multiple_birth (Person) Bool)       ; expecting twins/triplets
(declare-fun receives_universal_credit (Person) Bool)
(declare-fun birth_within_6_months (Person) Bool)
(declare-fun has_children_under_16 (Person) Bool)
(declare-fun eligible (Person) Bool)

;--- Knowledge base (rules) -----------------------------------------
; Eligibility rule (standard case when you already have children)
(assert (forall ((p Person))
  (=> (and (lives_in_england p)
           (or (first_child p) (multiple_birth p))
           (receives_universal_credit p)
           (birth_within_6_months p)
           (has_children_under_16 p))
      (eligible p))))

;--- Facts for the person in the scenario ---------------------------
(declare-const me Person)

; Lives in England (not Scotland)
(assert (lives_in_england me))

; Not a first‑child pregnancy (already have children)
(assert (not (first_child me)))

; Expecting twins (multiple birth)
(assert (multiple_birth me))

; Receives Universal Credit (qualifying benefit)
(assert (receives_universal_credit me))

; Birth was 3 weeks ago → within 6 months of claim deadline
(assert (birth_within_6_months me))

; Has existing children under 16 (ages 2 and 4)
(assert (has_children_under_16 me))

;--- Test the question ------------------------------------------------
; Are we eligible for the Sure Start Maternity Grant?
(assert (eligible me))

;--- Solve ------------------------------------------------------------
(check-sat)   ; Expected result: sat  (i.e., you are eligible)
(get-model)