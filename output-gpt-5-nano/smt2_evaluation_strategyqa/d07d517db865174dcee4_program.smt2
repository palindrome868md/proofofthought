; Define soup types as an enumerated datatype
(declare-datatypes () ((SoupType (clear) (broth) (cream) (puree) (chowder) (chunky))))

; Predicate: whether a given soup type is allowed on a liquid diet
(declare-fun allowed_on_liquid_diet (SoupType) Bool)

; Scenario: we are on a liquid diet
(declare-const on_liquid_diet Bool)
(assert on_liquid_diet)

; There exists some soup type that cannot be eaten on a liquid diet
(declare-const some_soup SoupType)
(assert (not (allowed_on_liquid_diet some_soup)))

; Explicit disallowed types (for realism)
(assert (not (allowed_on_liquid_diet chowder)))
(assert (not (allowed_on_liquid_diet chunky)))

; Some soups that are allowed on a liquid diet
(assert (allowed_on_liquid_diet clear))
(assert (allowed_on_liquid_diet broth))
(assert (allowed_on_liquid_diet puree))
(assert (allowed_on_liquid_diet cream))

; Test: Would there exist a soup you cannot eat on a liquid diet?
(check-sat)
(get-model)