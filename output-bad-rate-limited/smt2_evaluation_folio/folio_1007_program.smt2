; Sorts
(declare-sort Obj 0)

; Predicates
(declare-fun outside (Obj) Bool)     ; outside the solar system
(declare-fun in_solar (Obj) Bool)    ; inside the solar system
(declare-fun sun_star (Obj) Bool)    ; has the Sun as its star
(declare-fun bound_sun (Obj) Bool)   ; gravitationally bound by the Sun
(declare-fun rogue (Obj) Bool)       ; rogue planet
(declare-fun orphan (Obj) Bool)      ; orphan planet

; Specific object: PSO J318.5−22
(declare-const pso Obj)

; Premises (knowledge base)

; 1. Everything is either outside the solar system or in the solar system.
(assert (forall ((x Obj)) (or (outside x) (in_solar x))))

; 2. Nothing outside the solar system has the Sun as its star.
(assert (forall ((x Obj)) (=> (outside x) (not (sun_star x)))))

; 3. Everything in the solar system is gravitationally bound by the Sun.
(assert (forall ((x Obj)) (=> (in_solar x) (bound_sun x))))

; 4. No planets gravitationally bound by the Sun are rogue planets.
(assert (forall ((x Obj)) (=> (bound_sun x) (not (rogue x)))))

; 5. All orphan planets are rogue planets.
(assert (forall ((x Obj)) (=> (orphan x) (rogue x))))

; 6. If PSO J318.5−22 is not both a rogue planet and a planet gravitationally bound by the Sun, then it is a rogue planet.
(assert (=> (not (and (rogue pso) (bound_sun pso))) (rogue pso)))

; Test: Statement to verify
; If PSO J318.5−22 is an orphan planet or it does not have the Sun as the star, or both,
; then PSO J318.5−22 neither is an orphan planet nor does it have the Sun as the star.
(assert (=> (or (orphan pso) (not (sun_star pso)))
            (and (not (orphan pso)) (not (sun_star pso)))))

; Check satisfiability and model
(check-sat)
(get-model)