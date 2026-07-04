; Sort for all objects
(declare-sort Obj 0)

; Constant representing PSO J318.5−22
(declare-const pso Obj)

; Predicates
(declare-fun Outside (Obj) Bool)
(declare-fun InSystem (Obj) Bool)
(declare-fun HasSunAsStar (Obj) Bool)
(declare-fun GravitationallyBoundBySun (Obj) Bool)
(declare-fun IsPlanet (Obj) Bool)
(declare-fun Rogue (Obj) Bool)
(declare-fun OrphanPlanet (Obj) Bool)

; Knowledge base (premises)

; 1) Everything is either outside the solar system or in the solar system.
(assert (forall ((x Obj)) (or (Outside x) (InSystem x))))

; 2) Nothing outside the solar system has the Sun as its star.
(assert (forall ((x Obj)) (=> (Outside x) (not (HasSunAsStar x)))))

; 3) Everything in the solar system is gravitationally bound by the Sun.
(assert (forall ((x Obj)) (=> (InSystem x) (GravitationallyBoundBySun x))))

; 4) No planets gravitationally bound by the Sun are rogue planets.
(assert (forall ((x Obj)) (=> (and (IsPlanet x) (GravitationallyBoundBySun x)) (not (Rogue x)))))

; 5) All orphan planets are rogue planets.
(assert (forall ((x Obj)) (=> (OrphanPlanet x) (Rogue x))))

; 6) If PSO J... is not both a rogue planet and a planet gravitationally bound by the Sun,
;    then it is a rogue planet.
(assert (=> (not (and (Rogue pso) (GravitationallyBoundBySun pso))) (Rogue pso)))

; Query (negated): "PSO J318.5−22 is an orphan planet or it does not have the Sun as its star, or both."
; We test entailment by checking the satisfiability of the negation of the statement.
(assert (not (or (OrphanPlanet pso) (not (HasSunAsStar pso)))))

; Check satisfiability and provide a model if one exists
(check-sat)
(get-model)