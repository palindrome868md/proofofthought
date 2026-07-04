;--- 1. Sort -------------------------------------------------
(declare-sort Person 0)

;--- 2. Predicates (functions returning Bool) -----------------
(declare-fun human (Person) Bool)
(declare-fun can_swim (Person) Bool)
(declare-fun can_walk (Person) Bool)
(declare-fun can_control_breath (Person) Bool)
(declare-fun can_control_balance (Person) Bool)
(declare-fun functional_brainstem (Person) Bool)
(declare-fun functional_leg_muscles (Person) Bool)
(declare-fun can_stand (Person) Bool)

;--- 3. Premises ----------------------------------------------

; Functional brainstems are necessary for breath control.
(assert (forall ((p Person))
  (=> (can_control_breath p) (functional_brainstem p))))

; All humans that can swim can control their breath.
(assert (forall ((p Person))
  (=> (and (human p) (can_swim p)) (can_control_breath p))))

; Humans can swim or walk (at least one holds).
(assert (forall ((p Person))
  (=> (human p) (or (can_swim p) (can_walk p)))))

; Humans who can walk can stand on the ground by themselves.
(assert (forall ((p Person))
  (=> (and (human p) (can_walk p)) (can_stand p))))

; Humans whose brainstems are functional can control their balance.
(assert (forall ((p Person))
  (=> (and (human p) (functional_brainstem p)) (can_control_balance p))))

; Every human who can stand on the ground by themselves has functional leg muscles.
(assert (forall ((p Person))
  (=> (and (human p) (can_stand p)) (functional_leg_muscles p))))

;--- 4. Concrete facts -----------------------------------------

(declare-const George Person)
(declare-const Archie Person)

; George and Archie are humans.
(assert (human George))
(assert (human Archie))

; George can control his balance and can swim.
(assert (can_control_balance George))
(assert (can_swim George))

; Archie can walk iff he has functional brainstems.
(assert (=> (can_walk Archie) (functional_brainstem Archie)))
(assert (=> (functional_brainstem Archie) (can_walk Archie)))

;--- 5. Statement to be verified -------------------------------
; "Archie has functional leg muscles and can control his balance."
(assert (and (functional_leg_muscles Archie)
             (can_control_balance Archie)))

;--- 6. Check satisfiability ------------------------------------
(check-sat)
(get-model)