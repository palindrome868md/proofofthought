; Would a week be enough time to watch every episode of Ugly Betty?
; Knowledge base: 85 episodes, ~42 minutes per episode

(declare-const uglybetty-episodes Int)
(declare-const uglybetty-minute-per-episode Int)

; Facts about Ugly Betty
(assert (= uglybetty-episodes 85))
(assert (= uglybetty-minute-per-episode 42))

; Test: Is total viewing time within one week (10080 minutes)?
(assert (<= (* uglybetty-episodes uglybetty-minute-per-episode) 10080))

(check-sat)
(get-model)