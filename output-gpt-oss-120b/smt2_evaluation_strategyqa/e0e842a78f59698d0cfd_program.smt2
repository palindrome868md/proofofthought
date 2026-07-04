;--- Sorts and Functions -------------------------------------------------
; Built‑in sort String is used for the tweet text.
; Predicate that a string is a proper haiku (5‑7‑5 syllable, three lines).
(declare-fun haiku (String) Bool)

;--- Constants -----------------------------------------------------------
; A candidate tweet that we will test.
(declare-const h String)

;--- Knowledge Base -------------------------------------------------------
; The candidate is a haiku.
(assert (haiku h))

; A tweet may be at most 280 characters.
(assert (<= (str.len h) 280))

;--- Verification ---------------------------------------------------------
; Is there such a string?  (sat = yes, unsat = no)
(check-sat)
(get-model)