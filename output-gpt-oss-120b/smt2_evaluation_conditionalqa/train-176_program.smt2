; ------------------------------------------------------------
;  Declarations
; ------------------------------------------------------------
(declare-sort Person 0)          ; uninterpreted sort for people
(declare-sort City   0)          ; cities (London, etc.)
(declare-sort Child  0)          ; children

; Functions / predicates
(declare-fun age               (Person) Int)          ; age of a person
(declare-fun lives_in          (Person City) Bool)   ; residency
(declare-fun publicly_funded   (Person) Bool)        ; course funding type
(declare-fun sixth_form_course (Person) Bool)        ; course is at a sixth‑form college
(declare-fun main_carer        (Person) Bool)        ; is the main carer for the child
(declare-fun has_child         (Person) Bool)        ; has at least one child
(declare-fun child_age         (Child) Int)          ; age of a child
(declare-fun parent_of         (Person Child) Bool)  ; parent‑child relation
(declare-fun childcare_provider_qualifies (Person) Bool) ; provider eligibility
(declare-fun excluded_apprentice (Person) Bool)        ; apprentice with salary?
(declare-fun excluded_higher_ed (Person) Bool)        ; higher‑education student?

; Derived predicate: can the person claim under Care‑to‑Learn?
(declare-fun can_claim (Person) Bool)

; ------------------------------------------------------------
;  Constants for the concrete scenario
; ------------------------------------------------------------
(declare-const me   Person)   ; the asker
(declare-const london City)   ; London
(declare-const daughter Child) ; the 2‑year‑old child

; ------------------------------------------------------------
;  Knowledge base (facts from the scenario)
; ------------------------------------------------------------
; Age under 20 at start of course
(assert (= (age me) 19))

; Residency
(assert (lives_in me london))

; Course is publicly funded and is a sixth‑form college course
(assert (publicly_funded me))
(assert (sixth_form_course me))

; Main carer status and parenthood
(assert (main_carer me))
(assert (has_child me))
(assert (parent_of me daughter))

; Child’s age (approximately 2 years)
(assert (= (child_age daughter) 2))

; Childcare provider is qualified (assumed true)
(assert (childcare_provider_qualifies me))

; Not excluded by apprenticeship or higher‑education rules
(assert (not (excluded_apprentice me)))
(assert (not (excluded_higher_ed me)))

; ------------------------------------------------------------
;  Eligibility rule (captures the scheme’s conditions)
; ------------------------------------------------------------
(assert (forall ((p Person) (c Child))
  (=> (and (< (age p) 20)                     ; under 20 at start
           (lives_in p london)                ; lives in London (hence England)
           (publicly_funded p)                ; publicly‑funded course
           (sixth_form_course p)              ; sixth‑form college qualifies
           (main_carer p)                     ; main carer
           (has_child p)                      ; has a child
           (parent_of p c)                    ; parent of that child
           (>= (child_age c) 0)               ; child exists
           (childcare_provider_qualifies p)   ; provider qualified
           (not (excluded_apprentice p))      ; not an excluded apprentice
           (not (excluded_higher_ed p)))      ; not a university student
      (can_claim p))))

; ------------------------------------------------------------
;  Test the question: “Can I claim help … ?”
; ------------------------------------------------------------
(assert (can_claim me))

; ------------------------------------------------------------
;  Solve
; ------------------------------------------------------------
(check-sat)   ; Expected result: sat (the claim is possible)
(get-model)  ; Optional: shows a model that satisfies the constraints