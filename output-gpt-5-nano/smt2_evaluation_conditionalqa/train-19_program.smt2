; Question: Can I appeal the decision on my lump-sum compensation claim?

; Knowledge base (scaled to this scenario):
; - If a decision is rejected, you can appeal to an independent tribunal.
; - You can also seek reconsideration from Veterans UK (not strictly modeled here).

; Declare scenario variables
(declare-const decision-rejected Bool)
(assert decision-rejected)      ; The lump-sum claim was rejected

; Declare a predicate representing the possibility of appealing to a tribunal
(declare-const can-appeal-tribunal Bool)

; Rule: If a decision is rejected, you can appeal to a tribunal
(assert (=> decision-rejected can-appeal-tribunal))

; Test scenario: there exists an appeal path (to test the question)
(assert can-appeal-tribunal)

; Check satisfiability to answer the question
(check-sat)
(get-model)