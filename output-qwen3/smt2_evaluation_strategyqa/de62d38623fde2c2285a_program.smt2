; Question: Would a week be enough time to watch every episode of Ugly Betty?

; Declare sorts
(declare-sort Show 0)

; Declare functions
(declare-fun num-episodes (Show) Int)
(declare-fun episode-duration (Show) Int)  ; in minutes
(declare-fun total-watch-time (Show) Int)  ; in minutes

; Declare constants
(declare-const ugly-betty Show)
(declare-const one-week-minutes Int)

; Knowledge base: Ugly Betty facts
; Ugly Betty has 85 episodes across 4 seasons
(assert (= (num-episodes ugly-betty) 85))

; Average episode duration is approximately 45 minutes (without commercials)
(assert (= (episode-duration ugly-betty) 45))

; Total watch time = number of episodes × duration per episode
(assert (= (total-watch-time ugly-betty) (* (num-episodes ugly-betty) (episode-duration ugly-betty))))

; One week = 7 days × 24 hours × 60 minutes = 10080 minutes
(assert (= one-week-minutes 10080))

; Test: Would a week be enough time?
; Assert that total watch time is less than or equal to one week
(assert (<= (total-watch-time ugly-betty) one-week-minutes))

; Check satisfiability
; If sat: Yes, a week would be enough time
; If unsat: No, a week would not be enough time
(check-sat)
(get-model)