; SMT-LIB 2.0 Program for Theorem Proving
; Problem: Logical deduction about cherries in Ben's yard

; 1. Declare Sorts
(declare-sort Item 0)

; 2. Declare Functions (Predicates)
(declare-fun is-red (Item) Bool)
(declare-fun in-yard (Item) Bool)
(declare-fun is-fruit (Item) Bool)
(declare-fun has-vitc (Item) Bool)
(declare-fun is-healthy (Item) Bool)
(declare-fun on-warning (Item) Bool)
(declare-fun is-apple (Item) Bool)

; 3. Declare Constants
(declare-const cherries Item)

; 4. Assert Knowledge Base (Premises instantiated for 'cherries')

; Premise: The cherries grow in Ben's yard.
(assert (in-yard cherries))

; Premise: Cherries are fruits (Implicit context).
(assert (is-fruit cherries))

; Premise: All red fruits that grow in Ben's yard contain some Vitamin C.
; (is-red(x) AND in-yard(x) AND is-fruit(x)) -> has-vitc(x)
(assert (=> (and (is-red cherries) (in-yard cherries) (is-fruit cherries))
            (has-vitc cherries)))

; Premise: All apples that grow in Ben's yard are red fruits.
; (is-apple(x) AND in-yard(x)) -> (is-red(x) AND is-fruit(x))
(assert (=> (and (is-apple cherries) (in-yard cherries))
            (and (is-red cherries) (is-fruit cherries))))

; Premise: All fruits that grow in Ben's yard and contain some Vitamin C are healthy.
; (is-fruit(x) AND in-yard(x) AND has-vitc(x)) -> is-healthy(x)
(assert (=> (and (is-fruit cherries) (in-yard cherries) (has-vitc cherries))
            (is-healthy cherries)))

; Premise: No fruits that grow in Ben's yard and are healthy are on a warning list.
; (is-fruit(x) AND in-yard(x) AND is-healthy(x)) -> NOT on-warning(x)
(assert (=> (and (is-fruit cherries) (in-yard cherries) (is-healthy cherries))
            (not (on-warning cherries))))

; Premise: If cherries are not apples and are not healthy, then they are red fruits.
; (NOT is-apple(x) AND NOT is-healthy(x)) -> is-red(x)
(assert (=> (and (not (is-apple cherries)) (not (is-healthy cherries)))
            (is-red cherries)))

; 5. Assert the Statement to Verify
; Statement: If the cherries are either healthy or are on a warning list, then they are not red.
; (is-healthy(cherries) OR on-warning(cherries)) -> NOT is-red(cherries)
(assert (=> (or (is-healthy cherries) (on-warning cherries))
            (not (is-red cherries))))

; 6. Check Satisfiability
; sat = True (Statement is consistent with premises)
; unsat = False (Statement contradicts premises)
(check-sat)
(get-model)