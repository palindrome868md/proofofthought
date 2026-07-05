; Declare sorts
(declare-sort Country 0)

; Enumerated datatype for school subjects
(declare-datatypes () ((Subject art) (Subject math) (Subject science)))  ; Note: using constructors art, math, science

; Uninterpreted predicate indicating prioritization of a subject in a country
(declare-fun prioritized (Country Subject) Bool)

; Constant for United States
(declare-const us Country)

; Knowledge base: art is prioritized in the US
(assert (prioritized us art))

; Test: Is art prioritized in the US education system?
(assert (prioritized us art))

; Check satisfiability to answer the question
(check-sat)
(get-model)