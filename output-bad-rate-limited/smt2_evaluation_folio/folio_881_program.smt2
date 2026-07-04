; Sorts
(declare-sort Person 0)

; Predicates / Functions
(declare-fun is-athlete (Person) Bool)
(declare-fun professional_basketball_player (Person) Bool)
(declare-fun nba_player (Person) Bool)
(declare-fun knicks_player (Person) Bool)
(declare-fun never_exercises (Person) Bool)
(declare-fun exercises (Person) Bool)

; Constants
(declare-const jim Person)
(declare-const john Person)

; Premises
; 1. No athletes never exercise.
(assert (forall ((p Person))
  (=> (is-athlete p)
      (not (never_exercises p)))))

; 2. All professional basketball players are athletes.
(assert (forall ((p Person))
  (=> (professional_basketball_player p)
      (is-athlete p))))

; 3. All NBA players are professional basketball players.
(assert (forall ((p Person))
  (=> (nba_player p)
      (professional_basketball_player p))))

; 4. All Knicks players are NBA players.
(assert (forall ((p Person))
  (=> (knicks_player p)
      (nba_player p))))

; 5. John case: Either John is pro basketball player and never exercises, or not pro and exercises.
(assert (or (and (professional_basketball_player john) (never_exercises john))
            (and (not (professional_basketball_player john)) (exercises john))))

; Test scenario: Jim is a Knicks player.
(assert (knicks_player jim))

; Check satisfiability
(check-sat)
(get-model)