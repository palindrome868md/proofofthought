(set-logic ALL)
(set-option :produce-models true)

; 1. Declare sorts
(declare-sort Team 0)

; 2. Declare functions
(declare-fun is-la-liga (Team) Bool)
(declare-fun points (Team) Int)
(declare-fun h2h-points (Team Team) Int)
(declare-fun ranks-higher (Team Team) Bool)

; 3. Declare constants
(declare-const real-madrid Team)
(declare-const barcelona Team)

; 4. Assert knowledge base (facts)

; Real Madrid and Barcelona are both La Liga soccer teams.
(assert (is-la-liga real-madrid))
(assert (is-la-liga barcelona))

; Rule 1: A La Liga soccer team ranks higher than another La Liga soccer team if it receives more points.
(assert (forall ((t1 Team) (t2 Team))
  (=> (and (is-la-liga t1)
           (is-la-liga t2)
           (> (points t1) (points t2)))
      (ranks-higher t1 t2))))

; Rule 2: If there are two La Liga soccer teams and neither has more points than the other, 
; then the team which receives more points from the games between the two teams ranks higher.
(assert (forall ((t1 Team) (t2 Team))
  (=> (and (is-la-liga t1)
           (is-la-liga t2)
           (= (points t1) (points t2))
           (> (h2h-points t1 t2) (h2h-points t2 t1)))
      (ranks-higher t1 t2))))

; Real Madrid received more points than Barcelona.
(assert (> (points real-madrid) (points barcelona)))

; Neither Real Madrid nor Barcelona received more points from the games between them.
(assert (not (> (h2h-points real-madrid barcelona) (h2h-points barcelona real-madrid))))
(assert (not (> (h2h-points barcelona real-madrid) (h2h-points real-madrid barcelona))))

; 5. Verification
; Statement: Real Madrid ranks higher than Barcelona.
; We assert the statement to check if it is consistent with the knowledge base.
; Expected: sat (True)
(assert (ranks-higher real-madrid barcelona))

(check-sat)
(get-model)