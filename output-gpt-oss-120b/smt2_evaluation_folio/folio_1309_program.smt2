;--- Sort ---------------------------------------------------------------
(declare-sort Person 0)

;--- Predicates (functions returning Bool) -------------------------------
(declare-fun Human               (Person) Bool)
(declare-fun CanSwim             (Person) Bool)
(declare-fun CanWalk             (Person) Bool)
(declare-fun CanControlBreath    (Person) Bool)
(declare-fun FunctionalBrainstem (Person) Bool)
(declare-fun CanControlBalance   (Person) Bool)
(declare-fun CanStandGround      (Person) Bool)
(declare-fun FunctionalLegMuscles(Person) Bool)

;--- Individuals ---------------------------------------------------------
(declare-const George Person)
(declare-const Archie Person)

;--- Premises -----------------------------------------------------------

; 1. Functional brainstems are necessary for breath control:
(assert (forall ((x Person))
          (=> (CanControlBreath x) (FunctionalBrainstem x))))

; 2. All humans that can swim can control their breath:
(assert (forall ((x Person))
          (=> (and (Human x) (CanSwim x)) (CanControlBreath x))))

; 3. Humans can swim or walk (at least one):
(assert (forall ((x Person))
          (=> (Human x) (or (CanSwim x) (CanWalk x)))))

; 4. Humans who can walk can stand on the ground by themselves:
(assert (forall ((x Person))
          (=> (and (Human x) (CanWalk x)) (CanStandGround x))))

; 5. Humans whose brainstems are functional can control their balance:
(assert (forall ((x Person))
          (=> (and (Human x) (FunctionalBrainstem x)) (CanControlBalance x))))

; 6. Every human who can stand on the ground by themselves has functional leg muscles:
(assert (forall ((x Person))
          (=> (and (Human x) (CanStandGround x)) (FunctionalLegMuscles x))))

; 7. George and Archie are humans:
(assert (Human George))
(assert (Human Archie))

; 8. George can control his balance and can swim:
(assert (CanControlBalance George))
(assert (CanSwim George))

; 9. Archie can walk iff he has functional brainstems (biconditional):
(assert (=> (CanWalk Archie) (FunctionalBrainstem Archie)))
(assert (=> (FunctionalBrainstem Archie) (CanWalk Archie)))

;--- Verification of the statement --------------------------------------
; Statement to test:  Archie cannot control his balance AND doesn't have functional leg muscles
(assert (not (CanControlBalance Archie)))      ; ¬CanControlBalance(Archie)
(assert (not (FunctionalLegMuscles Archie)))   ; ¬FunctionalLegMuscles(Archie)

;--- Check ---------------------------------------------------------------
(check-sat)   ; expected result: unsat (the statement is false)
(get-model)   ; optional: show a model for the consistent part (if sat)