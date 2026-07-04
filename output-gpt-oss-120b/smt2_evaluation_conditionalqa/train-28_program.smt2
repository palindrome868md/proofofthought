; ------------------------------------------------------------
;  Sort declarations
; ------------------------------------------------------------
(declare-sort Person 0)
(declare-sort Property 0)

; ------------------------------------------------------------
;  Function / predicate declarations
; ------------------------------------------------------------
; Person p is the deceased (has died)
(declare-fun is_deceased (Person) Bool)

; Person p owned property prop before death
(declare-fun owned_by (Person Property) Bool)

; Person p has obtained a grant of probate (legal authority)
(declare-fun has_grant_of_probate (Person) Bool)

; Property prop is being put on the market / sold
(declare-fun can_sell (Property) Bool)

; ------------------------------------------------------------
;  Constant declarations (the individuals in our scenario)
; ------------------------------------------------------------
(declare-const uncle Person)      ; the late uncle
(declare-const me Person)        ; the beneficiary (you)
(declare-const house Property)   ; the house that was left

; ------------------------------------------------------------
;  Knowledge base (facts taken from the description)
; ------------------------------------------------------------
; The uncle is dead
(assert (is_deceased uncle))

; The uncle owned the house (sole ownership)
(assert (owned_by uncle house))

; You have *not* yet obtained probate (the question is about needing it)
(assert (not (has_grant_of_probate me)))

; ------------------------------------------------------------
;  Legal rule (from the document)
; ------------------------------------------------------------
; You must not put a property on the market until you have the grant of probate.
; For any person p and property prop, if p is the deceased owner of prop
; and the claimant does not have probate, then the claimant cannot sell it.
(assert (forall ((p Person) (prop Property))
        (=> (and (owned_by p prop) (is_deceased p) (not (has_grant_of_probate me)))
            (not (can_sell prop)))))

; ------------------------------------------------------------
;  Test case: can I sell the house without probate?
; ------------------------------------------------------------
(assert (can_sell house))

; ------------------------------------------------------------
;  Verification
; ------------------------------------------------------------
; If the solver says UNSAT, the test is impossible → probate is required.
(check-sat)
(get-model)