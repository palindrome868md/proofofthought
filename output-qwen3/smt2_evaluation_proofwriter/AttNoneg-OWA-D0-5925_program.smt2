; Declare sorts
(declare-sort Entity 0)

; Declare constants
(declare-const charlie Entity)
(declare-const gary Entity)

; Declare predicates
(declare-fun is-smart (Entity) Bool)
(declare-fun is-red (Entity) Bool)
(declare-fun is-cold (Entity) Bool)
(declare-fun is-rough (Entity) Bool)
(declare-fun is-nice (Entity) Bool)
(declare-fun is-big (Entity) Bool)

; Knowledge Base
; 1. Charlie is smart
(assert (is-smart charlie))

; 2. Gary is red
(assert (is-red gary))

; 3. Cold, rough things are nice
(assert (forall ((x Entity))
  (=> (and (is-cold x) (is-rough x))
      (is-nice x))))

; 4. If something is smart then it is big
(assert (forall ((x Entity))
  (=> (is-smart x)
      (is-big x))))

; Test: Charlie is not smart
(assert (not (is-smart charlie)))

; Check satisfiability
(check-sat)
(get-model)