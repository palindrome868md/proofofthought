; Declare sorts
(declare-sort Mountain 0)
(declare-sort Location 0)
(declare-sort Ocean 0)

; Declare constants
(declare-const mount-fuji Mountain)
(declare-const sea-of-japan Ocean)

; Declare predicates/functions
(declare-fun top-out-of (Mountain Ocean) Bool)

; Knowledge base (assumptions)
(assert (not (top-out-of mount-fuji sea-of-japan)))

; Test scenario: Would the top of Mount Fuji stick out of the Sea of Japan?
(assert (top-out-of mount-fuji sea-of-japan))

; Check satisfiability to answer the question
(check-sat)