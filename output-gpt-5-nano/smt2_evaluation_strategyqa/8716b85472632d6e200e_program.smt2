; Declare sorts
(declare-sort Resort 0)

; Declare constants
(declare-const Disneyland-Paris Resort)
(declare-const Walt-Disney-World Resort)

; Declare predicate: largest resort
(declare-fun largest (Resort) Bool)

; Knowledge base
; Walt Disney World is the largest
(assert (largest Walt-Disney-World))

; Uniqueness constraint: if any other resort is largest, Disneyland-Paris is not largest
(assert (forall ((r Resort))
  (=> (and (largest r) (not (= r Disneyland-Paris)))
      (not (largest Disneyland-Paris)))))

; Test scenario: Is Disneyland-Paris the largest Disney resort?
(assert (largest Disneyland-Paris))

; Check satisfiability
(check-sat)
(get-model)