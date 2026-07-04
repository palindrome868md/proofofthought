;--- Sorts ---------------------------------------------------------
(declare-sort Animal 0)

;--- Predicates (as Boolean functions) ----------------------------
(declare-fun reptile (Animal) Bool)
(declare-fun snake   (Animal) Bool)
(declare-fun fur     (Animal) Bool)

;--- Knowledge base (premises) ------------------------------------
; No reptile has fur.
(assert (forall ((x Animal))
  (=> (reptile x) (not (fur x)))))

; All snakes are reptiles.
(assert (forall ((x Animal))
  (=> (snake x) (reptile x))))

;--- Test the statement: "Some snake has fur" --------------------
; Introduce a concrete animal that is a snake and has fur.
(declare-const s Animal)
(assert (snake s))
(assert (fur s))

;--- Check whether the combined constraints are satisfiable ------
(check-sat)
(get-model)