; SMT-LIB 2.0 Program to verify if legally binding contract exists to split finances without court proceedings

; Declare sorts
(declare-sort Agreement 0)
(declare-sort Process 0)

; Declare functions
(declare-fun is-legally-binding (Agreement) Bool)
(declare-fun requires-court-hearing (Agreement) Bool)
(declare-fun requires-court-approval (Agreement) Bool)
(declare-fun can-split-evenly (Agreement) Bool)
(declare-fun is-consent-order (Agreement) Bool)
(declare-fun is-mediation-agreement (Agreement) Bool)
(declare-fun avoids-court-proceedings (Agreement) Bool)

; Declare constants
(declare-const consent-order Agreement)
(declare-const mediation-agreement Agreement)
(declare-const financial-order Agreement)

; Knowledge Base - Facts from the document

; Consent orders are legally binding
(assert (is-consent-order consent-order))
(assert (is-legally-binding consent-order))

; Consent orders usually don't require court hearings (just approval)
(assert (not (requires-court-hearing consent-order)))

; Consent orders require court approval to be binding
(assert (requires-court-approval consent-order))

; Consent orders can split finances evenly
(assert (can-split-evenly consent-order))

; Mediation agreements alone are NOT legally binding
(assert (is-mediation-agreement mediation-agreement))
(assert (not (is-legally-binding mediation-agreement)))

; Financial orders (court-decided) require court hearings
(assert (requires-court-hearing financial-order))
(assert (is-legally-binding financial-order))

; Rule: If agreement is legally binding and doesn't require court hearing, it avoids court proceedings
(assert (forall ((a Agreement))
  (=> (and (is-legally-binding a) (not (requires-court-hearing a)))
      (avoids-court-proceedings a))))

; Rule: Consent orders can be used to split joint finances
(assert (forall ((a Agreement))
  (=> (is-consent-order a)
      (can-split-evenly a))))

; Test: Can there exist a legally binding agreement that splits finances evenly without court proceedings?
; We test if consent-order satisfies all requirements
(assert (is-legally-binding consent-order))
(assert (can-split-evenly consent-order))
(assert (avoids-court-proceedings consent-order))

; Check satisfiability - if SAT, then YES such an agreement exists
(check-sat)
(get-model)