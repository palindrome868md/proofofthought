;--- Sorts ---------------------------------------------------------
(declare-sort Obj 0)                ; universe of celestial objects

;--- Predicates ----------------------------------------------------
(declare-fun Outside (Obj) Bool)          ; outside the solar system
(declare-fun InSolar (Obj) Bool)          ; in the solar system
(declare-fun HasSunStar (Obj) Bool)       ; has the Sun as its star
(declare-fun GravBoundSun (Obj) Bool)     ; gravitationally bound by the Sun
(declare-fun Planet (Obj) Bool)           ; is a planet
(declare-fun Rogue (Obj) Bool)            ; is a rogue planet
(declare-fun Orphan (Obj) Bool)           ; is an orphan planet

;--- Constant ------------------------------------------------------
(declare-const p Obj)                     ; PSO J318.5−22

;--- Premises ------------------------------------------------------
; 1. Everything is either outside the solar system or in the solar system.
(assert (forall ((x Obj)) (or (Outside x) (InSolar x))))

; 2. Nothing outside the solar system has the Sun as its star.
(assert (forall ((x Obj)) (=> (Outside x) (not (HasSunStar x)))))

; 3. Everything in the solar system is gravitationally bound by the Sun.
(assert (forall ((x Obj)) (=> (InSolar x) (GravBoundSun x))))

; 4. No planets gravitationally bound by the Sun are rogue planets.
(assert (forall ((x Obj))
        (=> (and (Planet x) (GravBoundSun x)) (not (Rogue x)))))

; 5. All orphan planets are rogue planets.
(assert (forall ((x Obj)) (=> (Orphan x) (Rogue x))))

; 6. If PSO J318.5−22 is not both a rogue planet and a planet
;    gravitationally bound by the Sun, then it is a rogue planet.
(assert (=> (not (and (Rogue p) (and (Planet p) (GravBoundSun p))))
            (Rogue p)))

;--- Negation of the target statement -------------------------------
; Negation of: (Orphan(p) ∨ ¬HasSunStar(p)) → (¬Orphan(p) ∧ ¬HasSunStar(p))
; is: (Orphan(p) ∨ ¬HasSunStar(p)) ∧ (Orphan(p) ∨ HasSunStar(p))

(assert (or (Orphan p) (not (HasSunStar p))))   ; antecedent true
(assert (or (Orphan p) (HasSunStar p)))       ; consequent false

;--- Check ---------------------------------------------------------
(check-sat)          ; we expect SAT → the original statement is *false*
(get-model)