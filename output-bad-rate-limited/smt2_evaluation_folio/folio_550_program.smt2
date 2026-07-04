; Declare sorts
(declare-sort Team 0)

; Declare constants (the two teams)
(declare-const real_madrid Team)
(declare-const barcelona Team)

; Declare relations/functions
(declare-fun points (Team) Int)
(declare-fun headPoints (Team Team) Int)
(declare-fun ranksHigherThan (Team Team) Bool)

; Knowledge base (premises)

; Real Madrid has more total points than Barcelona
(assert (> (points real_madrid) (points barcelona)))

; Ranking rule: a team ranks higher if it has more points
(assert (forall ((a Team) (b Team))
  (=> (> (points a) (points b))
      (ranksHigherThan a b))))

; Tie-break rule: if equal total points, the team with more head-to-head points ranks higher
(assert (forall ((a Team) (b Team))
  (=> (and (not (= a b)) (= (points a) (points b)))
      (=> (> (headPoints a b) (headPoints b a))
          (ranksHigherThan a b)))))

; Opposite tie-break direction (for completeness)
(assert (forall ((a Team) (b Team))
  (=> (and (not (= a b)) (= (points a) (points b)))
      (=> (> (headPoints b a) (headPoints a b))
          (ranksHigherThan b a)))))

; Premise: head-to-head points between Real Madrid and Barcelona are equal
(assert (= (headPoints real_madrid barcelona) (headPoints barcelona real_madrid)))

; Test scenario: Is Real Madrid ranked higher than Barcelona?
(assert (ranksHigherThan real_madrid barcelona))

; Check satisfiability and produce a model
(check-sat)
(get-model)