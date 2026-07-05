; Sorts
(declare-sort Person 0)
(declare-sort Flower 0)

; Constants
(declare-const little-prince Person)
(declare-const rose Flower)

; Predicates
(declare-fun allergic (Person Flower) Bool)

; Knowledge base
; The Little Prince is not allergic to any flower (based on narrative)
(assert (forall ((f Flower)) (not (allergic little-prince f))))

; Test scenario: Is the Little Prince allergic to roses?
(assert (allergic little-prince rose))

; Verification
(check-sat)
(get-model)