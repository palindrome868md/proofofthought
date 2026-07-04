; Question: Is there a full Neptunian orbit between the first two burials of women in the Panthéon?

; Declare sorts
(declare-sort Person 0)
(declare-sort CelestialBody 0)

; Declare functions
(declare-fun burial-year (Person) Int)
(declare-fun orbital-period (CelestialBody) Int)
(declare-fun is-woman (Person) Bool)
(declare-fun buried-in-pantheon (Person) Bool)
(declare-fun is-first-woman-burial (Person) Bool)
(declare-fun is-second-woman-burial (Person) Bool)

; Declare constants
(declare-const first-woman Person)
(declare-const second-woman Person)
(declare-const neptune CelestialBody)

; Knowledge base - First woman buried in Panthéon: Sophie Berthelot (1907)
(assert (is-woman first-woman))
(assert (buried-in-pantheon first-woman))
(assert (is-first-woman-burial first-woman))
(assert (= (burial-year first-woman) 1907))

; Knowledge base - Second woman buried in Panthéon: Marie Curie (1995)
(assert (is-woman second-woman))
(assert (buried-in-pantheon second-woman))
(assert (is-second-woman-burial second-woman))
(assert (= (burial-year second-woman) 1995))

; Knowledge base - Neptune's orbital period (approximately 165 years)
(assert (= (orbital-period neptune) 165))

; Knowledge base - Second burial must be after first
(assert (> (burial-year second-woman) (burial-year first-woman)))

; Test: Is there a full Neptunian orbit between the two burials?
; A full orbit exists if: time difference >= orbital period
(assert (>= (- (burial-year second-woman) (burial-year first-woman)) (orbital-period neptune)))

; Check satisfiability
; If unsat: NO full Neptunian orbit exists (88 years < 165 years)
; If sat: YES, a full Neptunian orbit exists
(check-sat)
(get-model)