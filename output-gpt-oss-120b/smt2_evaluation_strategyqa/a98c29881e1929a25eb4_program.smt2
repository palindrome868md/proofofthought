; -------------------------------------------------
; 1. Declare the uninterpreted sorts
; -------------------------------------------------
(declare-sort Animal 0)
(declare-sort Ship   0)

; -------------------------------------------------
; 2. Declare functions for dimensions (real‑valued)
; -------------------------------------------------
(declare-fun lengthOf (Animal) Real)   ; length of an animal (meters)
(declare-fun widthOf  (Animal) Real)   ; width of an animal (meters)

(declare-fun deckLength (Ship) Real)   ; deck length (meters)
(declare-fun deckWidth  (Ship) Real)   ; deck width  (meters)

; -------------------------------------------------
; 3. Declare the specific objects of interest
; -------------------------------------------------
(declare-const giantSquid Animal)
(declare-const titanic    Ship)

; -------------------------------------------------
; 4. Knowledge base: realistic size facts
; -------------------------------------------------
; Giant squid maximum reported size
(assert (= (lengthOf giantSquid) 18))   ; meters
(assert (= (widthOf  giantSquid)  2))   ; meters

; Titanic’s main deck dimensions
(assert (= (deckLength titanic) 269))   ; meters
(assert (= (deckWidth  titanic)  28))   ; meters

; -------------------------------------------------
; 5. Test the query: "Could the giant squid fit on the deck?"
;    (Both length and width must be less than or equal to the deck’s)
; -------------------------------------------------
(assert (and (<= (lengthOf giantSquid) (deckLength titanic))
             (<= (widthOf  giantSquid) (deckWidth  titanic))))

; -------------------------------------------------
; 6. Check satisfiability
; -------------------------------------------------
(check-sat)   ; sat  => the squid could fit
(get-model)