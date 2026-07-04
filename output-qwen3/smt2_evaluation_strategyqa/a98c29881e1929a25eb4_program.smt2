; Question: Could a giant squid fit aboard the deck of the titanic?
; This is a possibility question - we test if the scenario is satisfiable

; 1. Declare sorts
(declare-sort Animal 0)
(declare-sort Ship 0)

; 2. Declare functions for measurements and properties
(declare-fun max-length (Animal) Int)        ; Maximum length in meters
(declare-fun deck-length (Ship) Int)         ; Deck length in meters
(declare-fun deck-width (Ship) Int)          ; Deck width in meters
(declare-fun is-giant-squid (Animal) Bool)   ; Is this animal a giant squid?
(declare-fun is-titanic (Ship) Bool)         ; Is this ship the Titanic?
(declare-fun fits-on-deck (Animal Ship) Bool) ; Can animal fit on ship's deck

; 3. Declare constants
(declare-const giant-squid Animal)
(declare-const titanic Ship)

; 4. Assert knowledge base facts

; Giant squid maximum size (scientific fact: up to 13-14 meters)
(assert (is-giant-squid giant-squid))
(assert (= (max-length giant-squid) 14))

; Titanic deck dimensions (historical fact: 269m long, 28m wide)
(assert (is-titanic titanic))
(assert (= (deck-length titanic) 269))
(assert (= (deck-width titanic) 28))

; Rule: An animal fits on a deck if its max length is <= deck length or deck width
(assert (forall ((a Animal) (s Ship))
  (=> (fits-on-deck a s)
      (or (<= (max-length a) (deck-length s))
          (<= (max-length a) (deck-width s))))))

; 5. Test: Could a giant squid fit on Titanic's deck?
; We assert that it DOES fit and check if this is satisfiable
(assert (fits-on-deck giant-squid titanic))

; 6. Check satisfiability
(check-sat)
(get-model)

; Expected result: sat (true)
; Reasoning: Giant squid max length (14m) < Titanic deck length (269m)
; Therefore it is possible for a giant squid to fit on the Titanic's deck