;--- 1. Declare sorts -------------------------------------------------
(declare-sort Fruit 0)
(declare-sort Part 0)

;--- 2. Declare constants -----------------------------------------------
(declare-const papaya Fruit)
(declare-const center Part)        ; the central core of the papaya
(declare-const outer_flesh Part)   ; the sweet orange flesh surrounding the core

;--- 3. Declare function ------------------------------------------------
; maps a fruit to the part that is considered the best tasting
(declare-fun best-tasting-part (Fruit) Part)

;--- 4. Knowledge base --------------------------------------------------
; The two parts are different
(assert (distinct center outer_flesh))

; Common knowledge: for a papaya the best‑tasting part is the outer flesh
(assert (= (best-tasting-part papaya) outer_flesh))

;--- 5. Test the statement -----------------------------------------------
; Claim: "The best tasting part of the papaya is in the center."
(assert (= (best-tasting-part papaya) center))

;--- 6. Check the claim -------------------------------------------------
(check-sat)   ; expected result: unsat (the claim is false)
(get-model)   ; optional: shows a model for the satisfiable portion