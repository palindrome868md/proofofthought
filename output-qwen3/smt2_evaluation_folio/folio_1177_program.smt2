; Declare Sorts
(declare-sort Monitor 0)

; Declare Functions (Predicates)
(declare-fun made-by-LG (Monitor) Bool)
(declare-fun has-type-c (Monitor) Bool)
(declare-fun made-before-2010 (Monitor) Bool)
(declare-fun in-library (Monitor) Bool)

; Declare Constants
(declare-const L-2021 Monitor)
(declare-const some-monitor Monitor)

; Premise 1: Some monitors made by LG have a type-c port.
(assert (and (made-by-LG some-monitor) (has-type-c some-monitor)))

; Premise 2: Monitors that have a type-c port were not made before 2010.
(assert (forall ((m Monitor))
  (=> (has-type-c m) (not (made-before-2010 m)))))

; Premise 3: All monitors in the library are made before 2010.
(assert (forall ((m Monitor))
  (=> (in-library m) (made-before-2010 m))))

; Premise 4: The L-2021 monitor is either used in the library or has a type-c port.
(assert (or (in-library L-2021) (has-type-c L-2021)))

; Premise 5: The L-2021 monitor is either both produced before 2010 and made by LG, or neither is true.
(assert (or 
  (and (made-before-2010 L-2021) (made-by-LG L-2021))
  (and (not (made-before-2010 L-2021)) (not (made-by-LG L-2021)))
))

; Statement to Verify:
; "If the monitor L-2021 is either produced by LG and produced before 2010 or neither produced by LG nor produced before 2010, 
;  then L-2021 is either in the library or produced by LG."

; Antecedent: (MadeByLG(L) AND MadeBefore2010(L)) OR (NOT MadeByLG(L) AND NOT MadeBefore2010(L))
; This is equivalent to Premise 5, which is already asserted as True.
; Consequent: in-library(L-2021) OR made-by-LG(L-2021)

; We assert the Statement as an implication to check if it holds (is consistent/satisfiable with KB).
; Following the instruction pattern: Assert the claim to test.
(assert (=> 
  (or 
    (and (made-by-LG L-2021) (made-before-2010 L-2021))
    (and (not (made-by-LG L-2021)) (not (made-before-2010 L-2021)))
  )
  (or (in-library L-2021) (made-by-LG L-2021))
))

; Check Satisfiability
(check-sat)
(get-model)