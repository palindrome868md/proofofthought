;-------------------------------------------------
; 1. Declare uninterpreted sorts
;-------------------------------------------------
(declare-sort Person 0)
(declare-sort Artwork 0)
(declare-sort License 0)

;-------------------------------------------------
; 2. Declare predicates / functions
;-------------------------------------------------
; Is the artwork in the public domain?
(declare-fun is-public-domain (Artwork) Bool)

; Is the licence a Creative Commons licence?
(declare-fun CC-license (License) Bool)

; Has a person been sold a given licence for a given artwork?
(declare-fun sold-license (Person Artwork License) Bool)

; Has the person been ripped off?
(declare-fun ripped-off (Person) Bool)

;-------------------------------------------------
; 3. Declare the concrete entities
;-------------------------------------------------
(declare-const botticelli-venus Artwork)
(declare-const john-doe Person)
(declare-const cc-lic License)

;-------------------------------------------------
; 4. Knowledge base (facts)
;-------------------------------------------------
; The Birth of Venus is public domain
(assert (is-public-domain botticelli-venus))

; The licence in question is a Creative Commons licence
(assert (CC-license cc-lic))

; John Doe was sold that licence for the artwork
(assert (sold-license john-doe botticelli-venus cc-lic))

;-------------------------------------------------
; 5. Rule: selling a CC licence for a public‑domain artwork is a rip‑off
;-------------------------------------------------
(assert (forall ((p Person) (a Artwork) (l License))
  (=> (and (sold-license p a l)
           (is-public-domain a)
           (CC-license l))
      (ripped-off p))))

;-------------------------------------------------
; 6. Test the question: "Was John Doe ripped off?"
;-------------------------------------------------
(assert (ripped-off john-doe))

;-------------------------------------------------
; 7. Ask Z3
;-------------------------------------------------
(check-sat)
(get-model)