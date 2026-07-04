; 1. Declare constants
(declare-const service-injury Bool)
(declare-const claim-rejected Bool)
(declare-const can-appeal Bool)

; 2. Assert knowledge base
; Rule: If a claim decision is made (specifically rejected), the claimant can appeal.
; Source: "If you disagree with the decision on your claim ... You can also appeal to an independent tribunal"
(assert (=> claim-rejected can-appeal))

; 3. Assert scenario
; Fact: "I was injured when I served in armed forces"
(assert service-injury)
; Fact: "my claim was rejected"
(assert claim-rejected)

; 4. Test Question: Can I appeal the decision?
; We assert the possibility of appeal to check consistency with the KB and Scenario
(assert can-appeal)

; 5. Check satisfiability
(check-sat)
(get-model)