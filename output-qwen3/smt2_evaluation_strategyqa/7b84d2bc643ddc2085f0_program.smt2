; Question: Will Noah's Ark hypothetically sail through flooded Lincoln Tunnel?
; This tests whether the Ark's dimensions can fit within the Tunnel's dimensions

; Declare sorts
(declare-sort Vessel 0)
(declare-sort Tunnel 0)

; Declare functions for dimensions (in feet)
(declare-fun vessel-length (Vessel) Int)
(declare-fun vessel-width (Vessel) Int)
(declare-fun vessel-height (Vessel) Int)
(declare-fun tunnel-length (Tunnel) Int)
(declare-fun tunnel-width (Tunnel) Int)
(declare-fun tunnel-height (Tunnel) Int)

; Declare constants
(declare-const noahs-ark Vessel)
(declare-const lincoln-tunnel Tunnel)

; Knowledge base: Noah's Ark dimensions (from Genesis 6:15)
; 300 cubits long, 50 cubits wide, 30 cubits high
; Using approximate conversion: 1 cubit ≈ 1.5 feet
; Length: 300 × 1.5 = 450 feet
; Width: 50 × 1.5 = 75 feet
; Height: 30 × 1.5 = 45 feet
(assert (= (vessel-length noahs-ark) 450))
(assert (= (vessel-width noahs-ark) 75))
(assert (= (vessel-height noahs-ark) 45))

; Knowledge base: Lincoln Tunnel dimensions (actual measurements)
; Each tube: approximately 28 feet wide, 13 feet high clearance
; Length: approximately 1.5 miles = 7920 feet
(assert (= (tunnel-length lincoln-tunnel) 7920))
(assert (= (tunnel-width lincoln-tunnel) 28))
(assert (= (tunnel-height lincoln-tunnel) 13))

; Rule: For a vessel to sail through a tunnel, all dimensions must fit
(declare-fun can-sail-through (Vessel Tunnel) Bool)
(assert (forall ((v Vessel) (t Tunnel))
  (=> (can-sail-through v t)
      (and 
        (<= (vessel-length v) (tunnel-length t))
        (<= (vessel-width v) (tunnel-width t))
        (<= (vessel-height v) (tunnel-height t))))))

; Test: Assert that Noah's Ark CAN sail through Lincoln Tunnel
; If this is UNSAT, then the answer is NO (it cannot fit)
(assert (can-sail-through noahs-ark lincoln-tunnel))

; Check satisfiability
(check-sat)
; Expected: unsat (the ark's width 75ft > tunnel width 28ft, height 45ft > tunnel height 13ft)
(get-model)