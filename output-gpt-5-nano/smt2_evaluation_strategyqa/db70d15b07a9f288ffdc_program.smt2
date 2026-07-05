; Declare sorts
(declare-sort Species 0)

; Declare constants
(declare-const manta-ray Species)

; Declare functions
(declare-fun habitat-temperature (Species) Real)

; Declare constants for thresholds
(declare-const safe-temp Real)

; Knowledge base
(assert (= safe-temp 4)) ; 4°C is the typical safe maximum for cold storage

; Knowledge about manta ray habitat temperature
(assert (= (habitat-temperature manta-ray) 25)) ; manta rays inhabit water around 25°C

; Test: Do manta rays live in water above the safe storage temperature?
(assert (> (habitat-temperature manta-ray) safe-temp))

; Check satisfiability (must be exactly one check-sat)
(check-sat)
(get-model)