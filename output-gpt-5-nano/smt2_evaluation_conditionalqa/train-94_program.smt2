; Declare sorts
(declare-sort Child 0)

; Declare constants
(declare-const child-13 Child)

; Declare predicates/functions
(declare-fun age (Child) Int)
(declare-fun has-difficulties (Child) Bool)
(declare-fun care-high (Child) Bool)
(declare-fun mobility-high (Child) Bool)
(declare-fun maximum-eligible (Child) Bool)

; Scenario: 13-year-old child who uses wheelchair and needs extra support
(assert (= (age child-13) 13))
(assert (has-difficulties child-13))    ; needs extra looking after or has walking difficulties
(assert (care-high child-13))             ; highest level of care required
(assert (mobility-high child-13))         ; higher mobility component required

; Eligibility rule: if under 16 and has difficulties and high care and high mobility, then maximum eligibility holds
(assert (forall ((c Child))
  (=> (and (< (age c) 16)
           (has-difficulties c)
           (care-high c)
           (mobility-high c))
      (maximum-eligible c))))

; Test: does this child qualify for the maximum DLA payment?
(assert (maximum-eligible child-13))

; Check satisfiability and provide a model if sat
(check-sat)
(get-model)