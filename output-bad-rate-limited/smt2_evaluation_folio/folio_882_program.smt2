; Declare sorts
(declare-sort Person 0)

; Declare constants
(declare-const john Person)
(declare-const jim  Person)

; Declare predicates
(declare-fun athlete (Person) Bool)
(declare-fun professional_basketball_player (Person) Bool)
(declare-fun nba_player (Person) Bool)
(declare-fun knicks_player (Person) Bool)
(declare-fun exercises (Person) Bool)

; Knowledge base

; 1) No athletes never exercise -> athlete -> exercises
(assert (forall ((x Person))
  (=> (athlete x) (exercises x))))

; 2) All professional basketball players are athletes
(assert (forall ((x Person))
  (=> (professional_basketball_player x) (athlete x))))

; 3) All NBA players are professional basketball players
(assert (forall ((x Person))
  (=> (nba_player x) (professional_basketball_player x))))

; 4) All Knicks players are NBA players
(assert (forall ((x Person))
  (=> (knicks_player x) (nba_player x))))

; 5) John's dichotomy: (PB(J) and not exercises(J)) or (not PB(J) and exercises(J))
(assert (or
  (and (professional_basketball_player john) (not (exercises john)))
  (and (not (professional_basketball_player john)) (exercises john))))

; Test scenario: "Jim is not a Knicks player."
(assert (not (knicks_player jim)))

; Check satisfiability and obtain a model
(check-sat)
(get-model)