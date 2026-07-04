; Declarations
(declare-sort Monitor 0)

; Predicates
(declare-fun lg (Monitor) Bool)          ; monitor produced by LG
(declare-fun typec (Monitor) Bool)       ; monitor has a type-C port
(declare-fun before2010 (Monitor) Bool)  ; monitor produced before 2010
(declare-fun in_library (Monitor) Bool)  ; monitor is in the library

; Constants
(declare-const l2021 Monitor)             ; The L-2021 monitor
(declare-const some-lg-m Monitor)        ; Some LG monitor (existential witness)

; Knowledge base (premises)

; 1. Some monitors made by LG have a type-c port.
(assert (and (lg some-lg-m) (typec some-lg-m)))

; 2. Monitors that have a type-c port were not made before 2010.
(assert (forall ((m Monitor)) (=> (typec m) (not (before2010 m)))))

; 3. All monitors in the library are made before 2010.
(assert (forall ((m Monitor)) (=> (in_library m) (before2010 m))))

; 4. The L-2021 monitor is either used in the library or has a type-c port.
(assert (or (in_library l2021) (typec l2021)))

; 5. The L-2021 monitor is either both produced before 2010 and made by LG, or neither is true.
(assert (or (and (before2010 l2021) (lg l2021))
            (and (not (before2010 l2021)) (not (lg l2021)))))

; Test question: The L-2021 monitor either has a type-c port or is produced by LG.
(assert (or (typec l2021) (lg l2021)))

; Check satisfiability and model
(check-sat)
(get-model)