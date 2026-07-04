; ==============================================================================
; SMT-LIB 2.0 Program for DLA Eligibility Verification
; ==============================================================================
; Reasoning Steps:
; 1. Define the criteria for "Maximum DLA Payment".
;    - Requires BOTH "Highest Care Component" AND "Higher Mobility Component".
; 2. Define criteria for "Highest Care Component".
;    - Requires "supervision throughout both day and night" OR "terminally ill".
; 3. Define criteria for "Higher Mobility Component".
;    - Requires "cannot walk" OR "severe discomfort walking short distance" OR "blind".
; 4. Encode Scenario Facts.
;    - Child is 13 (Eligible age < 16).
;    - "Struggles to walk" implies ability to walk (Contradicts "Cannot Walk").
;    - "Needs extra support" does not explicitly meet "Day AND Night supervision".
;    - We model the scenario as NOT meeting the specific high-tier thresholds 
;      since they are not stated (Closed World Assumption for scenario facts).
; 5. Verification.
;    - Assert the claim: "Child qualifies for Maximum DLA".
;    - Check Satisfiability.
;    - Expected Result: unsat (The claim contradicts the facts/rules).
; ==============================================================================

; 1. Declare Sorts
(declare-sort Person 0)

; 2. Declare Functions (Predicates and Attributes)
(declare-fun age (Person) Int)
(declare-fun can-walk (Person) Bool)
(declare-fun cannot-walk (Person) Bool)
(declare-fun supervision-day-and-night (Person) Bool)
(declare-fun terminally-ill (Person) Bool)
(declare-fun severe-discomfort-walking (Person) Bool)
(declare-fun highest-care-rate (Person) Bool)
(declare-fun higher-mobility-rate (Person) Bool)
(declare-fun qualifies-max-dla (Person) Bool)

; 3. Declare Constants
(declare-const child Person)

; 4. Assert Knowledge Base (Rules from Document)

; Rule: Maximum Payment requires BOTH Highest Care AND Higher Mobility
(assert (forall ((p Person))
  (=> (qualifies-max-dla p)
      (and (highest-care-rate p) (higher-mobility-rate p)))))

; Rule: Highest Care Rate requires (Day/Night Supervision OR Terminally Ill)
(assert (forall ((p Person))
  (=> (highest-care-rate p)
      (or (supervision-day-and-night p) (terminally-ill p)))))

; Rule: Higher Mobility Rate requires (Cannot Walk OR Severe Discomfort OR Blind)
; For this verification, we focus on the walking constraints.
(assert (forall ((p Person))
  (=> (higher-mobility-rate p)
      (or (cannot-walk p) (severe-discomfort-walking p)))))

; Rule: Cannot Walk implies Not Can Walk
(assert (forall ((p Person))
  (=> (cannot-walk p) (not (can-walk p)))))

; Rule: Age Eligibility for DLA (Under 16)
(assert (forall ((p Person))
  (=> (qualifies-max-dla p) (< (age p) 16))))

; Rule: Age Eligibility for Higher Mobility (3 or over)
(assert (forall ((p Person))
  (=> (higher-mobility-rate p) (>= (age p) 3))))

; 5. Assert Scenario Facts

; Fact: Child is 13
(assert (= (age child) 13))

; Fact: "Struggles to walk" implies they CAN walk (contradicts "Cannot Walk")
(assert (can-walk child))

; Fact: "Needs extra support" is stated, but "Day and Night Supervision" is NOT stated.
; Under strict eligibility verification, unmet specific criteria are treated as false.
(assert (not (supervision-day-and-night child)))

; Fact: Not stated as terminally ill
(assert (not (terminally-ill child)))

; Fact: "Struggles" does not imply "Severe Discomfort" explicitly
(assert (not (severe-discomfort-walking child)))

; 6. Verification Test
; Question: "Will I qualify for the maximum DLA payment?"
; We assert the positive claim and check for contradiction.
(assert (qualifies-max-dla child))

; 7. Check Satisfiability
(check-sat)

; 8. Get Model (Will be empty if unsat)
(get-model)