; 1. Declare sorts
(declare-sort Monitor 0)

; 2. Declare functions (Predicates)
(declare-fun made-by-LG (Monitor) Bool)
(declare-fun has-type-c (Monitor) Bool)
(declare-fun made-before-2010 (Monitor) Bool)
(declare-fun in-library (Monitor) Bool)

; 3. Declare constants
(declare-const L-2021 Monitor)
(declare-const witness Monitor)

; 4. Assert knowledge base (facts)

; Premise 1: Some monitors made by LG have a type-c port.
; Modeled using a witness constant as per instructions for existential constraints.
(assert (made-by-LG witness))
(assert (has-type-c witness))

; Premise 2: Monitors that have a type-c port were not made before 2010.
(assert (forall ((m Monitor))
  (=> (has-type-c m) (not (made-before-2010 m)))))

; Premise 3: All monitors in the library are made before 2010.
(assert (forall ((m Monitor))
  (=> (in-library m) (made-before-2010 m))))

; Premise 4: The L-2021 monitor is either used in the library or has a type-c port.
(assert (or (in-library L-2021) (has-type-c L-2021)))

; Premise 5: The L-2021 monitor is either both produced before 2010 and made by LG, or neither is true.
; This is equivalent to (made-before-2010 L-2021) iff (made-by-LG L-2021)
(assert (= (made-before-2010 L-2021) (made-by-LG L-2021)))

; 5. Test Scenario: The monitor L-2021 is either in the library or produced by LG.
(assert (or (in-library L-2021) (made-by-LG L-2021)))

; 6. Check satisfiability
(check-sat)
(get-model)