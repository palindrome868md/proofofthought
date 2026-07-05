; Declare sorts
(declare-sort Person 0)
(declare-sort Object 0)

; Declare constants
(declare-const ten_gallons_seawater Object)
(declare-const six_year_old Person)

; Predicates
(declare-fun could_crush (Object Person) Bool)

; Knowledge base (intentionally minimal to avoid implying real-world specifics)

; Test scenario: Could ten gallons of seawater crush a six-year-old?
(assert (could_crush ten_gallons_seawater six_year_old))

; Check satisfiability
(check-sat)
(get-model)