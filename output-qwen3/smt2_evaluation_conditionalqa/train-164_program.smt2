; SMT-LIB 2.0 Program for Sure Start Maternity Grant Eligibility Verification

; 1. Declare Constants (Propositions representing facts and status)
(declare-const lives-in-scotland Bool)
(declare-const receives-qualifying-benefit Bool)
(declare-const within-claim-period Bool)
(declare-const has-existing-children Bool)
(declare-const is-multiple-birth Bool)
(declare-const is-eligible Bool)

; 2. Assert Knowledge Base (General Rules from Document)
; Rule 1: If you live in Scotland, you cannot get the grant
(assert (=> lives-in-scotland (not is-eligible)))

; Rule 2: You must receive a qualifying benefit (e.g., Universal Credit)
(assert (=> (not receives-qualifying-benefit) (not is-eligible)))

; Rule 3: You must claim within the deadline (6 months after birth)
(assert (=> (not within-claim-period) (not is-eligible)))

; Rule 4: If you have existing children under 16, it must be a multiple birth
; Disqualifier: Has existing children AND Not a multiple birth
(assert (=> (and has-existing-children (not is-multiple-birth)) (not is-eligible)))

; Rule 5: Eligibility Condition (If all criteria are met, then eligible)
; Criteria: Not Scotland, Has Benefit, Within Period, (No Existing Children OR Multiple Birth)
(assert (=> (and 
              (not lives-in-scotland) 
              receives-qualifying-benefit 
              within-claim-period 
              (or (not has-existing-children) is-multiple-birth))
            is-eligible))

; 3. Assert Scenario Facts (Specific Case Details)
; Fact: Live in England (Not Scotland)
(assert (not lives-in-scotland))

; Fact: Receive Universal Credit (Qualifying Benefit)
(assert receives-qualifying-benefit)

; Fact: Gave birth 3 weeks ago (Within 6 month claim period)
(assert within-claim-period)

; Fact: Have children aged 2 and 4 (Existing children under 16)
(assert has-existing-children)

; Fact: Gave birth to twins (Multiple birth)
(assert is-multiple-birth)

; 4. Verification Test
; Question: Am I eligible for a Sure Start maternity grant?
; We assert 'is-eligible' to check if it is consistent with the KB and Facts.
; sat = True (Eligible), unsat = False (Not Eligible)
(assert is-eligible)

; 5. Check Satisfiability
(check-sat)
(get-model)