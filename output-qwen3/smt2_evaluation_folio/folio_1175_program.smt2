; Declare sorts
(declare-sort Monitor 0)

; Declare functions (predicates)
(declare-fun is-LG (Monitor) Bool)
(declare-fun has-type-c (Monitor) Bool)
(declare-fun before-2010 (Monitor) Bool)
(declare-fun in-library (Monitor) Bool)

; Declare constant for the specific monitor
(declare-const L-2021 Monitor)

; ============================================
; Knowledge Base - Premises
; ============================================

; Premise 1: Some monitors made by LG have a type-c port
(assert (exists ((m Monitor)) (and (is-LG m) (has-type-c m))))

; Premise 2: Monitors that have a type-c port were not made before 2010
(assert (forall ((m Monitor)) (=> (has-type-c m) (not (before-2010 m)))))

; Premise 3: All monitors in the library are made before 2010
(assert (forall ((m Monitor)) (=> (in-library m) (before-2010 m))))

; Premise 4: The L-2021 monitor is either used in the library or has a type-c port
(assert (or (in-library L-2021) (has-type-c L-2021)))

; Premise 5: The L-2021 monitor is either both produced before 2010 and made by LG, or neither is true
(assert (or 
  (and (before-2010 L-2021) (is-LG L-2021))
  (and (not (before-2010 L-2021)) (not (is-LG L-2021)))))

; ============================================
; Verification: Test the Statement
; ============================================
; Statement: The L-2021 monitor either has a type-c port or is produced by LG
(assert (or (has-type-c L-2021) (is-LG L-2021)))

; Check satisfiability
; sat = Statement is TRUE (consistent with premises)
; unsat = Statement is FALSE (contradicts premises)
(check-sat)
(get-model)