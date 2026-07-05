; Sorts
(declare-sort Person 0)
(declare-sort Substance 0)

; Color datatype (zombie is one possible color)
; Colors: zombie, normal
(declare-datatypes () ((Color (zombie) (normal))))

; Constants / terms
(declare-const nickel Substance)
(declare-const test-person Person)

; Functions / predicates
; Skin color of a person
(declare-fun skin-color (Person) Color)

; Exposure relation: person p was exposed to substance s
(declare-fun exposed-to (Person Substance) Bool)

; Knowledge base
; If a person is exposed to any substance, their skin color becomes zombie
(assert (forall ((p Person) (s Substance))
  (=> (exposed-to p s)
      (= (skin-color p) zombie))))

; Test scenario: Could nickel exposure cause zombie skin?
; Witness a person who was exposed to nickel and has zombie skin
(assert (exposed-to test-person nickel))
(assert (= (skin-color test-person) zombie))

; Check satisfiability and provide a model
(check-sat)
(get-model)