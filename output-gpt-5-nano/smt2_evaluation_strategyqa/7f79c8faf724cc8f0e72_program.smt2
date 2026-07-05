; Sorts
(declare-sort Person 0)

; Constants
(declare-const wadlow Person)
(declare-const frankenstein Person)

; Functions
(declare-fun height (Person) Int)
(declare-fun can-see-bald-spot-from-above (Person Person) Bool)
(declare-fun has-bald-spot (Person) Bool)

; Knowledge base
(assert (= (height wadlow) 272))
(assert (= (height frankenstein) 244))
(assert (has-bald-spot frankenstein))

; Rule: If Wadlow is taller than Frankenstein, he can see Frankenstein's bald spot from above
(assert (=> (> (height wadlow) (height frankenstein))
            (can-see-bald-spot-from-above wadlow frankenstein)))

; Test scenario: Could Wadlow see Frankenstein's bald spot from above?
(assert (can-see-bald-spot-from-above wadlow frankenstein))

; Verification
(check-sat)
(get-model)