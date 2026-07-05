; Determine if shrimp_scampi is definitely free of plastic

; Declare sorts
(declare-sort Dish 0)

; Declare constants
(declare-const shrimp_scampi Dish)

; Predicate: plastic_free(d) is true iff dish d is definitely free of plastic
(declare-fun plastic_free (Dish) Bool)

; Knowledge base: shrimp_scampi is plastic-free
(assert (plastic_free shrimp_scampi))

; Test scenario: shrimp_scampi is NOT plastic-free
; If the knowledge base entails plastic_free shrimp_scampi, then (not (plastic_free shrimp_scampi)) is unsatisfiable
(assert (not (plastic_free shrimp_scampi)))

; Check satisfiability of the test scenario
(check-sat)