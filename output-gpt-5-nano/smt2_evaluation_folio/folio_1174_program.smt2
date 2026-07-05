; Sorts
(declare-sort Monitor 0)

; Predicates (properties of monitors)
(declare-fun in_library (Monitor) Bool)
(declare-fun has_typec (Monitor) Bool)
(declare-fun produced_before_2010 (Monitor) Bool)
(declare-fun made_by_LG (Monitor) Bool)

; Constants
(declare-const l2021 Monitor)

; Witness for existential statement in Premise 1
(declare-const witness Monitor)

; Premises (Knowledge Base)

; 1. Some monitors made by LG have a type-c port.
(assert (and (made_by_LG witness) (has_typec witness)))

; 2. Monitors that have a type-c port were not made before 2010.
(assert (forall ((m Monitor)) 
  (=> (has_typec m) (not (produced_before_2010 m)))))

; 3. All monitors in the library are made before 2010.
(assert (forall ((m Monitor))
  (=> (in_library m) (produced_before_2010 m))))

; 4. The L-2021 monitor is either used in the library or has a type-c port.
(assert (or (in_library l2021) (has_typec l2021)))

; 5. The L-2021 monitor is either both produced before 2010 and made by LG, or neither is true.
;    This encodes C(l2021) ↔ D(l2021) where C = produced_before_2010(l2021), D = made_by_LG(l2021)
(assert (= (produced_before_2010 l2021) (made_by_LG l2021)))

; Test: The monitor L-2021 is either in the library or produced by LG.
(assert (or (in_library l2021) (made_by_LG l2021)))

; Check satisfiability and get model
(check-sat)
(get-model)