;-----------------------------------------------------------------
; Sorts
;-----------------------------------------------------------------
(declare-sort Person 0)

;-----------------------------------------------------------------
; Functions / Predicates
;-----------------------------------------------------------------
; Patient is detained under the Mental Health Act
(declare-fun detained (Person) Bool)

; Relation: a is the nearest relative of b
(declare-fun nearest-relative (Person Person) Bool)

; Permission: a can apply to the tribunal for discharge of b
(declare-fun can-apply (Person Person) Bool)

;-----------------------------------------------------------------
; Rules (derived from the guidance)
;-----------------------------------------------------------------
; If a person a is the nearest relative of a detained patient b,
; then a is allowed to apply for b’s discharge.
(assert
  (forall ((a Person) (b Person))
    (=> (and (nearest-relative a b) (detained b))
        (can-apply a b))))

;-----------------------------------------------------------------
; Concrete scenario
;-----------------------------------------------------------------
; Constants for the individuals involved
(declare-const me Person)       ; the applicant (you)
(declare-const mother Person)   ; your mother, the patient

; Facts from the question
(assert (detained mother))                ; mother is detained in a hospital
(assert (nearest-relative me mother))     ; you are her nearest relative

;-----------------------------------------------------------------
; Test the specific claim: "Can I apply for her discharge as her nearest relative?"
;-----------------------------------------------------------------
(assert (can-apply me mother))

;-----------------------------------------------------------------
; Query
;-----------------------------------------------------------------
(check-sat)   ; Expected: sat  (the claim is true)
(get-model)