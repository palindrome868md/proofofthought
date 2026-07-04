; 1. Declare sorts
(declare-sort Human 0)

; 2. Declare functions (Predicates)
(declare-fun has-functional-brainstem (Human) Bool)
(declare-fun can-control-breath (Human) Bool)
(declare-fun can-swim (Human) Bool)
(declare-fun can-walk (Human) Bool)
(declare-fun can-stand-alone (Human) Bool)
(declare-fun has-functional-leg-muscles (Human) Bool)
(declare-fun can-control-balance (Human) Bool)

; 3. Declare constants
(declare-const archie Human)
(declare-const george Human)

; 4. Assert knowledge base (Premises)

; Premise 1: Functional brainstems are necessary for breath control.
; (Breath Control => Functional Brainstem)
(assert (forall ((h Human))
  (=> (can-control-breath h) (has-functional-brainstem h))))

; Premise 2: All humans that can swim can control their breath.
(assert (forall ((h Human))
  (=> (can-swim h) (can-control-breath h))))

; Premise 3: Humans can swim or walk.
(assert (forall ((h Human))
  (or (can-swim h) (can-walk h))))

; Premise 4: Humans who can walk can stand on the ground by themselves.
(assert (forall ((h Human))
  (=> (can-walk h) (can-stand-alone h))))

; Premise 5: Humans whose brainstems are functional can control their balance.
(assert (forall ((h Human))
  (=> (has-functional-brainstem h) (can-control-balance h))))

; Premise 6: Every human who can stand on the ground by themselves has functional leg muscles.
(assert (forall ((h Human))
  (=> (can-stand-alone h) (has-functional-leg-muscles h))))

; Premise 7: George and Archie are humans. 
; (Implicitly handled by declaring them as sort Human)

; Premise 8: George can control his balance and can swim.
(assert (can-control-balance george))
(assert (can-swim george))

; Premise 9: Archie can walk if and only if he has functional brainstems.
(assert (= (can-walk archie) (has-functional-brainstem archie)))

; 5. Assert the statement to be verified
; Statement: Archie has functional leg muscles and can control his balance.
(assert (and (has-functional-leg-muscles archie) (can-control-balance archie)))

; 6. Check satisfiability
(check-sat)
(get-model)