; --- Declarations -------------------------------------------------
(declare-sort Vessel 0)
(declare-sort Structure 0)

(declare-fun is-ark (Vessel) Bool)
(declare-fun is-tunnel (Structure) Bool)
(declare-fun is-flooded (Structure) Bool)
(declare-fun is-waterway (Structure) Bool)
(declare-fun can-sail-through (Vessel Structure) Bool)

(declare-const ark Vessel)
(declare-const lincolnTunnel Structure)

; --- Knowledge Base -----------------------------------------------
; Noah's Ark is an ark
(assert (is-ark ark))

; Lincoln Tunnel is a tunnel and (hypothetically) flooded
(assert (is-tunnel lincolnTunnel))
(assert (is-flooded lincolnTunnel))

; Rule 1: a vessel can sail through a structure only if that structure is a waterway
(assert (forall ((v Vessel) (s Structure))
        (=> (can-sail-through v s)
            (is-waterway s))))

; Rule 2: tunnels are not waterway passages
(assert (forall ((s Structure))
        (=> (is-tunnel s)
            (not (is-waterway s)))))

; --- Test the claim -----------------------------------------------
; Claim: the Ark can sail through the (flooded) Lincoln Tunnel
(assert (can-sail-through ark lincolnTunnel))

; --- Decision ------------------------------------------------------
(check-sat)   ; Expected result: unsat (the claim is false)

(get-model)   ; Optional: shows a model for the satisfiable part (if any)