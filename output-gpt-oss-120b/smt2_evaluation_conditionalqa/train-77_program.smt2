;-------------------------------------------------
; Declarations
;-------------------------------------------------
(declare-sort Person 0)

; Predicates returning Bool
(declare-fun full_time_student (Person) Bool)
(declare-fun part_time_work (Person) Bool)
(declare-fun child_under_15 (Person) Bool)
(declare-fun undergrad_finance (Person) Bool)
(declare-fun postgraduate_loan (Person) Bool)
(declare-fun claim_taxfree_childcare (Person) Bool)
(declare-fun nhs_childcare_help (Person) Bool)
(declare-fun eligible_childcare (Person) Bool)

; The individual in the scenario
(declare-const me Person)

;-------------------------------------------------
; Knowledge base (facts from the scenario & assumptions)
;-------------------------------------------------
(assert (full_time_student me))          ; enrolled on a 6‑month full‑time course
(assert (part_time_work me))             ; still working part‑time (does not affect eligibility)

; Assume the remaining eligibility conditions hold:
(assert (child_under_15 me))             ; child is under 15 (or under 17 with SEN)
(assert (undergrad_finance me))          ; eligible for undergraduate student finance
(assert (not (postgraduate_loan me)))   ; not receiving a postgraduate loan
(assert (not (claim_taxfree_childcare me))) ; not claiming other childcare schemes
(assert (not (nhs_childcare_help me)))  ; not receiving NHS childcare help

;-------------------------------------------------
; Eligibility rule (derived from the document)
;-------------------------------------------------
(assert (forall ((p Person))
  (=> (and (full_time_student p)
           (child_under_15 p)
           (undergrad_finance p)
           (not (postgraduate_loan p))
           (not (claim_taxfree_childcare p))
           (not (nhs_childcare_help p)))
      (eligible_childcare p))))

;-------------------------------------------------
; Test the question: "Will I still be eligible for a help with childcare costs?"
;-------------------------------------------------
(assert (eligible_childcare me))

(check-sat)   ; Expected result: sat  (the scenario is eligible)
(get-model)