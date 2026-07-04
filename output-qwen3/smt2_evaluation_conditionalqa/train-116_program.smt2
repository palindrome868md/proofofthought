; Budgeting Loan Eligibility Verification
; Based on UK Government Guidelines
; 
; Question: Am I eligible for a Budgeting Loan?
; Scenario: Just moved to new home, need furniture and white goods, need financial boost

; ============================================
; 1. DECLARE SORTS
; ============================================
(declare-sort Person 0)
(declare-sort Benefit 0)

; ============================================
; 2. DECLARE CONSTANTS
; ============================================
(declare-const me Person)

; Qualifying benefits (must have 6+ months)
(declare-const income-support Benefit)
(declare-const jsallowance Benefit)
(declare-const esa Benefit)
(declare-const pension-credit Benefit)

; ============================================
; 3. DECLARE FUNCTIONS
; ============================================
; Benefit reception and duration
(declare-fun receiving-benefit (Person Benefit) Bool)
(declare-fun benefit-duration-months (Person Benefit) Int)

; Disqualifying conditions
(declare-fun claiming-universal-credit (Person) Bool)
(declare-fun in-industrial-action (Person) Bool)
(declare-fun owes-loans (Person) Int)

; Purpose and eligibility
(declare-fun has-valid-purpose (Person) Bool)
(declare-fun eligible-for-budgeting-loan (Person) Bool)

; ============================================
; 4. ASSERT KNOWLEDGE BASE (Eligibility Rules)
; ============================================

; Rule 1: Must have qualifying benefit for 6+ months
(assert (forall ((p Person))
  (=> (eligible-for-budgeting-loan p)
      (or 
        (and (receiving-benefit p income-support) (>= (benefit-duration-months p income-support) 6))
        (and (receiving-benefit p jsallowance) (>= (benefit-duration-months p jsallowance) 6))
        (and (receiving-benefit p esa) (>= (benefit-duration-months p esa) 6))
        (and (receiving-benefit p pension-credit) (>= (benefit-duration-months p pension-credit) 6))
      ))))

; Rule 2: Cannot be claiming Universal Credit
(assert (forall ((p Person))
  (=> (eligible-for-budgeting-loan p)
      (not (claiming-universal-credit p)))))

; Rule 3: Cannot be in industrial action
(assert (forall ((p Person))
  (=> (eligible-for-budgeting-loan p)
      (not (in-industrial-action p)))))

; Rule 4: Cannot owe more than £1500 in Crisis/Budgeting Loans
(assert (forall ((p Person))
  (=> (eligible-for-budgeting-loan p)
      (<= (owes-loans p) 1500))))

; Rule 5: Valid purposes include furniture, white goods, moving costs
; (from document: "furniture or household items", "costs linked to moving house")
(assert (forall ((p Person))
  (=> (has-valid-purpose p)
      (or 
        ; furniture/white goods
        true  
        ; moving costs
        true))))

; ============================================
; 5. ASSERT SCENARIO FACTS
; ============================================

; Fact 1: Just moved to new home (valid purpose - moving costs)
(assert (has-valid-purpose me))

; Fact 2: Need furniture and white goods (valid purpose)
(assert (has-valid-purpose me))

; Note: Critical information NOT provided in scenario:
; - Benefit history for past 6 months (REQUIRED for eligibility)
; - Universal Credit status (DISQUALIFIER if claiming)
; - Industrial action status (DISQUALIFIER if involved)
; - Existing loan debt (DISQUALIFIER if >£1500)

; ============================================
; 6. VERIFICATION TEST
; ============================================
; Question: Am I eligible for a Budgeting Loan?
; 
; Strategy: Test if eligibility is POSSIBLE given known facts
; - If sat: Eligibility is possible (not ruled out by known information)
; - If unsat: Eligibility is impossible (contradicts known facts)
;
; Since benefit history is unknown, we test if there EXISTS a consistent
; assignment where all eligibility criteria could be met.

(assert (eligible-for-budgeting-loan me))

; ============================================
; 7. CHECK SATISFIABILITY
; ============================================
(check-sat)
(get-model)

; ============================================
; EXPECTED RESULT ANALYSIS:
; ============================================
; Result: sat (satisfiable)
; 
; Interpretation: Eligibility is POSSIBLE but NOT GUARANTEED
; 
; Reasoning:
; - Valid purpose: YES (furniture, white goods, moving costs are covered)
; - Benefit history: UNKNOWN (critical - need 6+ months of qualifying benefits)
; - Universal Credit: UNKNOWN (disqualifier if claiming)
; - Industrial action: UNKNOWN (disqualifier if involved)
; - Existing loans: UNKNOWN (disqualifier if >£1500)
;
; CONCLUSION: Cannot definitively determine eligibility from scenario alone.
; The person MUST verify they meet the 6-month benefit requirement and
; are not disqualified by Universal Credit, industrial action, or excessive debt.