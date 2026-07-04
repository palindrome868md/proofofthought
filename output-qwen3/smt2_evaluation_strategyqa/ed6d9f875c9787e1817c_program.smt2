; Reasoning Steps:
; 1. Entities: George Washington (Person), Compact Disc (Technology).
; 2. Facts: Washington died in 1799. Compact Disc invented in 1982.
; 3. Logic: Live recording requires the person to be alive when the technology exists.
;    Constraint: death_year(person) >= invention_year(technology).
; 4. Test: Assert (recorded_live_to george-washington compact-disc).
; 5. Verification: 1799 >= 1982 is False. Expected result: unsat (Impossible).

; 1. Declare sorts
(declare-sort Person 0)
(declare-sort Technology 0)

; 2. Declare functions
(declare-fun death_year (Person) Int)
(declare-fun invention_year (Technology) Int)
(declare-fun recorded_live_to (Person Technology) Bool)

; 3. Declare constants
(declare-const george-washington Person)
(declare-const compact-disc Technology)

; 4. Assert knowledge base (facts)
; George Washington died in 1799
(assert (= (death_year george-washington) 1799))
; Compact Disc was invented in 1982
(assert (= (invention_year compact-disc) 1982))

; Rule: To be recorded live to a technology, the person must be alive when the technology exists.
; Therefore, the person's death year must be greater than or equal to the technology's invention year.
(assert (forall ((p Person) (t Technology))
  (=> (recorded_live_to p t)
      (>= (death_year p) (invention_year t)))))

; 5. Assert the scenario being tested
; Question: Could George Washington's own speeches have been recorded live to a compact disc?
; We assert that it happened to check for consistency.
(assert (recorded_live_to george-washington compact-disc))

; 6. Check satisfiability
(check-sat)
(get-model)