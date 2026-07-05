; Declare sorts
(declare-sort Person 0)

; Declare predicates (functions)
(declare-fun preteen_or_young_child (Person) Bool)
(declare-fun attends_wedding (Person) Bool)
(declare-fun getting_married   (Person) Bool)
(declare-fun knows_getting_married (Person) Bool)
(declare-fun enjoys_life_milestones (Person) Bool)
(declare-fun fond_of_large_group_functions (Person) Bool)
(declare-fun outgoing_and_spirited (Person) Bool)

; Declare constants
(declare-const carol Person)

; Knowledge base

; 1) Attending weddings implies getting married or knowing the couple
(assert (forall ((p Person))
  (=> (attends_wedding p)
      (or (getting_married p) (knows_getting_married p)))))

; 2) No preteens or young children are getting married or know the people who are getting married
(assert (forall ((p Person))
  (=> (preteen_or_young_child p)
      (and (not (getting_married p)) (not (knows_getting_married p))))))

; 3) People who enjoy celebrating life milestone events attend weddings
(assert (forall ((p Person))
  (=> (enjoys_life_milestones p)
      (attends_wedding p))))

; 4) People fond of large group functions enjoy celebrating life milestone events
(assert (forall ((p Person))
  (=> (fond_of_large_group_functions p)
      (enjoys_life_milestones p))))

; 5) Outgoing and spirited people are fond of large group functions
(assert (forall ((p Person))
  (=> (outgoing_and_spirited p)
      (fond_of_large_group_functions p))))

; 6) If Carol is not both a pre-teen/young child and attends a wedding,
;    then Carol is not getting married or knows the people who are getting married
(assert (=> (not (and (preteen_or_young_child carol) (attends_wedding carol)))
            (or (not (getting_married carol)) (knows_getting_married carol))))

; Test statement: Carol neither enjoys celebrating life milestone events with others nor is outgoing and very spirited
(assert (and (not (enjoys_life_milestones carol))
             (not (outgoing_and_spirited carol))))

; Check satisfiability and provide a model
(check-sat)
(get-model)