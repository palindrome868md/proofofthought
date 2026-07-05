; Declare sorts
(declare-sort Person 0)

; Declare predicates
(declare-fun ProfessionalAthlete (Person) Bool)
(declare-fun OlympicGoldMedalist (Person) Bool)
(declare-fun FullTimeScientist (Person) Bool)
(declare-fun NobelPhysicsLaureate (Person) Bool)
(declare-fun spendsMostTimeOnSports (Person) Bool)

; Constant Amy
(declare-const Amy Person)

; Knowledge base
; All professional athletes spend most of their time on sports.
(assert (forall ((p Person)) (=> (ProfessionalAthlete p) (spendsMostTimeOnSports p))))
; All Olympic gold medal winners are professional athletes.
(assert (forall ((p Person)) (=> (OlympicGoldMedalist p) (ProfessionalAthlete p))))
; No full-time scientists spend the majority of their time on sports.
(assert (forall ((p Person)) (=> (FullTimeScientist p) (not (spendsMostTimeOnSports p)))))
; All Nobel physics laureates are full-time scientists.
(assert (forall ((p Person)) (=> (NobelPhysicsLaureate p) (FullTimeScientist p))))
; Amy spends the most time on sports, or Amy is an Olympic gold medal winner.
(assert (or (spendsMostTimeOnSports Amy) (OlympicGoldMedalist Amy)))
; If Amy is not a Nobel physics laureate, then Amy is not an Olympic gold medal winner.
(assert (=> (not (NobelPhysicsLaureate Amy)) (not (OlympicGoldMedalist Amy))))

; Test scenario: Negation of the target statement
; Target statement: "Amy is neither a full-time scientist nor an Olympic gold medalist."
; Negation to test: "Amy is a full-time scientist or Amy is an Olympic gold medalist."
(assert (or (FullTimeScientist Amy) (OlympicGoldMedalist Amy)))

(check-sat)