;--- Sorts ---------------------------------------------------------
(declare-sort Entity 0)

;--- Predicates ----------------------------------------------------
(declare-fun Eel (Entity) Bool)
(declare-fun Fish (Entity) Bool)
(declare-fun Plant (Entity) Bool)
(declare-fun Animal (Entity) Bool)
(declare-fun Multicellular (Entity) Bool)
(declare-fun Bacteria (Entity) Bool)
(declare-fun Displayed (Entity) Bool)

;--- Constant ------------------------------------------------------
(declare-const sea_eel Entity)

;--- Knowledge base (premises) -------------------------------------

; 1. All eels are fish.
(assert (forall ((x Entity)) (=> (Eel x) (Fish x))))

; 2. No fish are plants.
(assert (forall ((x Entity)) (=> (Fish x) (not (Plant x)))))

; 3. Everything displayed in the collection is either a plant or an animal.
(assert (forall ((x Entity)) (=> (Displayed x) (or (Plant x) (Animal x)))))

; 4. All multicellular animals are not bacteria.
(assert (forall ((x Entity))
          (=> (and (Multicellular x) (Animal x))
              (not (Bacteria x)))))

; 5. All animals displayed in the collection are multicellular.
(assert (forall ((x Entity))
          (=> (and (Animal x) (Displayed x))
              (Multicellular x))))

; 6. A sea eel is displayed in the collection.
(assert (Displayed sea_eel))

; 7. The sea eel is an eel or an animal or not a plant.
(assert (or (Eel sea_eel) (Animal sea_eel) (not (Plant sea_eel))))

;--- Test the negation of the target statement --------------------
; Target: (Multicellular sea_eel) OR (Bacteria sea_eel)
; Negation: (not Multicellular) AND (not Bacteria)
(assert (and (not (Multicellular sea_eel))
             (not (Bacteria sea_eel))))

;--- Check satisfiability -----------------------------------------
(check-sat)
(get-model)