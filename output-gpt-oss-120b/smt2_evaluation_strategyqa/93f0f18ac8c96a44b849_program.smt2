;--- 1. Sort declarations -------------------------------------------------
(declare-sort Artist 0)
(declare-sort Song 0)

;--- 2. Function / predicate declarations ----------------------------------
; Lil Jon's highest‑charting Billboard song
(declare-fun top-ranked-song (Artist) Song)

; An artist collaborates on (or is credited on) a song
(declare-fun collaborates (Song Artist) Bool)

; Membership of the rap group The Lox
(declare-fun member-of-lox (Artist) Bool)

;--- 3. Constant declarations -----------------------------------------------
; Artists
(declare-const lil-jon Artist)
(declare-const usher Artist)
(declare-const ludacris Artist)
(declare-const jadakiss Artist)
(declare-const styles-p Artist)
(declare-const sheek-louch Artist)

; Song (Lil Jon's top Billboard hit)
(declare-const yeah Song)

;--- 4. Knowledge base (facts) ---------------------------------------------
; Lil Jon's top‑ranked Billboard song is "Yeah!"
(assert (= (top-ranked-song lil-jon) yeah))

; The song "Yeah!" features Usher and Ludacris
(assert (collaborates yeah usher))
(assert (collaborates yeah ludacris))

; None of the Lox members appear on "Yeah!"
(assert (not (collaborates yeah jadakiss)))
(assert (not (collaborates yeah styles-p)))
(assert (not (collaborates yeah sheek-louch)))

; The three members of The Lox
(assert (member-of-lox jadakiss))
(assert (member-of-lox styles-p))
(assert (member-of-lox sheek-louch))

;--- 5. Test the question --------------------------------------------------
; Hypothesis: Lil Jon's top song collaborates with a member of The Lox
; (choose Jadakiss as a representative Lox member)
(assert (collaborates (top-ranked-song lil-jon) jadakiss))

;--- 6. Check the result ---------------------------------------------------
(check-sat)   ; Expected result: unsat (the hypothesis cannot hold)
(get-model)