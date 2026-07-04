; Inheritance Tax Verification Problem
; Scenario: Husband died, inherited £300,000 home, no children, sole custodian

; 1. Declare sorts
(declare-sort Person 0)
(declare-sort Estate 0)

; 2. Declare functions
(declare-fun estate-value (Estate) Int)
(declare-fun is-spouse (Person Person) Bool)
(declare-fun is-beneficiary (Person Estate) Bool)
(declare-fun inheritance-tax-required (Estate) Bool)
(declare-fun threshold () Int)
(declare-fun deceased-person (Estate) Person)

; 3. Declare constants
(declare-const husband Person)
(declare-const wife Person)
(declare-const family-home Estate)

; 4. Assert knowledge base (facts from document)

; Threshold is £325,000
(assert (= (threshold) 325000))

; The estate value is £300,000
(assert (= (estate-value family-home) 300000))

; Wife is spouse of deceased husband
(assert (is-spouse wife husband))

; Wife is beneficiary of the estate
(assert (is-beneficiary wife family-home))

; Husband is the deceased person associated with this estate
(assert (= (deceased-person family-home) husband))

; Rule 1: No Inheritance Tax if estate value is below £325,000 threshold
(assert (forall ((e Estate))
  (=> (< (estate-value e) (threshold))
      (not (inheritance-tax-required e)))))

; Rule 2: No Inheritance Tax if left to spouse
(assert (forall ((e Estate) (p Person))
  (=> (and (is-beneficiary p e) 
           (is-spouse p (deceased-person e)))
      (not (inheritance-tax-required e)))))

; Rule 3: Beneficiaries do not normally pay tax on things they inherit
; (The estate pays, not the beneficiary)

; 5. Test: Will inheritance tax be required?
; We assert that tax IS required and check for contradiction
(assert (inheritance-tax-required family-home))

; 6. Check satisfiability
(check-sat)
; Expected: unsat (meaning NO inheritance tax is required)
; If unsat, the assertion contradicts the knowledge base = tax not required

(get-model)