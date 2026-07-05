; Civil partnership dissolution reasoning: Can unreasonable behaviour be used as ground?

; Sorts
(declare-sort CivilPartner 0)

; Individuals involved in the scenario
(declare-const me CivilPartner)
(declare-const ex CivilPartner)

; Predicates / Functions
; years(me, ex) = number of years the partnership has lasted
(declare-fun years (CivilPartner CivilPartner) Int)

; Whether the partner has exhibited unreasonable behaviour
(declare-fun unreasonable-behaviour (CivilPartner) Bool)

; Whether dissolution is possible given the scenario
(declare-fun dissolution-possible (CivilPartner CivilPartner) Bool)

; Knowledge base (scoped facts)
; The partnership has lasted more than 1 year (over a year)
(assert (>= (years me ex) 2))

; The ex-partner has engaged in unreasonable behaviour
(assert (unreasonable-behaviour ex))

; Rule: If the ex-partner exhibits unreasonable behaviour and the partnership lasted >1 year,
; then dissolution is possible on that ground
(assert (=> (and (unreasonable-behaviour ex) (>= (years me ex) 2))
            (dissolution-possible me ex)))

; Test scenario: can dissolution be pursued based on unreasonable behaviour?
(assert (dissolution-possible me ex))

; Check satisfiability and provide a model
(check-sat)
(get-model)