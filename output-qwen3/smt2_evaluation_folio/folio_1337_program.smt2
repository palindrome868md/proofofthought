; Reasoning Steps:
; 1. Define the domain: We need a sort for entities (Obj).
; 2. Define predicates: is-eel, is-fish, is-plant, is-animal, is-multicellular, is-bacteria, is-displayed.
; 3. Translate Premises into Assertions:
;    - P1: All eels are fish. (forall x, is-eel(x) => is-fish(x))
;    - P2: No fish are plants. (forall x, is-fish(x) => not is-plant(x))
;    - P3: Everything displayed is plant or animal. (forall x, is-displayed(x) => is-plant(x) or is-animal(x))
;    - P4: All multicellular animals are not bacteria. (forall x, (is-multicellular(x) and is-animal(x)) => not is-bacteria(x))
;    - P5: All animals displayed are multicellular. (forall x, (is-animal(x) and is-displayed(x)) => is-multicellular(x))
;    - P6: A sea eel is displayed. (is-displayed(sea-eel))
;    - P7: The sea eel is an eel or an animal or not a plant. (is-eel(sea-eel) or is-animal(sea-eel) or not is-plant(sea-eel))
; 4. Translate Statement into Assertion:
;    - Statement: The sea eel is bacteria. (is-bacteria(sea-eel))
; 5. Verification Logic:
;    - If we assert the Statement along with the Premises and get 'unsat', the Statement is False (contradiction).
;    - If we get 'sat', the Statement is Consistent (could be True).
;    - Logical Deduction: 
;      - sea-eel is displayed (P6).
;      - Thus, sea-eel is Plant or Animal (P3).
;      - If Plant: P7 implies (Eel or Animal). Eel->Fish->Not Plant (P1, P2), contradiction. So must be Animal.
;      - If Animal: P5 implies Multicellular. P4 implies Not Bacteria.
;      - If Not Plant (and thus Animal via P3): P5 implies Multicellular. P4 implies Not Bacteria.
;      - In all cases, sea-eel is Not Bacteria.
;    - Therefore, asserting (is-bacteria sea-eel) should result in 'unsat'.

; --- SMT-LIB 2.0 Program ---

; 1. Declare Sorts
(declare-sort Obj 0)

; 2. Declare Functions (Predicates)
(declare-fun is-eel (Obj) Bool)
(declare-fun is-fish (Obj) Bool)
(declare-fun is-plant (Obj) Bool)
(declare-fun is-animal (Obj) Bool)
(declare-fun is-multicellular (Obj) Bool)
(declare-fun is-bacteria (Obj) Bool)
(declare-fun is-displayed (Obj) Bool)

; 3. Declare Constants
(declare-const sea-eel Obj)

; 4. Assert Knowledge Base (Premises)

; Premise 1: All eels are fish
(assert (forall ((x Obj)) (=> (is-eel x) (is-fish x))))

; Premise 2: No fish are plants
(assert (forall ((x Obj)) (=> (is-fish x) (not (is-plant x)))))

; Premise 3: Everything displayed in the collection is either a plant or an animal
(assert (forall ((x Obj)) (=> (is-displayed x) (or (is-plant x) (is-animal x)))))

; Premise 4: All multicellular animals are not bacteria
(assert (forall ((x Obj)) (=> (and (is-multicellular x) (is-animal x)) (not (is-bacteria x)))))

; Premise 5: All animals displayed in the collection are multicellular
(assert (forall ((x Obj)) (=> (and (is-animal x) (is-displayed x)) (is-multicellular x))))

; Premise 6: A sea eel is displayed in the collection
(assert (is-displayed sea-eel))

; Premise 7: The sea eel is an eel or an animal or not a plant
(assert (or (is-eel sea-eel) (is-animal sea-eel) (not (is-plant sea-eel))))

; 5. Assert Statement to Verify
; Statement: The sea eel is bacteria.
(assert (is-bacteria sea-eel))

; 6. Check Satisfiability
(check-sat)
(get-model)