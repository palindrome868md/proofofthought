; Declare sort
(declare-sort Entity 0)

; Declare predicates
(declare-fun eel (Entity) Bool)
(declare-fun fish (Entity) Bool)
(declare-fun plant (Entity) Bool)
(declare-fun animal (Entity) Bool)
(declare-fun displayed (Entity) Bool)
(declare-fun multicellular (Entity) Bool)
(declare-fun bacteria (Entity) Bool)

; Declare constant for the sea eel
(declare-const sea_eel Entity)

; Premises
; 1. All eels are fish.
(assert (forall ((x Entity)) (=> (eel x) (fish x))))
; 2. No fish are plants.
(assert (forall ((x Entity)) (=> (fish x) (not (plant x)))))
; 3. Everything displayed in the collection is either a plant or an animal.
(assert (forall ((x Entity)) (=> (displayed x) (or (plant x) (animal x)))))
; 4. All multicellular animals are not bacteria.
(assert (forall ((x Entity)) (=> (multicellular x) (not (bacteria x)))))
; 5. All animals displayed in the collection are multicellular.
(assert (forall ((x Entity)) (=> (and (animal x) (displayed x)) (multicellular x))))
; 6. A sea eel is displayed in the collection.
(assert (displayed sea_eel))
; 7. The sea eel is an eel or an animal or not a plant.
(assert (or (eel sea_eel) (animal sea_eel) (not (plant sea_eel))))

; Test: The sea eel is bacteria.
(assert (bacteria sea_eel))

; Check satisfiability to determine truth value of the statement
(check-sat)
(get-model)