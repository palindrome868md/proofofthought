; SMT-LIB 2.0 Program for Theorem Proving
; Problem: Logical reasoning about PSO J318.5-22, solar system, and planet types.

; 1. Declare Sorts
; We use a generic sort 'Thing' for all objects (planets, systems, etc.)
(declare-sort Thing 0)

; 2. Declare Functions (Predicates)
; Location predicates
(declare-fun is_outside (Thing) Bool)
(declare-fun is_inside (Thing) Bool)

; Property predicates
(declare-fun has_sun_star (Thing) Bool)
(declare-fun is_bound (Thing) Bool)
(declare-fun is_planet (Thing) Bool)
(declare-fun is_rogue (Thing) Bool)
(declare-fun is_orphan (Thing) Bool)

; 3. Declare Constants
; The specific object in question
(declare-const pso Thing)

; 4. Assert Knowledge Base (Premises)

; Premise 1: Everything is either outside the solar system or in the solar system.
; We assume mutual exclusivity for physical location.
(assert (forall ((x Thing)) (or (is_outside x) (is_inside x))))
(assert (forall ((x Thing)) (not (and (is_outside x) (is_inside x)))))

; Premise 2: Nothing outside the solar system has the Sun as its star.
(assert (forall ((x Thing)) (=> (is_outside x) (not (has_sun_star x)))))

; Premise 3: Everything in the solar system is gravitationally bound by the Sun.
(assert (forall ((x Thing)) (=> (is_inside x) (is_bound x))))

; Premise 4: No planets gravitationally bound by the Sun are rogue planets.
; (is_planet AND is_bound) IMPLIES NOT is_rogue
(assert (forall ((x Thing)) (=> (and (is_planet x) (is_bound x)) (not (is_rogue x)))))

; Premise 5: All orphan planets are rogue planets.
(assert (forall ((x Thing)) (=> (is_orphan x) (is_rogue x))))

; Semantic Knowledge: Terminology implies type hierarchy.
; A "rogue planet" is a planet.
(assert (forall ((x Thing)) (=> (is_rogue x) (is_planet x))))
; An "orphan planet" is a planet.
(assert (forall ((x Thing)) (=> (is_orphan x) (is_planet x))))

; Premise 6: If PSO J318.5−22 is not both a rogue planet and a planet gravitationally bound by the Sun, 
; then it is a rogue planet.
; Logic: NOT (is_rogue AND is_planet AND is_bound) IMPLIES is_rogue
; This logically forces is_rogue(pso) to be True.
(assert (=> (not (and (is_rogue pso) (is_planet pso) (is_bound pso))) (is_rogue pso)))

; 5. Verification
; Question: Is the following statement true or false?
; Statement: PSO J318.5−22 is an orphan planet or it does not have the Sun as its star, or both.
; SMT: (is_orphan pso) OR (NOT (has_sun_star pso))
; To verify if this is True (consistent/entailed), we assert it and check satisfiability.
; If 'sat', the statement is True (possible/consistent).
; If 'unsat', the statement is False (contradicts premises).
(assert (or (is_orphan pso) (not (has_sun_star pso))))

; 6. Check Satisfiability
(check-sat)
(get-model)