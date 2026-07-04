; -------------------------------------------------
;  Sort declarations
; -------------------------------------------------
(declare-sort Person 0)
(declare-sort Property 0)

; -------------------------------------------------
;  Function / predicate declarations
; -------------------------------------------------
(declare-fun disabled (Person) Bool)          ; person is disabled
(declare-fun owns (Person Property) Bool)     ; person owns the property
(declare-fun intends_live (Person Property) Bool) ; intends to live there
(declare-fun eligible (Person) Bool)          ; can apply for the grant

; -------------------------------------------------
;  Constants for the scenario
; -------------------------------------------------
(declare-const aunt Person)
(declare-const home Property)

; -------------------------------------------------
;  Knowledge base (facts from the scenario)
; -------------------------------------------------
(assert (disabled aunt))          ; aunt is disabled
(assert (owns aunt home))         ; aunt owns the house
(assert (intends_live aunt home)) ; aunt intends to live there

; -------------------------------------------------
;  Eligibility rule (from the document)
; -------------------------------------------------
; If a person is disabled, owns (or rents) the property,
; and intends to live there, then they are eligible for the grant.
(assert
  (forall ((p Person) (prop Property))
    (=> (and (disabled p)
             (owns p prop)
             (intends_live p prop))
        (eligible p))))

; -------------------------------------------------
;  Query: is the aunt eligible?
; -------------------------------------------------
(assert (eligible aunt))

; -------------------------------------------------
;  Check the consistency of the whole model
; -------------------------------------------------
(check-sat)   ; Expected: sat  (she is allowed to seek support)
(get-model)