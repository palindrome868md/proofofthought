; SMT-LIB 2.0 Program to verify if "The cherries are apples" is true based on premises.

; 1. Declare Sorts
(declare-sort Item 0)

; 2. Declare Functions (Predicates)
(declare-fun is-red (Item) Bool)
(declare-fun is-apple (Item) Bool)
(declare-fun is-fruit (Item) Bool)
(declare-fun in-yard (Item) Bool)
(declare-fun has-vitc (Item) Bool)
(declare-fun is-healthy (Item) Bool)
(declare-fun on-warning (Item) Bool)

; 3. Declare Constants
(declare-const cherries Item)

; 4. Assert Knowledge Base (Premises)

; Premise 1: All red fruits that grow in Ben's yard contain some Vitamin C.
(assert (forall ((x Item))
  (=> (and (is-red x) (is-fruit x) (in-yard x))
      (has-vitc x))))

; Premise 2: All apples that grow in Ben's yard are red fruits.
(assert (forall ((x Item))
  (=> (and (is-apple x) (in-yard x))
      (and (is-red x) (is-fruit x)))))

; Premise 3: All fruits that grow in Ben's yard and contain some Vitamin C are healthy.
(assert (forall ((x Item))
  (=> (and (is-fruit x) (in-yard x) (has-vitc x))
      (is-healthy x))))

; Premise 4: No fruits that grow in Ben's yard and are healthy are on a warning list.
(assert (forall ((x Item))
  (=> (and (is-fruit x) (in-yard x) (is-healthy x))
      (not (on-warning x)))))

; Premise 5: The cherries grow in Ben's yard. (Implicitly cherries are fruits)
(assert (in-yard cherries))
(assert (is-fruit cherries))

; Premise 6: If cherries are not apples and are not healthy, then they are red fruits.
(assert (=> (and (not (is-apple cherries)) (not (is-healthy cherries)))
            (and (is-red cherries) (is-fruit cherries))))

; 5. Assert Test Scenario (Statement to Verify)
; Statement: "The cherries are apples."
(assert (is-apple cherries))

; 6. Check Satisfiability
; sat = True (Statement is consistent/possible given premises)
; unsat = False (Statement contradicts premises)
(check-sat)
(get-model)