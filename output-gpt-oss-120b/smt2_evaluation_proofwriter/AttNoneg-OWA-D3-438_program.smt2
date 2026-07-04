; -------------------------------------------------
; 1. Declare the uninterpreted sort for all objects
; -------------------------------------------------
(declare-sort Thing 0)

; -------------------------------------------------
; 2. Declare unary predicates as Boolean functions
; -------------------------------------------------
(declare-fun round   (Thing) Bool)
(declare-fun blue    (Thing) Bool)
(declare-fun smart   (Thing) Bool)
(declare-fun red     (Thing) Bool)
(declare-fun rough   (Thing) Bool)
(declare-fun green   (Thing) Bool)

; -------------------------------------------------
; 3. Declare the constant representing Charlie
; -------------------------------------------------
(declare-const charlie Thing)

; -------------------------------------------------
; 4. Knowledge base (facts + universal rules)
; -------------------------------------------------

; Fact: Charlie is round
(assert (round charlie))

; Rule: All blue & smart things are red
(assert (forall ((x Thing))
  (=> (and (blue x) (smart x)) (red x))))

; Rule: Blue & rough things are round
(assert (forall ((x Thing))
  (=> (and (blue x) (rough x)) (round x))))

; Rule: If something is green then it is red
(assert (forall ((x Thing))
  (=> (green x) (red x))))

; Rule: If Charlie is rough then Charlie is green
(assert (=> (rough charlie) (green charlie)))

; Rule: All round things are smart
(assert (forall ((x Thing))
  (=> (round x) (smart x))))

; Rule: All smart & red things are blue
(assert (forall ((x Thing))
  (=> (and (smart x) (red x)) (blue x))))

; Rule: If something is blue and round then it is smart
(assert (forall ((x Thing))
  (=> (and (blue x) (round x)) (smart x))))

; Rule: All smart things are rough
(assert (forall ((x Thing))
  (=> (smart x) (rough x))))

; -------------------------------------------------
; 5. Test the statement: "Charlie is not green."
; -------------------------------------------------
(assert (not (green charlie)))

; -------------------------------------------------
; 6. Ask Z3 to check satisfiability
; -------------------------------------------------
(check-sat)   ; expected result: unsat (the negation cannot hold)
(get-model)   ; optional: show a model if it were satisfiable