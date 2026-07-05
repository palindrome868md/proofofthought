; Declare sorts
(declare-sort Phrase 0)

; Declare constants
(declare-const double_duty Phrase)

; Declare predicates
(declare-fun is-acceptable-phrase-for-host (Phrase) Bool)

; Knowledge base: "double_duty" is an acceptable phrase for a host
(assert (is-acceptable-phrase-for-host double_duty))

; Test: Is "double_duty" an incorrect phrase for host of Dancing With The Stars?
; If the phrase is acceptable, then asserting it's incorrect should be unsatisfiable
(assert (not (is-acceptable-phrase-for-host double_duty)))

; Check satisfiability
(check-sat)