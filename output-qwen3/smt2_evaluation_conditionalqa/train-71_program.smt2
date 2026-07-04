; SMT-LIB 2.0 Program for Maternity Allowance Eligibility and Impact Verification
; Based on the provided government document

; 1. Declare Sorts
(declare-sort Person 0)
(declare-sort Benefit 0)

; 2. Declare Functions
; Returns the number of weeks a person has been pregnant
(declare-fun weeks-pregnant (Person) Int)

; Returns true if the person meets the timing requirement to claim Maternity Allowance
(declare-fun eligible-to-claim (Person) Bool)

; Returns true if Benefit1 affects Benefit2
(declare-fun affects (Benefit Benefit) Bool)

; 3. Declare Constants
(declare-const user Person)
(declare-const maternity-allowance Benefit)
(declare-const universal-credit Benefit)
(declare-const housing-benefit Benefit)

; 4. Assert Knowledge Base (Rules from Document)

; Rule: You can claim Maternity Allowance as soon as you've been pregnant for 26 weeks.
(assert (forall ((p Person))
  (=> (>= (weeks-pregnant p) 26)
      (eligible-to-claim p))))

; Rule: Maternity Allowance affects Universal Credit (from "Impact on other benefits" section)
(assert (affects maternity-allowance universal-credit))

; Rule: Maternity Allowance affects Housing Benefit (from "Impact on other benefits" section)
(assert (affects maternity-allowance housing-benefit))

; 5. Assert Scenario Facts
; Fact: User is 30 weeks pregnant
(assert (= (weeks-pregnant user) 30))

; 6. Verification Query
; Question: "Am i eligible and will it affect any other benefits i am getting?"
; We test if the user is eligible-to-claim AND if maternity-allowance affects known benefits (e.g., Universal Credit)
; If sat, it confirms eligibility (based on timing) and potential impact.
(assert (and 
          (eligible-to-claim user) 
          (affects maternity-allowance universal-credit)))

; 7. Check Satisfiability
(check-sat)
(get-model)