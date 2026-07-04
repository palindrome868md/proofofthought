; Sorts
(declare-sort Person 0)

; Predicates / Functions
(declare-fun SpendsMostSports (Person) Bool)
(declare-fun ProfessionalAthlete (Person) Bool)
(declare-fun OlympicGoldWinner (Person) Bool)
(declare-fun FullTimeScientist (Person) Bool)
(declare-fun NobelPhysicsLaureate (Person) Bool)

; Constants
(declare-const amy Person)

; Knowledge base (premises)
(assert (forall ((x Person))
  (=> (ProfessionalAthlete x) (SpendsMostSports x))))
(assert (forall ((x Person))
  (=> (OlympicGoldWinner x) (ProfessionalAthlete x))))
(assert (forall ((x Person))
  (=> (FullTimeScientist x) (not (SpendsMostSports x)))))
(assert (forall ((x Person))
  (=> (NobelPhysicsLaureate x) (FullTimeScientist x))))
(assert (or (SpendsMostSports amy) (OlympicGoldWinner amy)))
(assert (=> (not (NobelPhysicsLaureate amy)) (not (OlympicGoldWinner amy))))

; Query: Is the statement "If Amy is not an Olympic gold medal winner, then Amy is a Nobel physics laureate" entailed?
; We test entailment by checking the negation of the statement:
; not ((not OlympicGoldWinner(amy)) -> NobelPhysicsLaureate(amy))
(assert (not (=> (not (OlympicGoldWinner amy)) (NobelPhysicsLaureate amy))))

; Check satisfiability (will be SAT if the statement is not entailed)
(check-sat)
(get-model)