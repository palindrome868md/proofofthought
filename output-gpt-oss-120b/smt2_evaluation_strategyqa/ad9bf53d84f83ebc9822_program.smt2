; ------------------------------------------------------------
; Question: Does Dragon Ball shows and movies fall short of
;           Friday 13th number of projects?
; ------------------------------------------------------------

; 1. Declare integer sorts (built‑in, no need for extra sort declarations)

; 2. Declare integer constants for the counts
(declare-const db_shows Int)          ; number of Dragon Ball TV series
(declare-const db_movies Int)         ; number of Dragon Ball movies
(declare-const friday_projects Int)   ; number of Friday the 13th movies

; 3. Knowledge base: factual counts
(assert (= db_shows 4))               ; Dragon Ball, DBZ, DBGT, DBS
(assert (= db_movies 20))             ; total Dragon Ball movies released
(assert (= friday_projects 12))       ; canonical Friday the 13th films

; 4. Test the claim:
;    "Dragon Ball shows and movies fall short of Friday 13th number of projects"
;    → (db_shows + db_movies) < friday_projects
(assert (< (+ db_shows db_movies) friday_projects))

; 5. Verify the claim
(check-sat)        ; Expected result: unsat (the claim is false)
(get-model)        ; Shows the concrete values used in the model