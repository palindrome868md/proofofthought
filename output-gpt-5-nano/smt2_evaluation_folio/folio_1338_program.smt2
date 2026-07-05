; Sorts
(declare-sort Entity 0)

; Constants
(declare-const sea-eel Entity)

; Predicates
(declare-fun is-eel (Entity) Bool)
(declare-fun is-fish (Entity) Bool)
(declare-fun is-plant (Entity) Bool)
(declare-fun is-animal (Entity) Bool)
(declare-fun is-bacteria (Entity) Bool)
(declare-fun is-multicellular (Entity) Bool)
(declare-fun displayed (Entity) Bool)

; Premises
(assert (forall ((x Entity)) (=> (is-eel x) (is-fish x))))
(assert (forall ((x Entity)) (=> (is-fish x) (not (is-plant x)))))
(assert (forall ((x Entity)) (=> (displayed x) (or (is-plant x) (is-animal x)))))
(assert (forall ((x Entity)) (=> (and (is-animal x) (is-multicellular x)) (not (is-bacteria x)))))
(assert (forall ((x Entity)) (=> (and (is-animal x) (displayed x)) (is-multicellular x))))
(assert (displayed sea-eel))
(assert (or (is-eel sea-eel) (is-animal sea-eel) (not (is-plant sea-eel))))

; Query: The sea eel is multicellular or is bacteria.
(assert (or (is-multicellular sea-eel) (is-bacteria sea-eel)))

; Check satisfiability
(check-sat)
(get-model)