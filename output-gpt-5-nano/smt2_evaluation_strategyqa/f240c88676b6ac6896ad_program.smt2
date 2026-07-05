; Sorts
(declare-sort Vessel 0)

; Constants
(declare-const kayak Vessel)

; Predicates
(declare-fun traditional-nz (Vessel) Bool)

; Knowledge base (facts)
; In our knowledge base, kayak is NOT a traditional boat in New Zealand
(assert (not (traditional-nz kayak)))

; Test scenario: "Is the kayak a traditional boat in New Zealand?"
; We test by asserting that there exists some vessel test-v such that
; test-v equals kayak and test-v is traditional NZ boat.
(declare-const test-v Vessel)
(assert (= test-v kayak))
(assert (traditional-nz test-v))

; Verification: does the knowledge base allow kayak to be a traditional NZ boat?
(check-sat)