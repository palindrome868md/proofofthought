;--- Sorts ---------------------------------------------------------
(declare-sort Person 0)
(declare-sort Claim 0)

;--- Predicates ----------------------------------------------------
(declare-fun claim_denied (Person Claim) Bool)   ; the claim was rejected
(declare-fun disagree      (Person Claim) Bool)   ; the claimant disagrees with the decision
(declare-fun can_appeal    (Person Claim) Bool)   ; the claimant can appeal the decision

;--- Constants ------------------------------------------------------
(declare-const me Person)          ; the veteran who is asking the question
(declare-const myclaim Claim)      ; the lump‑sum compensation claim

;--- Knowledge base (from the document) ----------------------------
; The claim was rejected
(assert (claim_denied me myclaim))

; When a claim is rejected the veteran will naturally disagree with the decision
(assert (disagree me myclaim))

; Rule from the document:
; "If you disagree with the decision on your claim you can appeal to an independent tribunal within 12 months."
(assert (forall ((p Person) (c Claim))
  (=> (and (claim_denied p c) (disagree p c))
      (can_appeal p c))))

;--- Question to verify --------------------------------------------
; Can the veteran appeal the rejected claim?
(assert (can_appeal me myclaim))

;--- Check the result -----------------------------------------------
(check-sat)
(get-model)