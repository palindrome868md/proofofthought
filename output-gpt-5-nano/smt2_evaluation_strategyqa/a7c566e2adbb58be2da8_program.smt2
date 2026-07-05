; Question: Is 3D printing able to make adenovirus?
; Knowledge base encoded in SMT-LIB 2.0 to test the possibility.

(declare-sort Technology 0)
(declare-sort BiologicalAgent 0)

(declare-const adenovirus BiologicalAgent)
(declare-const three_d_printing Technology)

(declare-fun can-produce (Technology BiologicalAgent) Bool)

; Knowledge base: assume 3D printing cannot produce adenovirus
(assert (not (can-produce three_d_printing adenovirus)))

; Test scenario: Would 3D printing produce adenovirus?
(assert (can-produce three_d_printing adenovirus))

; Check satisfiability to determine if the statement is possible given the KB
(check-sat)
(get-model)