; Declare sorts
(declare-sort Team 0)

; Declare functions
(declare-fun Points (Team) Int)
(declare-fun headtohead (Team Team) Int)
(declare-fun ranks-higher (Team Team) Bool)

; Declare constants
(declare-const real-madrid Team)
(declare-const barcelona Team)

; Knowledge base (premises)

; Real Madrid has more points than Barcelona
(assert (> (Points real-madrid) (Points barcelona)))

; Head-to-head points: neither RM nor Barca received more points from their games
; i.e., head-to-head points are equal
(assert (= (headtohead real-madrid barcelona) (headtohead barcelona real-madrid)))

; Ranking rule: a team ranks higher than another iff it has more points
(assert (forall ((t1 Team) (t2 Team))
  (=> (ranks-higher t1 t2) (> (Points t1) (Points t2)))))

(assert (forall ((t1 Team) (t2 Team))
  (=> (> (Points t1) (Points t2)) (ranks-higher t1 t2))))

; Tie-break rule: if points are equal, the team with more head-to-head points ranks higher
(assert (forall ((t1 Team) (t2 Team))
  (=> (= (Points t1) (Points t2))
      (=> (> (headtohead t1 t2) (headtohead t2 t1))
          (ranks-higher t1 t2)))))

; Test scenario: Would Barcelona rank higher than Real Madrid?
(assert (ranks-higher barcelona real-madrid))

; Check satisfiability
(check-sat)
(get-model)