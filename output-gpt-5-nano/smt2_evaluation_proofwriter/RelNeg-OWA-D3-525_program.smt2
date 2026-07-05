; Declare sorts
(declare-sort Rabbit 0)

; Declare constants
(declare-const rabbit Rabbit)

; Declare predicates
(declare-fun blue (Rabbit) Bool)
(declare-fun green (Rabbit) Bool)
(declare-fun round (Rabbit) Bool)
(declare-fun red (Rabbit) Bool)
(declare-fun cold (Rabbit) Bool)

; Knowledge base
(assert blue rabbit)
(assert (forall ((x Rabbit)) (=> (blue x) (green x))))
(assert (forall ((x Rabbit)) (=> (and (green x) (round x)) (not (blue x)))))
(assert (=> (green rabbit) (cold rabbit)))
(assert (forall ((x Rabbit)) (=> (and (green x) (not (blue x))) (not (cold x)))))
(assert (forall ((x Rabbit)) (=> (round x) (not (red x)))))
(assert (forall ((x Rabbit)) (=> (cold x) (not (red x)))))
(assert (forall ((x Rabbit)) (=> (round x) (red x))))
(assert (=> (cold rabbit) (not (red rabbit))))

; Test: The rabbit is not green
(assert (not (green rabbit)))

; Check satisfiability
(check-sat)