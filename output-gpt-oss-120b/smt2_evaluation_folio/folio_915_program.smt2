; Declare the uninterpreted sort for people
(declare-sort Person 0)

; Declare boolean predicates
(declare-fun professional_athlete (Person) Bool)
(declare-fun spends_most_time_on_sports (Person) Bool)
(declare-fun olympic_gold_winner (Person) Bool)
(declare-fun full_time_scientist (Person) Bool)
(declare-fun nobel_physics_laureate (Person) Bool)

; Declare the constant representing Amy
(declare-const Amy Person)

; Premise 1: All professional athletes spend most of their time on sports.
(assert (forall ((x Person))
        (=> (professional_athlete x)
            (spends_most_time_on_sports x))))

; Premise 2: All Olympic gold medal winners are professional athletes.
(assert (forall ((x Person))
        (=> (olympic_gold_winner x)
            (professional_athlete x))))

; Premise 3: No full‑time scientists spend the majority of their time on sports.
(assert (forall ((x Person))
        (=> (full_time_scientist x)
            (not (spends_most_time_on_sports x)))))

; Premise 4: All Nobel physics laureates are full‑time scientists.
(assert (forall ((x Person))
        (=> (nobel_physics_laureate x)
            (full_time_scientist x))))

; Premise 5: Amy spends the most time on sports, or Amy is an Olympic gold medal winner.
(assert (or (spends_most_time_on_sports Amy)
            (olympic_gold_winner Amy)))

; Premise 6: If Amy is not a Nobel physics laureate, then Amy is not an Olympic gold medal winner.
(assert (=> (not (nobel_physics_laureate Amy))
            (not (olympic_gold_winner Amy))))

; Negation of the target statement:
; Target: (=> (not (olympic_gold_winner Amy)) (nobel_physics_laureate Amy))
; Negation: Amy is not an Olympic gold medal winner AND Amy is not a Nobel physics laureate.
(assert (and (not (olympic_gold_winner Amy))
             (not (nobel_physics_laureate Amy))))

; Check whether the premises together with the negation are satisfiable.
(check-sat)
(get-model)