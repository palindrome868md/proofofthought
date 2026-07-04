;--- Declarations -------------------------------------------------
(declare-const episodes Int)        ; number of episodes of Ugly Betty
(declare-const ep_len Int)          ; length of one episode (minutes)
(declare-const total_time Int)      ; total minutes needed to watch all episodes
(declare-const week_minutes Int)    ; minutes contained in one week

;--- Knowledge base ------------------------------------------------
; Known facts about the series
(assert (= episodes 77))            ; Ugly Betty has 77 episodes
(assert (= ep_len 42))              ; average episode length ≈ 42 minutes

; Define total watching time
(assert (= total_time (* episodes ep_len)))

; Define minutes in a week (7 days × 24 h × 60 min)
(assert (= week_minutes (* 7 24 60)))

;--- Query: Is a week enough? --------------------------------------
; We ask whether the total required minutes fit inside a week.
(assert (<= total_time week_minutes))

;--- Solve ---------------------------------------------------------
(check-sat)
(get-model)