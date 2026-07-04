; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare functions (predicates)
(declare-fun is-human (Person) Bool)
(declare-fun functional-brainstem (Person) Bool)
(declare-fun can-control-breath (Person) Bool)
(declare-fun can-swim (Person) Bool)
(declare-fun can-walk (Person) Bool)
(declare-fun can-stand (Person) Bool)
(declare-fun can-control-balance (Person) Bool)
(declare-fun functional-leg-muscles (Person) Bool)

; 3. Declare constants
(declare-const George Person)
(declare-const Archie Person)

; 4. Assert knowledge base (premises)

; Premise 7: George and Archie are humans
(assert (is-human George))
(assert (is-human Archie))

; Premise 1: Functional brainstems are necessary for breath control.
; (If Breath Control, then Functional Brainstem)
(assert (forall ((p Person))
  (=> (can-control-breath p) (functional-brainstem p))))

; Premise 2: All humans that can swim can control their breath.
(assert (forall ((p Person))
  (=> (and (is-human p) (can-swim p)) (can-control-breath p))))

; Premise 3: Humans can swim or walk.
(assert (forall ((p Person))
  (=> (is-human p) (or (can-swim p) (can-walk p)))))

; Premise 4: Humans who can walk can stand on the ground by themselves.
(assert (forall ((p Person))
  (=> (and (is-human p) (can-walk p)) (can-stand p))))

; Premise 5: Humans whose brainstems are functional can control their balance.
(assert (forall ((p Person))
  (=> (and (is-human p) (functional-brainstem p)) (can-control-balance p))))

; Premise 6: Every human who can stand on the ground by themselves has functional leg muscles.
(assert (forall ((p Person))
  (=> (and (is-human p) (can-stand p)) (functional-leg-muscles p))))

; Premise 8: George can control his balance and can swim.
(assert (can-control-balance George))
(assert (can-swim George))

; Premise 9: Archie can walk if and only if he has functional brainstems.
(assert (iff (can-walk Archie) (functional-brainstem Archie)))

; 5. Assert the statement to be verified
; Statement: Archie cannot control his balance and doesn't have functional leg muscles.
(assert (and 
  (not (can-control-balance Archie)) 
  (not (functional-leg-muscles Archie))))

; 6. Check satisfiability
(check-sat)
(get-model)