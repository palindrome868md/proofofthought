;-------------------------------------------------
; Question: Could an ocelot subsist on a single bee hummingbird per day?
;-------------------------------------------------

; 1. Declare an uninterpreted sort for animals
(declare-sort Animal 0)

; 2. Declare constants for the specific animals
(declare-const ocelot Animal)
(declare-const bee_hummingbird Animal)

; 3. Declare a function that gives the daily caloric requirement (or provision) of an animal
;    Using Real to allow fractional calories
(declare-fun daily_calories (Animal) Real)

; 4. Knowledge base: typical caloric values (approximate)
;    – An adult ocelot needs roughly 3000 kilocalories per day
;    – A bee hummingbird provides roughly 0.5 kilocalories per day
(assert (= (daily_calories ocelot) 3000))
(assert (= (daily_calories bee_hummingbird) 0.5))

; 5. Test the statement:
;    "An ocelot can subsist on a single bee hummingbird per day"
;    This would require the hummingbird's calories to be at least the ocelot's need.
;    We assert that condition and ask Z3 whether it can be satisfied.
(assert (>= (daily_calories bee_hummingbird) (daily_calories ocelot)))

; 6. Check satisfiability
;    – If the result is `sat`, the statement could be true.
;    – If the result is `unsat`, the statement is impossible.
(check-sat)
(get-model)