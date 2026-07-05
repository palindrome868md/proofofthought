; Scenario: You are currently the deputy (since Aug 2018) for your elderly mother.
; Policy encoded from the document:
; - If you are still acting as a deputy, you do not need to apply for a deputyship refund.
; - A refund claim is only necessary if the deputyship was active in 2008-2015.
;
; We encode:
; currently_deputy = true
; deputyship_2008_2015 = false
; need_to_apply = ? (to be tested)

(declare-const currently_deputy Bool)
(declare-const deputyship_2008_2015 Bool)
(declare-const need_to_apply Bool)

; Facts reflecting the scenario
(assert (= currently_deputy true))
(assert (= deputyship_2008_2015 false))

; Rules from the document
; If you are still acting as a deputy, you do not need to apply
(assert (=> currently_deputy (not need_to_apply)))
; If the deputyship was active in 2008-2015, you would need to apply
(assert (=> deputyship_2008_2015 need_to_apply))

; Test: Do you need to apply for a deputyship fee refund?
; This asserts the proposition we are testing: need_to_apply
(assert need_to_apply)

; Check satisfiability and provide a model if sat
(check-sat)
(get-model)