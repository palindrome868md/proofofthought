;-------------------------------------------------
;  Sort and predicate declarations
;-------------------------------------------------
(declare-sort Entity 0)

(declare-fun Outside (Entity) Bool)          ; outside the solar system
(declare-fun InSolar (Entity) Bool)          ; in the solar system
(declare-fun SunStar (Entity) Bool)          ; has the Sun as its star
(declare-fun Bound (Entity) Bool)            ; gravitationally bound by the Sun
(declare-fun Planet (Entity) Bool)           ; is a planet
(declare-fun Rogue (Entity) Bool)            ; is a rogue planet
(declare-fun Orphan (Entity) Bool)           ; is an orphan planet

;-------------------------------------------------
;  Constant for PSO J318.5−22
;-------------------------------------------------
(declare-const pso Entity)

;-------------------------------------------------
;  Premises
;-------------------------------------------------
; 1. Everything is either outside the solar system or in it
(assert (forall ((x Entity))
          (or (Outside x) (InSolar x))))

; 2. Nothing outside the solar system has the Sun as its star
(assert (forall ((x Entity))
          (=> (Outside x) (not (SunStar x)))))

; 3. Everything in the solar system is gravitationally bound by the Sun
(assert (forall ((x Entity))
          (=> (InSolar x) (Bound x))))

; 4. No planets gravitationally bound by the Sun are rogue planets
(assert (forall ((x Entity))
          (=> (and (Planet x) (Bound x)) (not (Rogue x)))))

; 5. All orphan planets are rogue planets
(assert (forall ((x Entity))
          (=> (Orphan x) (Rogue x))))

; 6. If PSO is not both a rogue planet and a planet bound by the Sun,
;    then it is a rogue planet.
(assert (=> (not (and (Rogue pso) (Bound pso)))
            (Rogue pso)))

;-------------------------------------------------
;  Negation of the statement to be tested:
;  "PSO is an orphan planet OR it does NOT have the Sun as its star"
;-------------------------------------------------
; Negation ≡ (not Orphan(pso)) AND SunStar(pso)
(assert (and (not (Orphan pso))
             (SunStar pso)))

;-------------------------------------------------
;  Check satisfiability
;-------------------------------------------------
(check-sat)
(get-model)