; Sorts
(declare-sort Monitor 0)
(declare-sort Brand 0)

; Brand constants
(declare-const lg Brand)

; Monitor constants
(declare-const L2021 Monitor)

; Predicates / functions
(declare-fun manufactured_by (Monitor) Brand)
(declare-fun has_type_c (Monitor) Bool)
(declare-fun in_library (Monitor) Bool)
(declare-fun produced_before_2010 (Monitor) Bool)

; Knowledge base (premises)

; 1. Some monitors made by LG have a type-c port.
(assert (exists ((m Monitor)) (and (= (manufactured_by m) lg) (has_type_c m))))

; 2. Monitors that have a type-c port were not made before 2010.
(assert (forall ((m Monitor)) (=> (has_type_c m) (not (produced_before_2010 m)))))

; 3. All monitors in the library are made before 2010.
(assert (forall ((m Monitor)) (=> (in_library m) (produced_before_2010 m))))

; 4. The L-2021 monitor is either used in the library or has a type-c port.
(assert (or (in_library L2021) (has_type_c L2021)))

; 5. The L-2021 monitor is either both produced before 2010 and LG, or neither is true.
(assert (or (and (produced_before_2010 L2021) (= (manufactured_by L2021) lg))
            (and (not (produced_before_2010 L2021)) (not (= (manufactured_by L2021) lg)))))

; Test case A (antecedent of the statement):
; A: "L2021 is either in_library and manufactured_by LG, or not in_library and not manufactured_by LG"
(assert (or (and (in_library L2021) (= (manufactured_by L2021) lg))
            (and (not (in_library L2021)) (not (= (manufactured_by L2021) lg)))))

; Test case B: negation of the consequent "L2021 neither has_type_c nor LG"
; B: (not has_type_c L2021) and (not (= manufactured_by L2021 lg))
; We assert ¬B to test A => B by checking KB ∧ A ∧ ¬B
(assert (or (has_type_c L2021) (= (manufactured_by L2021) lg)))

; Check satisfiability for KB ∧ A ∧ ¬B to determine truth of the statement
(check-sat)
(get-model)