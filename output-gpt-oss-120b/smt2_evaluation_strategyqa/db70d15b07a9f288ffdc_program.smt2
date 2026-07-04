;-------------------------------------------------
; 1. Declare sorts (types)
;-------------------------------------------------
(declare-sort Species 0)
(declare-sort Habitat 0)

;-------------------------------------------------
; 2. Declare functions / predicates
;-------------------------------------------------
; Predicate: a species lives in a given habitat
(declare-fun lives_in (Species Habitat) Bool)

; Function: temperature (°C) of a habitat's water
(declare-fun temperature_of (Habitat) Real)

;-------------------------------------------------
; 3. Declare constants (objects)
;-------------------------------------------------
(declare-const manta_ray Species)        ; the species "manta ray"
(declare-const ocean_water Habitat)     ; a specific ocean water habitat

; Safe temperature for cold‑food storage (°C)
(declare-const safe_cold_storage_temp Real)

;-------------------------------------------------
; 4. Knowledge base (facts and rules)
;-------------------------------------------------
; Safe cold‑storage temperature is 4 °C
(assert (= safe_cold_storage_temp 4.0))

; Manta rays live in this ocean water
(assert (lives_in manta_ray ocean_water))

; The water where they live is warm (≈25 °C)
(assert (= (temperature_of ocean_water) 25.0))

;-------------------------------------------------
; 5. Query: Do manta rays live in water above the safe temperature?
;-------------------------------------------------
(assert (and
          (lives_in manta_ray ocean_water)
          (> (temperature_of ocean_water) safe_cold_storage_temp)))

;-------------------------------------------------
; 6. Solve
;-------------------------------------------------
(check-sat)   ; Expected result: sat  (the statement is true)
(get-model)