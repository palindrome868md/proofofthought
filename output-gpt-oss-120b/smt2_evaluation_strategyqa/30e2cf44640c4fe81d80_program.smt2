;--- 1. Declare the Game sort -------------------------------------------------
(declare-sort Game 0)

;--- 2. Declare predicates and functions ---------------------------------------
; Predicate: is the game popular?
(declare-fun is-popular (Game) Bool)

; Function: release year of a game
(declare-fun release-year (Game) Int)

;--- 3. Declare constants -------------------------------------------------------
; The Illuminati card game
(declare-const illuminati-game Game)

; Current calendar year (as of this reasoning)
(declare-const current-year Int)

;--- 4. Knowledge base ---------------------------------------------------------
; Illuminati was released in 1994
(assert (= (release-year illuminati-game) 1994))

; Assume the current year is 2026
(assert (= current-year 2026))

; Rule: Any game older than 20 years is not popular
(assert (forall ((g Game))
  (=> (> (- current-year (release-year g)) 20)
      (not (is-popular g)))))

;--- 5. Test the query ---------------------------------------------------------
; Query: Is the Illuminati card game still popular?
(assert (is-popular illuminati-game))

;--- 6. Solve -------------------------------------------------------------------
(check-sat)   ; Expected result: unsat (the statement cannot hold)
(get-model)