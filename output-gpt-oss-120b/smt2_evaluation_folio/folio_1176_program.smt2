;--- Sort declaration -------------------------------------------------
(declare-sort Monitor 0)

;--- Predicate/function declarations -----------------------------------
(declare-fun made-by-lg (Monitor) Bool)
(declare-fun has-type-c (Monitor) Bool)
(declare-fun made-before-2010 (Monitor) Bool)
(declare-fun in-library (Monitor) Bool)

;--- Constants ---------------------------------------------------------
(declare-const L2021 Monitor)   ; the monitor in question
(declare-const m0 Monitor)      ; witness for the existential premise

;--- Premises -----------------------------------------------------------
; 1. Some monitor made by LG has a type‑c port
(assert (and (made-by-lg m0) (has-type-c m0)))

; 2. Monitors with a type‑c port were NOT made before 2010
(assert (forall ((x Monitor))
  (=> (has-type-c x) (not (made-before-2010 x)))))

; 3. All monitors in the library are made before 2010
(assert (forall ((x Monitor))
  (=> (in-library x) (made-before-2010 x))))

; 4. L‑2021 is either in the library or has a type‑c port
(assert (or (in-library L2021) (has-type-c L2021)))

; 5. L‑2021 is either both produced before 2010 and made by LG,
;    or neither is true  (i.e., the two properties are equivalent)
(assert (= (made-before-2010 L2021) (made-by-lg L2021)))

;--- Antecedent of the statement ----------------------------------------
; (in-library ∧ made-by-lg) ∨ (¬in‑library ∧ ¬made-by-lg)
(assert (or (and (in-library L2021) (made-by-lg L2021))
            (and (not (in-library L2021)) (not (made-by-lg L2021)))))

;--- Negation of the consequent -----------------------------------------
; Negation of (¬has-type-c ∧ ¬made-by-lg)  is  (has-type-c ∨ made-by-lg)
(assert (or (has-type-c L2021) (made-by-lg L2021)))

;--- Check whether the premises plus the above assertions are consistent
(check-sat)
(get-model)