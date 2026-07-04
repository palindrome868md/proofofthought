; Reasoning Steps:
; 1. Analyze Premises:
;    - P1: No athletes never exercise => All athletes exercise. (forall p, Athlete(p) => Exercises(p))
;    - P2: All pro basketball players are athletes. (forall p, ProBB(p) => Athlete(p))
;    - P3: All NBA players are pro basketball players. (forall p, NBA(p) => ProBB(p))
;    - P4: All Knicks players are NBA players. (forall p, Knicks(p) => NBA(p))
;    - P5: (ProBB(John) AND NOT Exercises(John)) OR (NOT ProBB(John) AND Exercises(John)).
; 2. Logical Deduction:
;    - Chain: Knicks => NBA => ProBB => Athlete => Exercises.
;    - Therefore: ProBB => Exercises.
;    - From P5: The first option (ProBB AND NOT Exercises) contradicts the chain.
;    - Thus, the second option must be true: NOT ProBB(John) AND Exercises(John).
;    - Since NOT ProBB(John), by contrapositive of the chain, NOT Knicks(John).
; 3. Entity Mapping:
;    - The question asks about "Jim", but premises specify "John".
;    - To solve the logical puzzle as intended, we assume John and Jim are the same individual.
; 4. Verification Strategy:
;    - Assert the Knowledge Base (P1-P5).
;    - Assert the Statement: "Jim is not a Knicks player" (NOT Knicks(Jim)).
;    - Check Satisfiability.
;    - Expected Result: sat (True).

; 1. Declare Sorts
(declare-sort Person 0)

; 2. Declare Functions (Predicates)
(declare-fun is-athlete (Person) Bool)
(declare-fun is-pro-basketball-player (Person) Bool)
(declare-fun is-nba-player (Person) Bool)
(declare-fun is-knicks-player (Person) Bool)
(declare-fun exercises (Person) Bool)

; 3. Declare Constants
; Using 'jim' for the individual mentioned as 'John' in premises to align with the question statement
(declare-const jim Person)

; 4. Assert Knowledge Base (Premises)

; P1: No athletes never exercise (All athletes exercise)
(assert (forall ((p Person)) 
  (=> (is-athlete p) (exercises p))
))

; P2: All professional basketball players are athletes
(assert (forall ((p Person)) 
  (=> (is-pro-basketball-player p) (is-athlete p))
))

; P3: All NBA players are professional basketball players
(assert (forall ((p Person)) 
  (=> (is-nba-player p) (is-pro-basketball-player p))
))

; P4: All Knicks players are NBA players
(assert (forall ((p Person)) 
  (=> (is-knicks-player p) (is-nba-player p))
))

; P5: Either (ProBB AND NOT Exercises) OR (NOT ProBB AND Exercises)
; Applied to 'jim'
(assert (or 
  (and (is-pro-basketball-player jim) (not (exercises jim)))
  (and (not (is-pro-basketball-player jim)) (exercises jim))
))

; 5. Assert Statement to Verify
; Statement: "Jim is not a Knicks player"
(assert (not (is-knicks-player jim)))

; 6. Check Satisfiability
(check-sat)

; 7. Get Model (to see example values confirming consistency)
(get-model)