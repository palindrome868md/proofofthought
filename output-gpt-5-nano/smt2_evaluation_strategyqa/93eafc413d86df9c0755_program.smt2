; Could an ocelot subsist on a single bee hummingbird per day?

; Sorts
(declare-sort Animal 0)
(declare-sort Prey 0)

; Constants
(declare-const ocelot Animal)
(declare-const bee-hummingbird Prey)

; Functions
(declare-fun daily-energy-demand (Animal) Real)
(declare-fun energy-content (Prey) Real)
(declare-fun meals (Animal Prey) Real)

; Assumptions
; One bee hummingbird per day
(assert (= (meals ocelot bee-hummingbird) 1))

; Energetic values (example, fixed)
(assert (= (daily-energy-demand ocelot) 120))  ; ocelot's daily energy requirement
(assert (= (energy-content bee-hummingbird) 50))   ; energy per bee hummingbird

; Subsistence condition: intake must meet or exceed requirement
(assert (>= (* (energy-content bee-hummingbird) (meals ocelot bee-hummingbird))
            (daily-energy-demand ocelot)))

; Question: Could an ocelot subsist on a single bee hummingbird per day?
(check-sat)