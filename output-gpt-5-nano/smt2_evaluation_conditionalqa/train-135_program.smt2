; Declare sorts
(declare-sort Person 0)

; Declare constants
(declare-const me Person)
(declare-const ex Person)
(declare-const child Person)
(declare-const main-care-parent Person)

; Declare predicates
(declare-fun live-abroad (Person) Bool)

; Decision variables for the CMS claim capability
(declare-const can-make-new-cms-application Bool)
(declare-const cannot-make-new-cms-application Bool)

; Metadata / scenario setup
(assert (= main-care-parent me))
; In the scenario, you and the child live abroad
(assert (live-abroad me))
(assert (live-abroad child))

; Knowledge base: cannot make a new CMS application if both child and main-care-parent live abroad
(assert (= cannot-make-new-cms-application (not can-make-new-cms-application)))
(assert (=> (and (live-abroad child) (live-abroad main-care-parent))
            (not can-make-new-cms-application)))

; Verification test: "Does the fact that I live abroad mean I can't claim Child Maintenance?"
; Test the claim that you cannot make a new CMS application
(assert cannot-make-new-cms-application)

; Check satisfiability and provide a model
(check-sat)
(get-model)