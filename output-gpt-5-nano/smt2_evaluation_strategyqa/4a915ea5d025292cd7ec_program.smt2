; Declare sorts
(declare-sort Country 0)

; Declare constants
(declare-const japan Country)
(declare-const england Country)

; Declare functions
(declare-fun status_of_serfdom (Country) Int)

; Knowledge base: assign statuses (0 = lowest, 2 = highest) for Japan and England
(assert (= (status_of_serfdom japan) 2))
(assert (= (status_of_serfdom england) 1))

; Optional domain constraints (keep statuses within a reasonable range)
(assert (and (>= (status_of_serfdom japan) 0) (<= (status_of_serfdom japan) 2)))
(assert (and (>= (status_of_serfdom england) 0) (<= (status_of_serfdom england) 2)))

; Test: Did Japanese serfdom have higher status than English counterpart?
(assert (> (status_of_serfdom japan) (status_of_serfdom england)))

; Check satisfiability (answers the question)
(check-sat)