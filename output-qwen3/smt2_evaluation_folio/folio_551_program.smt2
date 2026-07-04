; 1. Declare sorts
; We define a sort 'Team' to represent La Liga soccer teams.
(declare-sort Team 0)

; 2. Declare functions
; 'points' maps a team to their total points (Integer).
(declare-fun points (Team) Int)
; 'h2h_points' maps two teams to the points the first team got against the second (Integer).
(declare-fun h2h_points (Team Team) Int)
; 'ranks_higher' is a boolean predicate indicating if the first team ranks higher than the second.
(declare-fun ranks_higher (Team Team) Bool)

; 3. Declare constants
; Declare the specific teams involved in the problem.
(declare-const real_madrid Team)
(declare-const barcelona Team)

; 4. Assert knowledge base (facts)

; Premise 1: A La Liga soccer team ranks higher than another if it receives more points.
(assert (forall ((t1 Team) (t2 Team))
  (=> (> (points t1) (points t2))
      (ranks_higher t1 t2))))

; Premise 2: If neither has more points than the other (tie), the team with more H2H points ranks higher.
; "Neither has more" implies points are equal.
(assert (forall ((t1 Team) (t2 Team))
  (=> (and (= (points t1) (points t2))
           (> (h2h_points t1 t2) (h2h_points t2 t1)))
      (ranks_higher t1 t2))))

; Premise 3: Real Madrid and Barcelona are La Liga soccer teams.
; (Handled by declaring them as sort Team)

; Premise 4: Real Madrid received more points than Barcelona.
(assert (> (points real_madrid) (points barcelona)))

; Premise 5: Neither Real Madrid nor Barcelona received more points from the games between them.
; This means H2H points are not greater in either direction.
(assert (not (> (h2h_points real_madrid barcelona) (h2h_points barcelona real_madrid))))
(assert (not (> (h2h_points barcelona real_madrid) (h2h_points real_madrid barcelona))))

; Semantic Axiom: "Ranks higher" implies a strict ordering (Asymmetry).
; If Team A ranks higher than Team B, Team B cannot rank higher than Team A.
; This is necessary to derive a contradiction for the verification question.
(assert (forall ((t1 Team) (t2 Team))
  (=> (ranks_higher t1 t2)
      (not (ranks_higher t2 t1)))))

; 5. Check satisfiability
; Question: Is the statement "Barcelona ranks higher than Real Madrid" true or false?
; We assert the statement and check for satisfiability.
; If 'unsat', the statement contradicts the premises (False).
; If 'sat', the statement is consistent with the premises (True/Possible).
(assert (ranks_higher barcelona real_madrid))

(check-sat)
(get-model)