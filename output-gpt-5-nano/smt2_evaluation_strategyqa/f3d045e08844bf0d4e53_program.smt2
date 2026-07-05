; Declare sorts
(declare-sort Person 0)
(declare-sort Artwork 0)
(declare-sort License 0)

; Declare constants
(declare-const birth-of-venus Artwork)
(declare-const cc-license License)
(declare-const witness Person)

; Declare functions
(declare-fun license-of (Artwork) License)
(declare-fun sold-cc-license (Person Artwork License) Bool)
(declare-fun ripped-off (Person Artwork) Bool)

; Knowledge base
; The Birth of Venus does not have a Creative Commons license (KB assumption)
(assert (not (= (license-of birth-of-venus) cc-license)))

; If someone is sold a CC license for an artwork, then that license must equal the artwork's license
(assert (forall ((a Artwork) (p Person) (L License))
  (=> (sold-cc-license p a L)
      (= L (license-of a)))))

; Test scenario: Was there a person who was sold a CC license for Birth-of-Venus and ripped off?
(assert (sold-cc-license witness birth-of-venus cc-license))
(assert (ripped-off witness birth-of-venus))

; Check satisfiability (answers the question)
(check-sat)