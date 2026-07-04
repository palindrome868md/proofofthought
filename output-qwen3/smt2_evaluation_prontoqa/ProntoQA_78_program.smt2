; Reasoning Steps:
; 1. Identify the entity: Fae.
; 2. Identify the starting property: Fae is a vumpus.
; 3. Trace the logical chain from 'vumpus':
;    - vumpus -> dumpus
;    - dumpus -> rompus
;    - rompus -> wumpus
;    - wumpus -> yumpus
;    - yumpus -> small
; 4. Conclusion: Fae must be small.
; 5. Verification Strategy: Assert the Knowledge Base, assert "Fae is small", and check satisfiability.
;    - If 'sat', the statement is consistent/True.
;    - If 'unsat', the statement contradicts the KB/False.
; 6. Expected Result: sat (True).

(declare-sort Thing 0)

; Declare predicates for types
(declare-fun is_impus (Thing) Bool)
(declare-fun is_vumpus (Thing) Bool)
(declare-fun is_jompus (Thing) Bool)
(declare-fun is_dumpus (Thing) Bool)
(declare-fun is_rompus (Thing) Bool)
(declare-fun is_wumpus (Thing) Bool)
(declare-fun is_yumpus (Thing) Bool)
(declare-fun is_zumpus (Thing) Bool)
(declare-fun is_tumpus (Thing) Bool)
(declare-fun is_numpus (Thing) Bool)

; Declare predicates for properties
(declare-fun is_happy (Thing) Bool)
(declare-fun is_brown (Thing) Bool)
(declare-fun is_small (Thing) Bool)
(declare-fun is_earthy (Thing) Bool)
(declare-fun is_transparent (Thing) Bool)
(declare-fun is_kind (Thing) Bool)
(declare-fun is_liquid (Thing) Bool)
(declare-fun is_hot (Thing) Bool)

; Declare constant for Fae
(declare-const Fae Thing)

; --- Knowledge Base ---

; 1. Each impus is not happy.
(assert (forall ((x Thing)) (=> (is_impus x) (not (is_happy x)))))

; 2. Each impus is a vumpus.
(assert (forall ((x Thing)) (=> (is_impus x) (is_vumpus x))))

; 3. Each vumpus is brown.
(assert (forall ((x Thing)) (=> (is_vumpus x) (is_brown x))))

; 4. Vumpuses are dumpuses.
(assert (forall ((x Thing)) (=> (is_vumpus x) (is_dumpus x))))

; 5. Each jompus is not small.
(assert (forall ((x Thing)) (=> (is_jompus x) (not (is_small x)))))

; 6. Dumpuses are not earthy.
(assert (forall ((x Thing)) (=> (is_dumpus x) (not (is_earthy x)))))

; 7. Every dumpus is a rompus.
(assert (forall ((x Thing)) (=> (is_dumpus x) (is_rompus x))))

; 8. Each rompus is transparent.
(assert (forall ((x Thing)) (=> (is_rompus x) (is_transparent x))))

; 9. Rompuses are wumpuses.
(assert (forall ((x Thing)) (=> (is_rompus x) (is_wumpus x))))

; 10. Wumpuses are kind.
(assert (forall ((x Thing)) (=> (is_wumpus x) (is_kind x))))

; 11. Wumpuses are yumpuses.
(assert (forall ((x Thing)) (=> (is_wumpus x) (is_yumpus x))))

; 12. Yumpuses are small.
(assert (forall ((x Thing)) (=> (is_yumpus x) (is_small x))))

; 13. Each yumpus is a zumpus.
(assert (forall ((x Thing)) (=> (is_yumpus x) (is_zumpus x))))

; 14. Each zumpus is liquid.
(assert (forall ((x Thing)) (=> (is_zumpus x) (is_liquid x))))

; 15. Zumpuses are tumpuses.
(assert (forall ((x Thing)) (=> (is_zumpus x) (is_tumpus x))))

; 16. Tumpuses are hot.
(assert (forall ((x Thing)) (=> (is_tumpus x) (is_hot x))))

; 17. Each tumpus is a numpus.
(assert (forall ((x Thing)) (=> (is_tumpus x) (is_numpus x))))

; 18. Fae is a vumpus.
(assert (is_vumpus Fae))

; --- Verification ---
; Question: Is Fae small?
; We assert the statement to test its consistency with the Knowledge Base.
(assert (is_small Fae))

(check-sat)
(get-model)
```