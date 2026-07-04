;--- 1. Declare the sort for persons -------------------------------------------------
(declare-sort Person 0)

;--- 2. Declare the three Powerpuff Girls ---------------------------------------------
(declare-const blossom Person)
(declare-const bubbles Person)
(declare-const buttercup Person)

; They are all different individuals
(assert (distinct blossom bubbles buttercup))

;--- 3. Declare constants that would represent the four wrestlers needed for a
;       complete tag‑team match (two per team)
(declare-const t1_member1 Person)
(declare-const t1_member2 Person)
(declare-const t2_member1 Person)
(declare-const t2_member2 Person)

; Each team must have two *different* members
(assert (distinct t1_member1 t1_member2 t2_member1 t2_member2))

; Every member must be one of the three Powerpuff Girls
(assert (or (= t1_member1 blossom) (= t1_member1 bubbles) (= t1_member1 buttercup)))
(assert (or (= t1_member2 blossom) (= t1_member2 bubbles) (= t1_member2 buttercup)))
(assert (or (= t2_member1 blossom) (= t2_member1 bubbles) (= t2_member1 buttercup)))
(assert (or (= t2_member2 blossom) (= t2_member2 bubbles) (= t2_member2 buttercup)))

;--- 4. Check whether such an assignment is possible ---------------------------------
(check-sat)   ; Expected result: unsat (they cannot form a complete tag‑team match)
(get-model)