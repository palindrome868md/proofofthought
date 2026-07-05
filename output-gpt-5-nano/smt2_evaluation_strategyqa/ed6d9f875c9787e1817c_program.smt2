; Could George Washington's own speeches have been recorded live to a compact disc?

; Sorts
(declare-sort Person 0)
(declare-sort Event 0)

; Constants
(declare-const george-washington Person)
(declare-const washington-live-cd-recording Event)

; Years
(declare-const george-washington-birth Int)
(declare-const george-washington-death Int)
(declare-const cd-available-year Int)

; Functions
(declare-fun time (Event) Int)
(declare-fun relates-to (Event Person) Bool)
(declare-fun is-live (Event) Bool)
(declare-fun recorded-on-cd (Event) Bool)

; Known facts
(assert (= george-washington-birth 1732))
(assert (= george-washington-death 1799))
(assert (= cd-available-year 1982))

; Test scenario: there exists a Washington live recording on CD
(assert (relates-to washington-live-cd-recording george-washington))
(assert (is-live washington-live-cd-recording))
(assert (recorded-on-cd washington-live-cd-recording))
(assert (>= (time washington-live-cd-recording) cd-available-year))
(assert (<= (time washington-live-cd-recording) george-washington-death))
(assert (>= (time washington-live-cd-recording) george-washington-birth))

; Check whether such a scenario is possible
(check-sat)
(get-model)