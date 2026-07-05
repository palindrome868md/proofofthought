; Sorts
(declare-sort Person 0)

; Constants
(declare-const you Person)

; Predicates (properties related to Warm Home Discount eligibility)
(declare-fun guarantee-credit (Person) Bool)
(declare-fun savings-credit (Person) Bool)
(declare-fun energy-supplier-in-scheme (Person) Bool)
(declare-fun name-on-bill (Person) Bool)

; Knowledge base (scenario: you receive both Pension Credit (including Guarantee Credit) and Savings Credit)
(assert (guarantee-credit you))
(assert (savings-credit you))
(assert (energy-supplier-in-scheme you))
(assert (name-on-bill you))

; Test scenario: Are you eligible for the Warm Home Discount core group?
(assert (and
  (guarantee-credit you)
  (energy-supplier-in-scheme you)
  (name-on-bill you)
))

; Check satisfiability (answers the question)
(check-sat)
(get-model)