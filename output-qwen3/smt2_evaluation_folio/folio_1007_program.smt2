; Declare a sort for objects (planets, etc.)
(declare-sort Thing 0)

; Declare predicates/functions
(declare-fun is_outside (Thing) Bool)
(declare-fun is_inside (Thing) Bool)
(declare-fun has_sun_star (Thing) Bool)
(declare-fun is_bound (Thing) Bool)
(declare-fun is_planet (Thing) Bool)
(declare-fun is_rogue (Thing) Bool)
(declare-fun is_orphan (Thing) Bool)

; Declare the constant for PSO J318.5-22
(declare-const pso Thing)

; Premise 1: Everything is either outside the solar system or in the solar system.
; We instantiate this for pso. We also assume mutual exclusivity for physical consistency.
(assert (or (is_outside pso) (is_inside pso)))
(assert (not (and (is_outside pso) (is_inside pso))))

; Premise 2: Nothing outside the solar system has the Sun as its star.
(assert (=> (is_outside pso) (not (has_sun_star pso))))

; Premise 3: Everything in the solar system is gravitationally bound by the Sun.
(assert (=> (is_inside pso) (is_bound pso)))

; Premise 4: No planets gravitationally bound by the Sun are rogue planets.
(assert (=> (and (is_planet pso) (is_bound pso)) (not (is_rogue pso))))

; Premise 5: All orphan planets are rogue planets. (Implies they are planets too)
(assert (=> (is_orphan pso) (and (is_planet pso) (is_rogue pso))))

; Premise 6: If PSO J318.5−22 is not both a rogue planet and a planet gravitationally bound by the Sun, 
; then it is a rogue planet.
(assert (=> (not (and (is_rogue pso) (is_bound pso))) (is_rogue pso)))

; Statement to Verify:
; If PSO J318.5−22 is an orphan planet or it does not have the Sun as the star, or both, 
; then PSO J318.5−22 neither is an orphan planet nor does it have the Sun as the star.
(assert (=> (or (is_orphan pso) (not (has_sun_star pso)))
            (and (not (is_orphan pso)) (not (has_sun_star pso)))))

; Check satisfiability
; sat = True (Statement is consistent/possible)
; unsat = False (Statement contradicts premises)
(check-sat)
(get-model)