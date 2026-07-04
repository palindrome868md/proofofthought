; ==============================================================================
; Reasoning Steps for Carer's Allowance Eligibility Verification
; ==============================================================================
; 1. Analyze Eligibility Criteria (from Document):
;    - Care Hours: Must spend at least 35 hours a week caring.
;    - Earnings: Must be £128 or less a week (after tax/NI/expenses).
;    - Partner's Benefit: Partner must receive qualifying benefit (e.g., DLA higher rate).
;    - Residency: Must normally live in England, Scotland, or Wales.
;
; 2. Analyze Scenario Facts:
;    - Care Hours: Approximately 30 hrs per week.
;    - Earnings: Approximately £500 pcm -> £500 * 12 / 52 ≈ £115 per week.
;    - Partner's Benefit: Disability Living Allowance (higher rate).
;    - Residency: Lives in Scotland.
;
; 3. Logical Deduction:
;    - Care Hours Check: 30 < 35. (FAILS eligibility requirement).
;    - Earnings Check: 115 <= 128. (PASSES eligibility requirement).
;    - Benefit Check: DLA higher rate is qualifying. (PASSES).
;    - Residency Check: Scotland is valid. (PASSES).
;
; 4. Verification Strategy:
;    - Assert Knowledge Base (Rules imply Eligibility => Conditions).
;    - Assert Scenario Facts (Conditions values).
;    - Assert Hypothesis: (eligible-for-carers-allowance user).
;    - Check Satisfiability.
;    - Expected Result: unsat (because Care Hours condition contradicts Eligibility).
;      'unsat' means the hypothesis "User is eligible" is False.
; ==============================================================================

; 1. Declare Sorts
(declare-sort Person 0)
(declare-sort Benefit 0)
(declare-sort Location 0)

; 2. Declare Functions
(declare-fun care-hours (Person) Int)
(declare-fun weekly-earnings (Person) Int)
(declare-fun receives-benefit (Person Benefit) Bool)
(declare-fun lives-in (Person Location) Bool)
(declare-fun cares-for (Person Person) Bool)
(declare-fun eligible-for-carers-allowance (Person) Bool)

; 3. Declare Constants
(declare-const user Person)
(declare-const partner Person)
(declare-const dla-higher Benefit)
(declare-const scotland Location)
(declare-const england Location)
(declare-const wales Location)

; 4. Assert Knowledge Base (Eligibility Rules)

; Rule 1: Must spend at least 35 hours a week caring
(assert (forall ((p Person))
  (=> (eligible-for-carers-allowance p)
      (>= (care-hours p) 35))))

; Rule 2: Earnings must be £128 or less a week
(assert (forall ((p Person))
  (=> (eligible-for-carers-allowance p)
      (<= (weekly-earnings p) 128))))

; Rule 3: Person cared for must receive qualifying benefit (DLA higher rate is qualifying)
(assert (forall ((p Person) (c Person))
  (=> (and (eligible-for-carers-allowance p) (cares-for p c))
      (receives-benefit c dla-higher))))

; Rule 4: Residency (England, Scotland, or Wales)
(assert (forall ((p Person))
  (=> (eligible-for-carers-allowance p)
      (or (lives-in p england)
          (lives-in p scotland)
          (lives-in p wales)))))

; 5. Assert Scenario Facts

; User cares for partner 30 hours/week
(assert (= (care-hours user) 30))

; User earns £500 pcm. Approx £115/week (500 * 12 / 52 = 115.38)
(assert (= (weekly-earnings user) 115))

; Partner receives DLA higher rate
(assert (receives-benefit partner dla-higher))

; User lives in Scotland
(assert (lives-in user scotland))

; User cares for partner
(assert (cares-for user partner))

; 6. Verification
; Question: Can I claim Carer's Allowance?
; We assert that the user IS eligible and check for consistency.
; If unsat, it means the user CANNOT claim (eligibility contradicts facts/rules).
(assert (eligible-for-carers-allowance user))

(check-sat)
(get-model)