; Declare an uninterpreted sort for all objects
(declare-sort Entity 0)

; Declare predicates (as Boolean-valued functions)
(declare-fun kind (Entity) Bool)
(declare-fun round (Entity) Bool)
(declare-fun blue (Entity) Bool)
(declare-fun rough (Entity) Bool)
(declare-fun young (Entity) Bool)

; Declare the constant representing the squirrel
(declare-const squirrel Entity)

; Knowledge base
; 1. The squirrel is kind.
(assert (kind squirrel))

; 2. If something is round and blue then it is rough.
(assert (forall ((x Entity))
  (=> (and (round x) (blue x))
      (rough x))))

; 3. If something is round and not kind then it is not young.
(assert (forall ((x Entity))
  (=> (and (round x) (not (kind x)))
      (not (young x)))))

; 4. All kind things are blue.
(assert (forall ((x Entity))
  (=> (kind x) (blue x))))

; 5. All round things are blue.
(assert (forall ((x Entity))
  (=> (round x) (blue x))))

; 6. If something is kind and blue then it is round.
(assert (forall ((x Entity))
  (=> (and (kind x) (blue x))
      (round x))))

; 7. If the squirrel is rough then the squirrel is round.
(assert (=> (rough squirrel) (round squirrel)))

; -------------------------------------------------
; Test the statement: "The squirrel is not blue."
(assert (not (blue squirrel)))

; Check whether the knowledge base together with the test is consistent
(check-sat)
(get-model)