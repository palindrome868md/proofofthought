;-------------------------------------------------
; Sorts
(declare-sort Person 0)

;-------------------------------------------------
; Predicates (functions returning Bool)
(declare-fun athlete (Person) Bool)
(declare-fun never_exercises (Person) Bool)
(declare-fun sometimes_exercises (Person) Bool)
(declare-fun professional_basketball_player (Person) Bool)
(declare-fun nba_player (Person) Bool)
(declare-fun knicks_player (Person) Bool)

;-------------------------------------------------
; Individuals
(declare-const john Person)
(declare-const jim  Person)

;-------------------------------------------------
; Knowledge base (premises)

; No athletes never exercise.
(assert (forall ((x Person))
        (=> (athlete x) (not (never_exercises x)))))

; All professional basketball players are athletes.
(assert (forall ((x Person))
        (=> (professional_basketball_player x) (athlete x))))

; All NBA players are professional basketball players.
(assert (forall ((x Person))
        (=> (nba_player x) (professional_basketball_player x))))

; All Knicks players are NBA players.
(assert (forall ((x Person))
        (=> (knicks_player x) (nba_player x))))

; Either John is a professional basketball player and never exercises,
; or he is not a professional basketball player and sometimes exercises.
(assert (or (and (professional_basketball_player john) (never_exercises john))
            (and (not (professional_basketball_player john)) (sometimes_exercises john))))

;-------------------------------------------------
; Test the statement by asserting its negation
(assert (not (knicks_player jim)))

;-------------------------------------------------
; Single satisfiability query (answers the question)
(check-sat)
(get-model)