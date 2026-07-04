;-------------------------------------------------
;  Declarations
;-------------------------------------------------
(declare-sort Person 0)                ; uninterpreted sort for people
(declare-fun missing_years (Person) Int)         ; years missing
(declare-fun missing_due_to_natural_disaster (Person) Bool) ; true if disappeared in a disaster
(declare-fun sibling (Person Person) Bool)       ; sibling relationship
(declare-fun can_declare_presumed_death (Person) Bool) ; ability to obtain a declaration

;-------------------------------------------------
;  Constants (the relevant individuals)
;-------------------------------------------------
(declare-const me Person)          ; the claimant (the sibling)
(declare-const brother Person)     ; the missing brother

;-------------------------------------------------
;  Knowledge base (facts from the scenario)
;-------------------------------------------------
; Brother has been missing for 2 years
(assert (= (missing_years brother) 2))

; He disappeared in an earthquake → natural disaster
(assert (missing_due_to_natural_disaster brother))

; The claimant is the brother’s sibling
(assert (sibling me brother))
(assert (sibling brother me))   ; sibling relation is symmetric for our purposes

;-------------------------------------------------
;  Legal rule (when a declaration can be obtained)
;-------------------------------------------------
; A person P can be declared presumed dead if:
;   (missing_years(P) >= 7)  OR
;   (missing_years(P) < 7  AND  missing_due_to_natural_disaster(P))
; The rule does not depend on who makes the claim; eligibility of the claimant
; is handled separately (here we already know the claimant is a sibling).
(assert (forall ((p Person))
  (=> (or (>= (missing_years p) 7)
          (and (< (missing_years p) 7)
               (missing_due_to_natural_disaster p)))
      (can_declare_presumed_death p))))

;-------------------------------------------------
;  Test the question:
;  "Is it possible for me to declare my brother dead ..."
;-------------------------------------------------
; We ask whether the brother satisfies the condition
(assert (can_declare_presumed_death brother))

;-------------------------------------------------
;  Check satisfiability
;-------------------------------------------------
(check-sat)      ; Expected: sat (the declaration is possible)
(get-model)      ; Optional: shows a model that satisfies the constraints