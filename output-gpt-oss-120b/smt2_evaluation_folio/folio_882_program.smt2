; -------------------------------------------------
; 1. Declare the uninterpreted sort for persons
; -------------------------------------------------
(declare-sort Person 0)

; -------------------------------------------------
; 2. Declare predicates (functions returning Bool)
; -------------------------------------------------
(declare-fun athlete (Person) Bool)
(declare-fun pro_basketball_player (Person) Bool)
(declare-fun nba_player (Person) Bool)
(declare-fun knicks_player (Person) Bool)

; Exercise‑related predicates
(declare-fun never_exercise (Person) Bool)
(declare-fun sometimes_exercise (Person) Bool)

; -------------------------------------------------
; 3. Declare the individuals mentioned
; -------------------------------------------------
(declare-const john Person)
(declare-const jim  Person)

; -------------------------------------------------
; 4. Encode the premises
; -------------------------------------------------

; No athletes never exercise.
(assert (forall ((x Person))
        (=> (athlete x) (not (never_exercise x)))))

; All professional basketball players are athletes.
(assert (forall ((x Person))
        (=> (pro_basketball_player x) (athlete x))))

; All NBA players are professional basketball players.
(assert (forall ((x Person))
        (=> (nba_player x) (pro_basketball_player x))))

; All Knicks players are NBA players.
(assert (forall ((x Person))
        (=> (knicks_player x) (nba_player x))))

; Either John is a professional basketball player and never exercises,
; or he is not a professional basketball player and sometimes exercises.
(assert (or
          (and (pro_basketball_player john) (never_exercise john))
          (and (not (pro_basketball_player john)) (sometimes_exercise john))))

; -------------------------------------------------
; 5. Negation of the target statement:
;    "Jim is not a Knicks player"  ==>  (not (knicks_player jim))
;    We assert its opposite to test entailment.
; -------------------------------------------------
(assert (knicks_player jim))

; -------------------------------------------------
; 6. Check satisfiability
; -------------------------------------------------
(check-sat)
(get-model)