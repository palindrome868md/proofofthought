; Question: Do manta rays live in water above the safe temperature for cold food storage?

; Declare sorts
(declare-sort Animal 0)
(declare-sort Habitat 0)

; Declare functions
(declare-fun lives-in (Animal Habitat) Bool)
(declare-fun habitat-temperature (Habitat) Int)  ; Temperature in Celsius
(declare-fun cold-food-safe-max-temp () Int)  ; Maximum safe temp for cold food storage
(declare-fun is-manta-ray (Animal) Bool)

; Declare constants
(declare-const manta-ray Animal)
(declare-const manta-habitat Habitat)

; Knowledge Base

; Manta rays are animals
(assert (is-manta-ray manta-ray))

; Manta rays live in their habitat
(assert (lives-in manta-ray manta-habitat))

; Manta rays live in tropical/subtropical waters (20-30°C)
(assert (>= (habitat-temperature manta-habitat) 20))
(assert (<= (habitat-temperature manta-habitat) 30))

; Safe temperature for cold food storage is at most 5°C (41°F)
(assert (= (cold-food-safe-max-temp) 5))

; Test: Do manta rays live in water ABOVE the safe temperature for cold food storage?
; We assert this claim and check if it's satisfiable with our knowledge base
(assert (> (habitat-temperature manta-habitat) (cold-food-safe-max-temp)))

; Check satisfiability
; sat = True (manta rays DO live in water above cold food storage temp)
; unsat = False (manta rays do NOT live in water above cold food storage temp)
(check-sat)
(get-model)