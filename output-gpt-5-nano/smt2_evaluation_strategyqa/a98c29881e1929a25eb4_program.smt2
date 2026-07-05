; Sorts
(declare-sort Creature 0)
(declare-sort Deck 0)

; Constants
(declare-const giant-squid Creature)
(declare-const titanic-deck Deck)

; Dimensions as functions of objects
(declare-fun squid-length (Creature) Int)
(declare-fun squid-width  (Creature) Int)
(declare-fun deck-length  (Deck) Int)
(declare-fun deck-width   (Deck) Int)

; Predicate: does the creature fit on the given deck
(declare-fun fits-on-deck (Creature Deck) Bool)

; Knowledge base: dimensions
(assert (= (squid-length giant-squid) 12))  ; giant squid length ~12 m
(assert (= (squid-width  giant-squid) 2))   ; giant squid width ~2 m

(assert (= (deck-length titanic-deck) 269))  ; approximate Titanic deck length in meters
(assert (= (deck-width  titanic-deck) 28))   ; approximate Titanic deck width in meters

; Rule: if squid's dimensions fit within the deck's dimensions, then it fits on deck
(assert (=> (and (<= (squid-length giant-squid) (deck-length titanic-deck))
                 (<= (squid-width giant-squid) (deck-width titanic-deck)))
            (fits-on-deck giant-squid titanic-deck)))

; Test scenario: Would a giant squid fit aboard the Titanic's deck?
(assert (fits-on-deck giant-squid titanic-deck))

; Verification
(check-sat)
(get-model)