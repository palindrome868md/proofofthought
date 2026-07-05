; Declare sorts
(declare-sort Vessel 0)
(declare-sort Location 0)

; Declare constants
(declare-const oasis Vessel)
(declare-const lincoln-tunnel Location)

; Declare predicates
(declare-fun traverses (Vessel Location) Bool)
(declare-fun is-cruise-ship (Vessel) Bool)

; Knowledge base
(assert (is-cruise-ship oasis))

; Rule: Cruise ships cannot traverse Lincoln Tunnel
(assert (forall ((v Vessel))
  (=> (is-cruise-ship v)
      (not (traverses v lincoln-tunnel)))))

; Test scenario: Would Oasis traverse Lincoln Tunnel?
(assert (traverses oasis lincoln-tunnel))

; Check satisfiability to answer the question
(check-sat)