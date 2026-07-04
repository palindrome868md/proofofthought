; 1. Declare the uninterpreted sort for sins
(declare-sort Sin 0)

; 2. Function mapping a sin to its prevalence (an integer)
(declare-fun prevalence (Sin) Int)

; 3. Declare constants for each of the Seven Deadly Sins
(declare-const greed    Sin)
(declare-const pride    Sin)
(declare-const lust     Sin)
(declare-const gluttony Sin)
(declare-const wrath    Sin)
(declare-const envy     Sin)
(declare-const sloth    Sin)

; 4. Knowledge base: assign distinct prevalence values
; (higher number = more prevalent)
(assert (= (prevalence pride)    10))
(assert (= (prevalence greed)    8))
(assert (= (prevalence lust)     7))
(assert (= (prevalence gluttony) 5))
(assert (= (prevalence wrath)    6))
(assert (= (prevalence envy)     4))
(assert (= (prevalence sloth)    3))

; 5. Test the claim: "greed is the most prevalent sin"
;    i.e., for every sin s different from greed,
;    prevalence(greed) ≥ prevalence(s)
(assert (forall ((s Sin))
        (=> (distinct s greed)
            (>= (prevalence greed) (prevalence s)))))

; 6. Verify the claim
(check-sat)   ; Expected: unsat (the claim contradicts the KB)
(get-model)