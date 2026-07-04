;--- Declarations -------------------------------------------------
(declare-sort Entity 0)

(declare-fun bear (Entity) Bool)
(declare-fun inZoo (Entity) Bool)
(declare-fun wild (Entity) Bool)

;--- Witness for the existential premise ---------------------------
(declare-const b1 Entity)

;--- Premises -------------------------------------------------------
; Some bears are in zoos
(assert (and (bear b1) (inZoo b1)))

; All bears in zoos are not wild
(assert (forall ((x Entity))
        (=> (and (bear x) (inZoo x))
            (not (wild x)))))

;--- Test the negation of the target statement ----------------------
; Assume: all bears are wild (i.e., ¬(Not all bears are wild))
(assert (forall ((x Entity))
        (=> (bear x) (wild x))))

;--- Solver query ---------------------------------------------------
(check-sat)   ; Expected result: unsat (the assumption contradicts the premises)
(get-model)