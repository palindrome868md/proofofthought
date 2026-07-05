; Sorts
(declare-sort Person 0)

; Constants
(declare-const stepfather Person)
(declare-const child Person)

; Age and eligibility-related predicates
(declare-const child-age Int)
(declare-const walking-difficulties Bool)
(declare-const habit-resident-UK Bool)
(declare-const lived-GB-last-12m Bool)

; Relationships
(declare-fun looks-after-as-parent (Person Person) Bool)
(declare-fun can-claim-DLA (Person Person) Bool)

; Knowledge base (facts)
(assert (< child-age 16))              ; child is under 16
(assert walking-difficulties)             ; child has walking difficulties
(assert habit-resident-UK)                 ; child is habitually resident in the UK
(assert lived-GB-last-12m)                ; child has lived in GB in the last 12 months

; The stepfather scenario: I am the stepfather looking after the child
(assert (looks-after-as-parent stepfather child))

; Rule: if you look after a child as a parent, you can claim DLA for that child
(assert (=> (looks-after-as-parent stepfather child)
            (can-claim-DLA stepfather child)))

; Test: can I claim DLA for the child on their behalf?
(assert (can-claim-DLA stepfather child))

; Check satisfiability and get a model if sat
(check-sat)
(get-model)