; Sorts
(declare-sort Team 0)

; Team constants
(declare-const real_madrid Team)
(declare-const barcelona Team)

; Predicates / Functions
(declare-fun points (Team) Int)
(declare-fun head (Team Team) Int) ; points earned by first team in head-to-head games vs second
(declare-fun ranks (Team Team) Bool)

; Knowledge base (premises)
; Real Madrid has more league points than Barcelona
(assert (> (points real_madrid) (points barcelona)))
; Neither team received more points from the head-to-head games between them
(assert (= (head real_madrid barcelona) (head barcelona real_madrid)))

; Ranking rules (as per problem statement)
; 1) A team ranks higher than another if it has more points
(assert (forall ((t1 Team) (t2 Team))
  (=> (> (points t1) (points t2))
      (ranks t1 t2))))
; 2) If points are equal, the team with more head-to-head points ranks higher
(assert (forall ((t1 Team) (t2 Team))
  (=> (and (= (points t1) (points t2))
           (> (head t1 t2) (head t2 t1)))
      (ranks t1 t2))))

; Test: Does Barcelona rank higher than Real Madrid?
(assert (ranks barcelona real_madrid))

; Check satisfiability (single check)
(check-sat)
(get-model)