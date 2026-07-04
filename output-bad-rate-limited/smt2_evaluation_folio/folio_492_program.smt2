; Sorts
(declare-sort Fish 0)
(declare-sort Person 0)

; Constants
(declare-const stonefish Fish)

; Predicates / relations
(declare-fun stings (Fish Person) Bool)
(declare-fun stepped-on (Person Fish) Bool)
(declare-fun not-treated (Person) Bool)
(declare-fun death (Person) Bool)

; Knowledge base
; Stonefish stings when stepped on
(assert (forall ((p Person)) (=> (stepped-on p stonefish) (stings stonefish p))))
; If a stonefish stings someone and they are not treated, death can occur
(assert (forall ((p Person)) (=> (and (stings stonefish p) (not-treated p)) (death p))))

; Test scenario to reflect "stings of some fish can cause death if not treated"
; Introduce a test person who steps on the stonefish
(declare-const test-person Person)
(assert (stepped-on test-person stonefish))
; Also assert that the stonefish stings this person (reinforce the scenario)
(assert (stings stonefish test-person))
; This person is not treated
(assert (not-treated test-person))
; Let death hold for this person due to the stings and no treatment
(assert (death test-person))

; Question: Is there a scenario where stings of some fish can cause death if not treated?
(check-sat)
(get-model)