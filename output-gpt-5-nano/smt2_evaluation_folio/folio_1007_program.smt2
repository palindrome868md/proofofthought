; Sorts
(declare-sort Entity 0)

; Constants
(declare-const pso Entity)

; Predicates
(declare-fun in-system (Entity) Bool)     ; x is in the solar system
(declare-fun sun-starred (Entity) Bool)  ; Sun is the star of x
(declare-fun bound-sun (Entity) Bool)    ; x is gravitationally bound by the Sun
(declare-fun planet (Entity) Bool)       ; x is a planet
(declare-fun rogue (Entity) Bool)        ; x is a rogue planet
(declare-fun orphan (Entity) Bool)       ; x is an orphan planet

; Knowledge Base (Premises)

; 1. Nothing outside the solar system has the Sun as its star.
(assert (forall ((x Entity))
  (=> (not (in-system x))
      (not (sun-starred x)))))

; 2. Everything in the solar system is gravitationally bound by the Sun.
(assert (forall ((x Entity))
  (=> (in-system x)
      (bound-sun x))))

; 3. No planets gravitationally bound by the Sun are rogue planets.
(assert (forall ((x Entity))
  (=> (and (planet x) (bound-sun x))
      (not (rogue x)))))

; 4. All orphan planets are rogue planets.
(assert (forall ((x Entity))
  (=> (orphan x)
      (rogue x))))

; 5. If PSO J318.5−22 is not both a rogue planet and a planet gravitationally bound by the Sun, then it is a rogue planet.
(assert (=> (not (and (rogue pso) (bound-sun pso)))
            (rogue pso)))

; 6. Everything is either outside the solar system or in the solar system.
; (Optional tautology-like constraint; not strictly needed for the reasoning)

; Test Question:
; Statement: If PSO J318.5−22 is an orphan planet or it does not have the Sun as the star, or both,
; then PSO J318.5−22 neither is an orphan planet nor does it have the Sun as the star.
(assert (=> (or (orphan pso) (not (sun-starred pso)))
            (and (not (orphan pso)) (not (sun-starred pso)))))

; Check the satisfiability to determine truth of the statement
(check-sat)
(get-model)