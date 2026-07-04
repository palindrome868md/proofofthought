;--- Sort declaration -------------------------------------------------
(declare-sort Entity 0)

;--- Predicate declarations -------------------------------------------
(declare-fun eel (Entity) Bool)
(declare-fun fish (Entity) Bool)
(declare-fun plant (Entity) Bool)
(declare-fun animal (Entity) Bool)
(declare-fun multicellular (Entity) Bool)
(declare-fun bacteria (Entity) Bool)
(declare-fun displayed (Entity) Bool)

;--- Constant representing the sea eel --------------------------------
(declare-const sea-eel Entity)

;--- Premises ----------------------------------------------------------

; 1. All eels are fish.
(assert (forall ((x Entity))
  (=> (eel x) (fish x))))

; 2. No fish are plants.
(assert (forall ((x Entity))
  (=> (fish x) (not (plant x)))))

; 3. Everything displayed in the collection is either a plant or an animal.
(assert (forall ((x Entity))
  (=> (displayed x) (or (plant x) (animal x)))))

; 4. All multicellular animals are not bacteria.
(assert (forall ((x Entity))
  (=> (and (multicellular x) (animal x))
      (not (bacteria x)))))

; 5. All animals displayed in the collection are multicellular.
(assert (forall ((x Entity))
  (=> (and (animal x) (displayed x))
      (multicellular x))))

; 6. A sea eel is displayed in the collection.
(assert (displayed sea-eel))

; 7. The sea eel is an eel or an animal or not a plant.
(assert (or (eel sea-eel)
            (animal sea-eel)
            (not (plant sea-eel))))

;--- Statement to be tested -------------------------------------------
; "The sea eel is bacteria."
(assert (bacteria sea-eel))

;--- Check satisfiability ---------------------------------------------
(check-sat)
(get-model)