; 1. Declare sorts
(declare-sort Monitor 0)

; 2. Declare functions (predicates)
(declare-fun is-LG (Monitor) Bool)
(declare-fun has-TypeC (Monitor) Bool)
(declare-fun in-Library (Monitor) Bool)
(declare-fun before-2010 (Monitor) Bool)

; 3. Declare constants
(declare-const L-2021 Monitor)
(declare-const some-monitor Monitor)

; 4. Assert knowledge base (premises)

; Premise 1: Some monitors made by LG have a type-c port.
(assert (and (is-LG some-monitor) (has-TypeC some-monitor)))

; Premise 2: Monitors that have a type-c port were not made before 2010.
(assert (forall ((m Monitor))
  (=> (has-TypeC m) (not (before-2010 m)))))

; Premise 3: All monitors in the library are made before 2010.
(assert (forall ((m Monitor))
  (=> (in-Library m) (before-2010 m))))

; Premise 4: The L-2021 monitor is either used in the library or has a type-c port.
(assert (or (in-Library L-2021) (has-TypeC L-2021)))

; Premise 5: The L-2021 monitor is either both produced before 2010 and made by LG, or neither is true.
(assert (or 
  (and (before-2010 L-2021) (is-LG L-2021))
  (and (not (before-2010 L-2021)) (not (is-LG L-2021)))
))

; 5. Assert the statement to be verified
; Statement: If (in-Library AND is-LG) OR (NOT in-Library AND NOT is-LG)
;            THEN (NOT has-TypeC AND NOT is-LG)
(assert (=> 
  (or 
    (and (in-Library L-2021) (is-LG L-2021))
    (and (not (in-Library L-2021)) (not (is-LG L-2021)))
  )
  (and 
    (not (has-TypeC L-2021))
    (not (is-LG L-2021))
  )
))

; 6. Check satisfiability
; If unsat, the statement contradicts the premises (Statement is False).
; If sat, the statement is consistent with the premises (Statement is True/Possible).
(check-sat)
(get-model)