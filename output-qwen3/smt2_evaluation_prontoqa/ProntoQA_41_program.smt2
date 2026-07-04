; Declare the sort for entities
(declare-sort Thing 0)

; Declare predicates for categories
(declare-fun is-rompus (Thing) Bool)
(declare-fun is-yumpus (Thing) Bool)
(declare-fun is-jompus (Thing) Bool)
(declare-fun is-wumpus (Thing) Bool)
(declare-fun is-zumpus (Thing) Bool)
(declare-fun is-numpus (Thing) Bool)
(declare-fun is-dumpus (Thing) Bool)
(declare-fun is-impus (Thing) Bool)
(declare-fun is-vumpus (Thing) Bool)
(declare-fun is-tumpus (Thing) Bool)

; Declare predicates for properties
(declare-fun prop-transparent (Thing) Bool)
(declare-fun prop-earthy (Thing) Bool)
(declare-fun prop-large (Thing) Bool)
(declare-fun prop-brown (Thing) Bool)
(declare-fun prop-hot (Thing) Bool)
(declare-fun prop-dull (Thing) Bool)
(declare-fun prop-bitter (Thing) Bool)
(declare-fun prop-shy (Thing) Bool)

; Declare constant for Max
(declare-const Max Thing)

; --- Knowledge Base ---

; 1. Rompuses are transparent
(assert (forall ((x Thing)) (=> (is-rompus x) (prop-transparent x))))

; 2. Every rompus is a yumpus
(assert (forall ((x Thing)) (=> (is-rompus x) (is-yumpus x))))

; 3. Yumpuses are earthy
(assert (forall ((x Thing)) (=> (is-yumpus x) (prop-earthy x))))

; 4. Yumpuses are jompuses
(assert (forall ((x Thing)) (=> (is-yumpus x) (is-jompus x))))

; 5. Every jompus is not large
(assert (forall ((x Thing)) (=> (is-jompus x) (not (prop-large x)))))

; 6. Each jompus is a wumpus
(assert (forall ((x Thing)) (=> (is-jompus x) (is-wumpus x))))

; 7. Each wumpus is not brown
(assert (forall ((x Thing)) (=> (is-wumpus x) (not (prop-brown x)))))

; 8. Tumpuses are hot
(assert (forall ((x Thing)) (=> (is-tumpus x) (prop-hot x))))

; 9. Wumpuses are zumpuses
(assert (forall ((x Thing)) (=> (is-wumpus x) (is-zumpus x))))

; 10. Every zumpus is dull
(assert (forall ((x Thing)) (=> (is-zumpus x) (prop-dull x))))

; 11. Zumpuses are numpuses
(assert (forall ((x Thing)) (=> (is-zumpus x) (is-numpus x))))

; 12. Numpuses are bitter
(assert (forall ((x Thing)) (=> (is-numpus x) (prop-bitter x))))

; 13. Every numpus is a dumpus
(assert (forall ((x Thing)) (=> (is-numpus x) (is-dumpus x))))

; 14. Dumpuses are not shy
(assert (forall ((x Thing)) (=> (is-dumpus x) (not (prop-shy x)))))

; 15. Each dumpus is an impus
(assert (forall ((x Thing)) (=> (is-dumpus x) (is-impus x))))

; 16. Impuses are not hot
(assert (forall ((x Thing)) (=> (is-impus x) (not (prop-hot x)))))

; 17. Impuses are vumpuses
(assert (forall ((x Thing)) (=> (is-impus x) (is-vumpus x))))

; 18. Max is a wumpus
(assert (is-wumpus Max))

; --- Verification ---
; Question: Is the following statement true or false? Max is not hot.
; We assert the statement "Max is not hot" and check satisfiability.
; If sat, the statement is True (consistent with KB).
; If unsat, the statement is False (contradicts KB).
(assert (not (prop-hot Max)))

(check-sat)
(get-model)