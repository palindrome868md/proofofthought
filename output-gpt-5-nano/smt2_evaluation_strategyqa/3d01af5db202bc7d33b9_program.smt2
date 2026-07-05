; Sorts
(declare-sort City 0)
(declare-sort Plant 0)

; Enumerated datatype for labels (names)
(declare-datatypes () ((Label eggplant brinjal)))

; Constants
(declare-const mumbai City)
(declare-const s_melongena Plant)

; Predicate: in a given City, for a given Plant, what Label is used
(declare-fun prefers (City Plant Label) Bool)

; Knowledge base
; In Mumbai, Solanum melongena is referred to as brinjal
(assert (prefers mumbai s_melongena brinjal))

; Rule: If in Mumbai a label is used for any plant, that label must be brinjal
(assert (forall ((pl Plant) (lb Label))
  (=> (prefers mumbai pl lb)
      (= lb brinjal))))

; Test: Would someone in Mumbai refer to Solanum melongena as an eggplant?
(assert (prefers mumbai s_melongena eggplant))

; Check satisfiability to answer the question
(check-sat)