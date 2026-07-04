; 1. Declare sorts
(declare-sort Ship 0)
(declare-sort Location 0)
(declare-sort SalinityLevel 0)
(declare-sort PreservationState 0)

; 2. Declare constants
(declare-const titanic Ship)
(declare-const gulf-of-finland Location)
(declare-const low-salinity SalinityLevel)
(declare-const high-salinity SalinityLevel)
(declare-const well-preserved PreservationState)
(declare-const poorly-preserved PreservationState)

; 3. Declare functions
(declare-fun is-ship (Ship) Bool)
(declare-fun get-salinity (Location) SalinityLevel)
(declare-fun get-preservation-state (SalinityLevel) PreservationState)
(declare-fun would-be-preserved (Ship Location) Bool)

; 4. Assert knowledge base (facts)

; Fact: Titanic is a ship
(assert (is-ship titanic))

; Fact: Gulf of Finland has low salinity
(assert (= (get-salinity gulf-of-finland) low-salinity))

; Rule: Low salinity leads to well-preserved state
(assert (= (get-preservation-state low-salinity) well-preserved))

; Rule: High salinity leads to poorly-preserved state
(assert (= (get-preservation-state high-salinity) poorly-preserved))

; Rule: A ship would be well preserved in a location if the location's salinity yields well-preserved state
(assert (forall ((s Ship) (l Location))
  (=> (and (is-ship s) 
           (= (get-preservation-state (get-salinity l)) well-preserved))
      (would-be-preserved s l))))

; 5. Test Scenario: Would the Titanic be well preserved at the bottom of the Gulf of Finland?
; We assert the positive scenario and check for satisfiability.
; If Sat, it means the scenario is consistent/true given the KB.
(assert (would-be-preserved titanic gulf-of-finland))

; 6. Check satisfiability
(check-sat)
(get-model)