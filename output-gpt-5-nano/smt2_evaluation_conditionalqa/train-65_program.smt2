; Scotland vs remote witnessing for wills

; Declare locations as an enumerated datatype
(declare-datatypes () ((Location scotland england wales)))

; Predicate: is remote witnessing allowed at a given location
(declare-fun remote-witness-allowed (Location) Bool)

; Knowledge base: remote witnessing is allowed in England and Wales, not in Scotland
(assert (= (remote-witness-allowed scotland) false))
(assert (= (remote-witness-allowed england) true))
(assert (= (remote-witness-allowed wales) true))

; Scenario: the signer is currently in Scotland
(declare-const signer-location Location)
(assert (= signer-location scotland))

; Test proposition: can the signing be witnessed remotely given the signer is in their location?
(declare-const can-witness-remotely Bool)
(assert (= can-witness-remotely (remote-witness-allowed signer-location)))
; Assert the test scenario (i.e., assume remote witnessing happens)
(assert can-witness-remotely)

; Check satisfiability to answer the question
(check-sat)