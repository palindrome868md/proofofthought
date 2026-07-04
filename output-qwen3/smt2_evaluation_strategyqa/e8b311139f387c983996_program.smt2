; Declare sorts
(declare-sort Location 0)
(declare-sort Animal 0)
(declare-sort Person 0)

; Declare functions
(declare-fun native-region (Animal) Location)
(declare-fun located-in (Location Location) Bool)
(declare-fun can-photograph (Person Animal Location) Bool)

; Declare constants
(declare-const saltwater-crocodile Animal)
(declare-const memphis Location)
(declare-const tennessee Location)
(declare-const australia Location)
(declare-const southeast-asia Location)
(declare-const me Person)

; Knowledge base
; Saltwater crocodiles are native to Australia and Southeast Asia
(assert (= (native-region saltwater-crocodile) australia))

; Memphis is in Tennessee, USA
(assert (located-in memphis tennessee))

; Tennessee is not in Australia or Southeast Asia (saltwater crocodile habitat)
(assert (not (located-in tennessee australia)))
(assert (not (located-in tennessee southeast-asia)))

; You can only photograph an animal in a location if that location is in 
; the animal's native region (excluding zoos/captivity for this reasoning)
(assert (forall ((p Person) (a Animal) (l Location))
  (=> (can-photograph p a l)
      (or (= l (native-region a))
          (located-in l (native-region a))))))

; Test: Can I photograph a saltwater crocodile in Memphis?
(assert (can-photograph me saltwater-crocodile memphis))

; Check satisfiability
(check-sat)
; Expected: unsat (cannot photograph saltwater crocodile in Memphis - not in native habitat)
(get-model)