; Scenario: 6-month full-time training course + part-time work
; Will I still be eligible for help with childcare costs (Childcare Grant)?

(declare-sort Applicant 0)

(declare-const me Applicant)

; Predicates (conditions for eligibility)
(declare-fun is-full-time (Applicant) Bool)
(declare-fun has-child-under-15 (Applicant) Bool)
(declare-fun eligible-for-student-finance (Applicant) Bool)
(declare-fun permanent-resident-england (Applicant) Bool)
(declare-fun childcare-provider-on-ofsted (Applicant) Bool)
(declare-fun claims-tax-free-childcare (Applicant) Bool)
(declare-fun receives-nhs-help (Applicant) Bool)
(declare-fun has-postgraduate-loan (Applicant) Bool)
(declare-fun children-financially-dependent (Applicant) Bool)

(declare-fun course-length-months (Applicant) Int)
(declare-fun works-part-time (Applicant) Bool)

; Derived predicate for eligibility (to be tested)
(declare-fun eligible_childcare_grant (Applicant) Bool)

; Scenario facts
(assert (= (course-length-months me) 6))       ; 6-month course
(assert (works-part-time me))                   ; working part-time in addition to education
(assert (is-full-time me))                      ; you are a full-time student
(assert (has-child-under-15 me))                ; you have a child under 15
(assert (eligible-for-student-finance me))     ; you are eligible for student finance (or eligible to)
(assert (not (has-postgraduate-loan me)))      ; not on Postgraduate Loan
(assert (permanent-resident-england me))        ; permanent resident in England
(assert (children-financially-dependent me))     ; children are financially dependent on you
(assert (childcare-provider-on-ofsted me))       ; provider is on Ofsted register
(assert (not (claims-tax-free-childcare me)))    ; neither you nor partner claim Tax-Free Childcare
(assert (not (receives-nhs-help me)))            ; neither you nor partner receive NHS childcare help

; Rule: If all criteria hold for some applicant, they are eligible for Childcare Grant
(assert (forall ((a Applicant))
  (=> (and (is-full-time a)
             (has-child-under-15 a)
             (eligible-for-student-finance a)
             (not (has-postgraduate-loan a))
             (permanent-resident-england a)
             (children-financially-dependent a)
             (childcare-provider-on-ofsted a)
             (not (claims-tax-free-childcare a))
             (not (receives-nhs-help a)))
      (eligible_childcare_grant a))))

; Test: Is the applicant (me) eligible for Childcare Grant?
(assert (eligible_childcare_grant me))

(check-sat)
(get-model)