; Sorts
(declare-sort Team 0)

; Functions
(declare-fun points (Team) Int)
(declare-fun rank (Team) Int)
(declare-fun head_points (Team Team) Int)

; Constants (the two teams)
(declare-const RM Team)
(declare-const BAR Team)

; Knowledge base

; Premise: RM received more points than BAR
(assert (> (points RM) (points BAR)))

; Premise: Neither RM nor BAR received more points from the head-to-head
; i.e., head_points RM BAR = head_points BAR RM
(assert (= (head_points RM BAR) (head_points BAR RM)))

; Rule: If a team t1 has more points than t2, then t1 ranks higher than t2
(assert (forall ((t1 Team) (t2 Team))
  (=> (> (points t1) (points t2))
      (> (rank t1) (rank t2)))))

; Rule: If two teams have equal points and head-to-head points favor t1, then t1 ranks higher
(assert (forall ((a Team) (b Team))
  (=> (and (= (points a) (points b))
           (> (head_points a b) (head_points b a)))
      (> (rank a) (rank b)))))

; Statement to test: RM ranks higher than BAR
; We test the negation to determine entailment
(assert (not (> (rank RM) (rank BAR))))

; Check satisfiability and show a model if any
(check-sat)
(get-model)