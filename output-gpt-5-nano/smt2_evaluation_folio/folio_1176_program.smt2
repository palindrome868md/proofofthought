; Monitors and properties
(declare-sort Monitor 0)
(declare-const L2021 Monitor)

; Predicates
(declare-fun in-library (Monitor) Bool)
(declare-fun has-type-c (Monitor) Bool)
(declare-fun produced-by-LG (Monitor) Bool)
(declare-fun before2010 (Monitor) Bool)

; A witness monitor: some LG monitor with a type-C port
(declare-const m1 Monitor)
(assert (and (produced-by-LG m1) (has-type-c m1)))

; Premises encoded as axioms

; 1) Monitors with a type-C port were not made before 2010
(assert (forall ((m Monitor)) (=> (has-type-c m) (not (before2010 m)))))

; 2) All monitors in the library are made before 2010
(assert (forall ((m Monitor)) (=> (in-library m) (before2010 m))))

; 3) The L-2021 monitor is either in the library or has a type-C port
(assert (or (in-library L2021) (has-type-c L2021)))

; 4) The L-2021 monitor is either both before 2010 and LG-produced, or neither
(assert (or (and (before2010 L2021) (produced-by-LG L2021))
            (and (not (before2010 L2021)) (not (produced-by-LG L2021)))))

; Test scenario for the given conditional statement

; Antecedent: (A ∨ B) where
; A = (in-library L2021) ∧ (produced-by-LG L2021)
; B = (¬in-library L2021) ∧ (¬produced-by-LG L2021)
(assert (or (and (in-library L2021) (produced-by-LG L2021))
            (and (not (in-library L2021)) (not (produced-by-LG L2021)))))

; Conclusion: C = (not has-type-c L2021) ∧ (not produced-by-LG L2021)
; ¬C is (has-type-c L2021) ∨ (produced-by-LG L2021)
(assert (or (has-type-c L2021) (produced-by-LG L2021)))

; Exactly one (check-sat) to determine if the statement is entailed
(check-sat)