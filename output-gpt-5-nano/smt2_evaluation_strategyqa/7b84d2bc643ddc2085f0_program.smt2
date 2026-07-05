; Declare sorts
(declare-sort Vessel 0)
(declare-sort Location 0)

; Declare constants
(declare-const lincoln-tunnel Location)
(declare-const noahs-ark Vessel)

; Predicates / functions
(declare-fun is-flooded (Location) Bool)
(declare-fun can-sail-through (Vessel Location) Bool)

; Knowledge base
(assert (is-flooded lincoln-tunnel))

; Rule: If a location is flooded, any vessel can sail through it
(assert (forall ((v Vessel) (l Location))
  (=> (is-flooded l)
      (can-sail-through v l))))

; Test: Negation of the hypothesis "Noah's Ark can sail through flooded Lincoln Tunnel"
(assert (not (can-sail-through noahs-ark lincoln-tunnel)))

; Check satisfiability
(check-sat)