; Sorts
(declare-sort Star 0)
(declare-sort Planet 0)

; Constants
(declare-const sun Star)
(declare-const pso Planet)

; Predicates/Functions
(declare-fun star-of (Planet) Star)
(declare-fun in-solar-system (Planet) Bool)
(declare-fun outside-solar-system (Planet) Bool)
(declare-fun bound-by-sun (Planet) Bool)
(declare-fun rogue-planet (Planet) Bool)
(declare-fun orphan-planet (Planet) Bool)

; Knowledge base (premises)

; 1. Everything is either outside the solar system or in the solar system.
(assert (forall ((q Planet)) (or (in-solar-system q) (outside-solar-system q))))

; 2. Nothing outside the solar system has the Sun as its star.
(assert (forall ((q Planet)) (=> (outside-solar-system q) (not (= (star-of q) sun)))))

; 3. Everything in the solar system is gravitationally bound by the Sun.
(assert (forall ((q Planet)) (=> (in-solar-system q) (bound-by-sun q))))

; 4. No planets gravitationally bound by the Sun are rogue planets.
(assert (forall ((q Planet)) (=> (bound-by-sun q) (not (rogue-planet q)))))

; 5. All orphan planets are rogue planets.
(assert (forall ((q Planet)) (=> (orphan-planet q) (rogue-planet q))))

; 6. If PSO J318.5−22 is not both a rogue planet and a planet gravitationally bound by the Sun, then it is a rogue planet.
(assert (=> (not (and (rogue-planet pso) (bound-by-sun pso)))
            (rogue-planet pso)))

; Test: Statement to verify
; Statement: PSO J318.5−22 is an orphan planet or it does not have the Sun as its star, or both.
(assert (or (orphan-planet pso) (not (= (star-of pso) sun))))

; Verification
(check-sat)
(get-model)