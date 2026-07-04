; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare functions (predicates)
(declare-fun AttendsWedding (Person) Bool)
(declare-fun GettingMarried (Person) Bool)
(declare-fun KnowsCouple (Person) Bool)
(declare-fun Preteen (Person) Bool)
(declare-fun YoungChild (Person) Bool)
(declare-fun EnjoysCelebrating (Person) Bool)
(declare-fun FondLargeGroup (Person) Bool)
(declare-fun Outgoing (Person) Bool)
(declare-fun Spirited (Person) Bool)

; 3. Declare constants
(declare-const Carol Person)

; 4. Assert knowledge base (premises)

; Premise 1: All people who attend weddings are getting married or know the people who are getting married.
(assert (forall ((p Person))
  (=> (AttendsWedding p)
      (or (GettingMarried p) (KnowsCouple p)))))

; Premise 2: No preteens or young children are getting married or know the people who are getting married.
(assert (forall ((p Person))
  (=> (or (Preteen p) (YoungChild p))
      (not (or (GettingMarried p) (KnowsCouple p))))))

; Premise 3: People who enjoy celebrating life milestone events with other people attend weddings.
(assert (forall ((p Person))
  (=> (EnjoysCelebrating p)
      (AttendsWedding p))))

; Premise 4: People who are fond of large group functions enjoy celebrating life milestone events with other people.
(assert (forall ((p Person))
  (=> (FondLargeGroup p)
      (EnjoysCelebrating p))))

; Premise 5: All people who are outgoing and spirited are fond of large group functions.
(assert (forall ((p Person))
  (=> (and (Outgoing p) (Spirited p))
      (FondLargeGroup p))))

; Premise 6: If Carol is not both a pre-teen or young child and attends a wedding, 
; then Carol is not getting married or knows the people who are getting married.
(assert (=> 
  (not (and (or (Preteen Carol) (YoungChild Carol)) (AttendsWedding Carol)))
  (not (or (GettingMarried Carol) (KnowsCouple Carol)))))

; 5. Assert the statement to be verified
; Statement: Carol neither enjoys celebrating life milestone events with other people 
; nor is outgoing and very spirited.
(assert (and 
  (not (EnjoysCelebrating Carol))
  (not (and (Outgoing Carol) (Spirited Carol)))))

; 6. Check satisfiability
(check-sat)
(get-model)