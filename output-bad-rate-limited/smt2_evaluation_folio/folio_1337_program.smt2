; Sorts
(declare-sort Thing 0)

; Predicates
(declare-fun eel (Thing) Bool)
(declare-fun fish (Thing) Bool)
(declare-fun plant (Thing) Bool)
(declare-fun animal (Thing) Bool)
(declare-fun displayed (Thing) Bool)
(declare-fun multicellular (Thing) Bool)
(declare-fun bacteria (Thing) Bool)

; Constants
(declare-const sea_eel Thing)

; Knowledge base (premises)

; 1. All eels are fish.
(assert (forall ((x Thing)) (=> (eel x) (fish x))))

; 2. No fish are plants.
(assert (forall ((x Thing)) (=> (fish x) (not (plant x)))))

; 3. Everything displayed in the collection is either a plant or an animal.
(assert (forall ((x Thing)) (=> (displayed x) (or (plant x) (animal x)))))

; 4. All multicellular animals are not bacteria.
(assert (forall ((x Thing)) (=> (and (multicellular x) (animal x)) (not (bacteria x)))))

; 5. All animals displayed in the collection are multicellular.
(assert (forall ((x Thing)) (=> (and (displayed x) (animal x)) (multicellular x))))

; 6. A sea eel is displayed in the collection.
(assert (displayed sea_eel))
; Sea eel is an eel
(assert (eel sea_eel))

; 7. The sea eel is an eel or an animal or not a plant.
(assert (or (eel sea_eel) (animal sea_eel) (not (plant sea_eel))))

; Test: Is the sea eel a bacteria?
; We assert the statement to test
(assert (bacteria sea_eel))

; Check satisfiability (one and only one check-sat as required)
(check-sat)
(get-model)