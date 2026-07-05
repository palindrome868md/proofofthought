; Sorts
(declare-sort Monitor 0)

; Predicates
(declare-fun has-type-c (Monitor) Bool)
(declare-fun in-library  (Monitor) Bool)
(declare-fun made-by-LG  (Monitor) Bool)
(declare-fun before-2010 (Monitor) Bool)

; Constant for the L-2021 monitor
(declare-const L2021 Monitor)

; 1) Some monitors made by LG have a type-c port
(assert (exists ((m Monitor)) (and (made-by-LG m) (has-type-c m))))

; 2) Monitors with a type-c port were not made before 2010
(assert (forall ((m Monitor)) (=> (has-type-c m) (not (before-2010 m)))))

; 3) All monitors in the library are made before 2010
(assert (forall ((m Monitor)) (=> (in-library m) (before-2010 m))))

; 4) The L-2021 monitor is either used in the library or has a type-c port
(assert (or (in-library L2021) (has-type-c L2021)))

; 5) The L-2021 monitor is either both produced before 2010 and made by LG, or neither is true
(assert (or (and (before-2010 L2021) (made-by-LG L2021))
            (and (not (before-2010 L2021)) (not (made-by-LG L2021)))))

; Test: The L-2021 monitor either has a type-c port or is produced by LG
(assert (or (has-type-c L2021) (made-by-LG L2021)))

; Check satisfiability
(check-sat)