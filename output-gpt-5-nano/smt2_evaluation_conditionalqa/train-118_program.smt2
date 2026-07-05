; Scenario-based reasoning for maternity allowances

; Facts about the user scenario
; You are expecting your first child
(declare-const you-first-child Bool)
(assert (= you-first-child true))

; You live outside Scotland (for this model)
(declare-const in-scotland Bool)
(assert (= in-scotland false))

; You or your partner currently receive qualifying benefits
(declare-const has-benefits Bool)
(assert (= has-benefits true))

; Derived eligibilities
; Sure Start Maternity Grant (SSMG): requires first child AND benefits
(declare-const ssmg-eligible Bool)
(assert (= ssmg-eligible (and you-first-child has-benefits)))

; Pregnancy and Baby Payment (PBP) for Scotland: requires in Scotland AND first child AND benefits
(declare-const pbp-eligible Bool)
(assert (= pbp-eligible (and in-scotland you-first-child has-benefits)))

; Is there any form you can apply for, given the knowledge base?
(assert (or ssmg-eligible pbp-eligible))

; Check satisfiability to answer the question: "Am I allowed to apply for any form of maternity allowances?"
(check-sat)
(get-model)