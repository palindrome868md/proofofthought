; Declare sorts
(declare-sort Person 0)

; Predicates / relations
(declare-fun functional-brainstem (Person) Bool)
(declare-fun can-swim (Person) Bool)
(declare-fun breath-control (Person) Bool)
(declare-fun can-walk (Person) Bool)
(declare-fun stand-on-ground (Person) Bool)
(declare-fun balance-control (Person) Bool)
(declare-fun functional-leg-muscles (Person) Bool)

; Constants
(declare-const George Person)
(declare-const Archie Person)

; Knowledge base

; 1. Functional brainstems are necessary for breath control.
(assert (forall ((p Person))
  (=> (functional-brainstem p)
      (breath-control p))))

; 2. All humans that can swim can control their breath.
(assert (forall ((p Person))
  (=> (can-swim p)
      (breath-control p))))

; 3. Humans can swim or walk.
(assert (forall ((p Person))
  (or (can-swim p) (can-walk p))))

; 4. Humans who can walk can stand on the ground by themselves.
(assert (forall ((p Person))
  (=> (can-walk p)
      (stand-on-ground p))))

; 5. Humans whose brainstems are functional can control their balance.
(assert (forall ((p Person))
  (=> (functional-brainstem p)
      (balance-control p))))

; 6. Every human who can stand on the ground by themselves has functional leg muscles.
(assert (forall ((p Person))
  (=> (stand-on-ground p)
      (functional-leg-muscles p))))

; 7. George and Archie are humans. (Represented by constants)

; 8. George can control his balance and can swim.
(assert (balance-control George))
(assert (can-swim George))

; 9. Archie can walk if and only if he has functional brainstems.
; Implement as two implications (iff)
(assert (=> (can-walk Archie) (functional-brainstem Archie)))
(assert (=> (functional-brainstem Archie) (can-walk Archie)))

; Test: Statement to verify
; Archie has functional leg muscles and can control his balance.
(assert (and (functional-leg-muscles Archie) (balance-control Archie)))

; Check satisfiability and get a model
(check-sat)
(get-model)