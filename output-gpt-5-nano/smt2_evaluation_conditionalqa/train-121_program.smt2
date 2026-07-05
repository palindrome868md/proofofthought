; Question: Can I apply to change my father's will, or is this a matter for the deputy handling his financial affairs?

; Sorts
(declare-sort Person 0)

; Constants (participants)
(declare-const father Person)
(declare-const you Person)            ; you as the Personal Welfare deputy
(declare-const panel-deputy Person)   ; your father's Panel Deputy for finances

; Predicates (unknowns can be interpreted by the solver)
(declare-fun has-dementia (Person) Bool)
(declare-fun can-make-will (Person) Bool)                 ; capacity to make/change a will
(declare-fun is-personal-welfare-deputy (Person) Bool)    ; is this person the Personal Welfare deputy
(declare-fun is-financial-deputy (Person) Bool)           ; is this person the financial deputy
(declare-fun statutory-will-possible (Person) (Person) Bool) ; can applicant make statutory will for target

; Knowledge base (scenario)
(assert (has-dementia father))
(assert (not (can-make-will father)))

; Identify deputies
(assert (is-personal-welfare-deputy you))
(assert (is-financial-deputy panel-deputy))

; Test: Can the Personal Welfare deputy apply to change the will (statutory will) for the father?
; Based on the guideline: applying to Court of Protection for a statutory will is the route when the person cannot make a will themselves.
(assert (statutory-will-possible you father))

; And confirm the Panel Deputy would not be able to make a statutory will in this setup
; (This line encodes the distinction that the financial deputy does not automatically handle will changes.)
(assert (not (statutory-will-possible panel-deputy father)))

; Question is answered by the satisfiability of the above scenario
(check-sat)