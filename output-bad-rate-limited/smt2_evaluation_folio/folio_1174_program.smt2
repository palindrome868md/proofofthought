; Sorts
(declare-sort Monitor 0)

; Predicates
(declare-fun in_library (Monitor) Bool)
(declare-fun has_typec (Monitor) Bool)
(declare-fun before_2010 (Monitor) Bool)
(declare-fun made_by_LG (Monitor) Bool)

; Constants
(declare-const L2021 Monitor)
(declare-const m1 Monitor)

; Knowledge base / premises

; 1. Some monitors made by LG have a type-c port.
(assert (and (made_by_LG m1) (has_typec m1)))

; 2. Monitors that have a type-c port were not made before 2010.
(assert (forall ((m Monitor)) (=> (has_typec m) (not (before_2010 m)))))

; 3. All monitors in the library are made before 2010.
(assert (forall ((m Monitor)) (=> (in_library m) (before_2010 m))))

; 4. The L-2021 monitor is either used in the library or has a type-c port.
(assert (or (in_library L2021) (has_typec L2021)))

; 5. The L-2021 monitor is either both produced before 2010 and made by LG, or neither is true.
(assert (or (and (before_2010 L2021) (made_by_LG L2021))
            (and (not (before_2010 L2021)) (not (made_by_LG L2021)))))

; Test scenario: The statement "The monitor L-2021 is either in the library or produced by LG."
(assert (or (in_library L2021) (made_by_LG L2021)))

; Check satisfiability and provide a model if one exists
(check-sat)
(get-model)