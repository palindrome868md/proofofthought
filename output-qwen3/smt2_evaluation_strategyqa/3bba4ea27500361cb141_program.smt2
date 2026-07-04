; Declare sorts
(declare-sort Vessel 0)
(declare-sort Tunnel 0)

; Declare functions
(declare-fun is-water-vessel (Vessel) Bool)
(declare-fun is-vehicular-tunnel (Tunnel) Bool)
(declare-fun can-traverse (Vessel Tunnel) Bool)

; Declare constants
(declare-const oasis Vessel)
(declare-const lincoln-tunnel Tunnel)

; Knowledge base
; Oasis is a cruise boat (water vessel)
(assert (is-water-vessel oasis))

; Lincoln Tunnel is a vehicular tunnel (not a waterway)
(assert (is-vehicular-tunnel lincoln-tunnel))

; Rule: Water vessels cannot traverse vehicular tunnels
; (Vehicular tunnels are for cars/trucks, not boats)
(assert (forall ((v Vessel) (t Tunnel))
  (=> (and (is-water-vessel v) (is-vehicular-tunnel t))
      (not (can-traverse v t)))))

; Test: Will Oasis cruise boat traverse the Lincoln Tunnel?
(assert (can-traverse oasis lincoln-tunnel))

; Check satisfiability
(check-sat)
; Expected: unsat (false - the Oasis cruise boat will NOT traverse the Lincoln Tunnel)
(get-model)