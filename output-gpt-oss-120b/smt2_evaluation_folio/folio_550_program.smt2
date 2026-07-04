; -------------------------------------------------
; 1. Declare the sort for La Liga soccer teams
; -------------------------------------------------
(declare-sort Team 0)

; -------------------------------------------------
; 2. Declare the necessary functions
; -------------------------------------------------
; Total points a team has in the league
(declare-fun points (Team) Int)

; Points a team earned *against* another team
(declare-fun points-between (Team Team) Int)

; Ranking relation: first team ranks higher than second
(declare-fun rank-higher (Team Team) Bool)

; -------------------------------------------------
; 3. Declare the two concrete teams
; -------------------------------------------------
(declare-const real-madrid Team)
(declare-const barcelona   Team)

; -------------------------------------------------
; 4. Knowledge base (the premises)
; -------------------------------------------------
; Premise 1: more total points ⇒ higher rank
(assert (forall ((a Team) (b Team))
        (=> (> (points a) (points b))
            (rank-higher a b))))

; Premise 2: if total points are equal, the team with more
; head‑to‑head points ranks higher
(assert (forall ((a Team) (b Team))
        (=> (and (= (points a) (points b))
                 (> (points-between a b) (points-between b a)))
            (rank-higher a b))))

; Symmetric direction of Premise 2 (for completeness)
(assert (forall ((a Team) (b Team))
        (=> (and (= (points a) (points b))
                 (> (points-between b a) (points-between a b)))
            (rank-higher b a))))

; Premise 3: the two constants are La Liga teams (no extra axiom needed)

; Premise 4: Real Madrid received more points than Barcelona
(assert (> (points real-madrid) (points barcelona)))

; Premise 5: Neither team received more points from the games between them
; i.e., the head‑to‑head points are equal
(assert (not (> (points-between real-madrid barcelona)
                (points-between barcelona real-madrid))))
(assert (not (> (points-between barcelona real-madrid)
                (points-between real-madrid barcelona))))

; -------------------------------------------------
; 5. Statement to be verified:
;    "Real Madrid ranks higher than Barcelona."
; -------------------------------------------------
(assert (rank-higher real-madrid barcelona))

; -------------------------------------------------
; 6. Ask Z3 whether the whole set is satisfiable
; -------------------------------------------------
(check-sat)
(get-model)