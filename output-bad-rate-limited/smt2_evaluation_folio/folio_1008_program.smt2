; Sorts
(declare-sort Person 0)

; Predicates
(declare-fun AttendsWedding (Person) Bool)
(declare-fun GettingMarried (Person) Bool)
(declare-fun KnowsGettingMarried (Person) Bool)
(declare-fun EnjoyMilestones (Person) Bool)
(declare-fun FondOfLargeGroup (Person) Bool)
(declare-fun Outgoing (Person) Bool)
(declare-fun Spirited (Person) Bool)
(declare-fun PreteenOrYoung (Person) Bool)

; Constants
(declare-const carol Person)

; Knowledge base (premises)

; 1. All people who attend weddings are getting married or know the people who are getting married.
(assert (forall ((p Person))
  (=> (AttendsWedding p)
      (or (GettingMarried p) (KnowsGettingMarried p)))))

; 2. No preteens or young children are getting married or know the people who are getting married.
(assert (forall ((p Person))
  (=> (PreteenOrYoung p)
      (and (not (GettingMarried p)) (not (KnowsGettingMarried p))))))

; 3. People who enjoy celebrating life milestone events with other people attend weddings.
(assert (forall ((p Person))
  (=> (EnjoyMilestones p)
      (AttendsWedding p))))

; 4. People who are fond of large group functions enjoy celebrating life milestone events with other people.
(assert (forall ((p Person))
  (=> (FondOfLargeGroup p)
      (EnjoyMilestones p))))

; 5. All people who are outgoing and spirited are fond of large group functions.
(assert (forall ((p Person))
  (=> (and (Outgoing p) (Spirited p))
      (FondOfLargeGroup p))))

; 6. If Carol is not both a pre-teen or young child and attends a wedding,
;    then Carol is not getting married or knows the people who are getting married.
(assert (=> (not (and (PreteenOrYoung carol) (AttendsWedding carol)))
            (and (not (GettingMarried carol))
                 (not (KnowsGettingMarried carol)))))

; Test scenario: "Carol is outgoing and very spirited."
(assert (and (Outgoing carol) (Spirited carol)))

; Query: check satisfiability to determine if the scenario is compatible with the premises
(check-sat)
(get-model)