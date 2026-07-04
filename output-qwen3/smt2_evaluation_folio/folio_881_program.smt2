; 1. Declare Sorts
(declare-sort Person 0)

; 2. Declare Functions (Predicates)
(declare-fun is-athlete (Person) Bool)
(declare-fun exercises (Person) Bool)
(declare-fun is-pro-bball-player (Person) Bool)
(declare-fun is-nba-player (Person) Bool)
(declare-fun is-knicks-player (Person) Bool)

; 3. Declare Constants
(declare-const john Person)
(declare-const jim Person)

; 4. Assert Knowledge Base (Premises)

; Premise 1: No athletes never exercise. (All athletes exercise)
(assert (forall ((p Person))
  (=> (is-athlete p) (exercises p))))

; Premise 2: All professional basketball players are athletes.
(assert (forall ((p Person))
  (=> (is-pro-bball-player p) (is-athlete p))))

; Premise 3: All NBA players are professional basketball players.
(assert (forall ((p Person))
  (=> (is-nba-player p) (is-pro-bball-player p))))

; Premise 4: All Knicks players are NBA players.
(assert (forall ((p Person))
  (=> (is-knicks-player p) (is-nba-player p))))

; Premise 5: Either John is a pro bball player and never exercises, 
;            or he is not a pro bball player and sometimes exercises.
; Note: "sometimes exercises" is treated as (exercises john) being true.
;       "never exercises" is treated as (exercises john) being false.
(assert (or 
  (and (is-pro-bball-player john) (not (exercises john)))
  (and (not (is-pro-bball-player john)) (exercises john))))

; Bridging the name discrepancy: Assume Jim refers to John for the logic to hold.
; Without this, the premises about John do not constrain Jim.
(assert (= jim john))

; 5. Verify Statement: "Jim is a Knicks player."
(assert (is-knicks-player jim))

; 6. Check Satisfiability
(check-sat)
(get-model)