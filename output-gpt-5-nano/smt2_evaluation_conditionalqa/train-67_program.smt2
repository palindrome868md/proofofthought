; Question: Can I make a claim for a declaration of presumed death given the missing person went missing abroad?

; Sorts
(declare-sort Person 0)

; Constants
(declare-const claimant Person)
(declare-const missing Person)

; Predicates / relations
(declare-fun civil-partner (Person Person) Bool)
(declare-fun years-missing (Person) Int)
(declare-fun lives-england-wales-last-year (Person) Bool)
(declare-fun domiciled-england-wales (Person) Bool)

; Claimability predicate
(declare-fun claimable (Person) Bool)

; Knowledge base (facts)
(assert (civil-partner claimant missing))                 ; claimant is missing person's civil partner
(assert (>= (years-missing missing) 7))                   ; missing for 7+ years

; Eligibility condition: one of the two criteria must hold
(assert (or (lives-england-wales-last-year claimant)
            (domiciled-england-wales claimant)))

; Rule: if the eligibility criteria hold, then the claim is claimable
(assert (=> (and (civil-partner claimant missing)
                 (>= (years-missing missing) 7)
                 (or (lives-england-wales-last-year claimant)
                     (domiciled-england-wales claimant)))
            (claimable claimant)))

; Test scenario: assert that it is claimable for the claimant
(assert (claimable claimant))

; Verify
(check-sat)
(get-model)