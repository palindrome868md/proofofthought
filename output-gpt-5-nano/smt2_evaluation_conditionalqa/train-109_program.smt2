; Sorts
(declare-sort Person 0)

; Predicates / Functions
(declare-fun is-detained (Person) Bool)
(declare-fun section (Person) Int)
(declare-fun nearest-relative (Person Person) Bool)
(declare-fun can-apply-discharge (Person Person) Bool)

; Constants
(declare-const mother Person)
(declare-const you Person)

; Knowledge base
(assert (is-detained mother))
(assert (= (section mother) 3))  ; admitted for treatment (section 3)
(assert (nearest-relative you mother))  ; you are the nearest relative of the patient

; Rule: if you are the nearest relative and the patient is detained under section 3, you may apply for discharge
(assert (=> (and (nearest-relative you mother) (is-detained mother) (= (section mother) 3))
            (can-apply-discharge you mother)))

; Test: Can you apply for the discharge?
(assert (can-apply-discharge you mother))

; Check satisfiability
(check-sat)
(get-model)