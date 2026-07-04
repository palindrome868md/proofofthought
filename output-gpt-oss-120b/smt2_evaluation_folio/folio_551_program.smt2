;------------------------------------------------------------
; Sorts
;------------------------------------------------------------
(declare-sort Team 0)

;------------------------------------------------------------
; Functions / Predicates
;------------------------------------------------------------
; Total points a team has in the league
(declare-fun points (Team) Int)

; Points a team earned in the games *against* another team
(declare-fun pointsBetween (Team Team) Int)

; Ranking relation: first team ranks higher than second team
(declare-fun rankHigher (Team Team) Bool)

;------------------------------------------------------------
; Constants (the two teams under consideration)
;------------------------------------------------------------
(declare-const RealMadrid Team)
(declare-const Barcelona Team)

;------------------------------------------------------------
; Knowledge base (the premises)
;------------------------------------------------------------

; Premise 1: more total points → higher rank
(assert (forall ((t1 Team) (t2 Team))
  (=> (> (points t1) (points t2))
      (rankHigher t1 t2))))

; Premise 2: equal total points, but more head‑to‑head points → higher rank
(assert (forall ((t1 Team) (t2 Team))
  (=> (and (not (> (points t1) (points t2)))   ; points(t1) ≤ points(t2)
           (not (> (points t2) (points t1)))   ; points(t2) ≤ points(t1)  → equality
           (> (pointsBetween t1 t2) (pointsBetween t2 t1)))
      (rankHigher t1 t2))))

; Make the ranking relation exact (no extra rankings are allowed)
(assert (forall ((t1 Team) (t2 Team))
  (=> (rankHigher t1 t2)
      (or (> (points t1) (points t2))
          (and (not (> (points t1) (points t2)))
               (not (> (points t2) (points t1)))
               (> (pointsBetween t1 t2) (pointsBetween t2 t1)))))))

; Premise 4: Real Madrid has more total points than Barcelona
(assert (> (points RealMadrid) (points Barcelona)))

; Premise 5: in their direct games they earned the same points
(assert (= (pointsBetween RealMadrid Barcelona)
           (pointsBetween Barcelona RealMadrid)))

;------------------------------------------------------------
; Test the statement: "Barcelona ranks higher than Real Madrid"
;------------------------------------------------------------
(assert (rankHigher Barcelona RealMadrid))

;------------------------------------------------------------
; Decision problem
;------------------------------------------------------------
(check-sat)
(get-model)