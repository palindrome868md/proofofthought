; Declare sorts
(declare-sort Boat 0)
(declare-sort Region 0)

; Declare functions
(declare-fun is-traditional-in (Boat Region) Bool)
(declare-fun originates-from (Boat Region) Bool)

; Declare constants
(declare-const kayak Boat)
(declare-const waka Boat)
(declare-const new-zealand Region)
(declare-const arctic Region)

; Knowledge base
; Kayak originates from Arctic regions (Inuit peoples)
(assert (originates-from kayak arctic))

; Waka is the traditional boat of New Zealand (Māori)
(assert (is-traditional-in waka new-zealand))

; Rule: A boat is traditional in a region only if it originates from that region
(assert (forall ((b Boat) (r1 Region) (r2 Region))
  (=> (is-traditional-in b r2)
      (originates-from b r2))))

; Arctic and New Zealand are different regions
(assert (not (= arctic new-zealand)))

; Test: Is kayak traditional in New Zealand?
(assert (is-traditional-in kayak new-zealand))

; Check satisfiability
(check-sat)
(get-model)