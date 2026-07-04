; -------------------------------------------------
; Question: Is there a full Neptunian orbit between
; the first two burials of women in the Panthéon?
; -------------------------------------------------

; 1. Declare integer constants for the two burial years
(declare-const year1 Int)   ; year of the first woman's burial
(declare-const year2 Int)   ; year of the second woman's burial

; 2. Declare the length of a Neptunian orbit in days
;    (approx. 165 years × 365 days/year = 60 225 days)
(declare-const neptune_orbit_days Int)

; 3. Encode the known historical data
(assert (= year1 1995))                ; Marie Curie interred 1995
(assert (= year2 2018))                ; Simone Veil interred 2018
(assert (= neptune_orbit_days 60225))  ; ≈ one Neptune orbit in days

; 4. Compute the day‑difference between the two burials
(define-fun diff_days () Int
  (* (- year2 year1) 365))   ; ignore leap years for simplicity

; 5. Test the claim: is the gap at least one Neptunian orbit?
(assert (>= diff_days neptune_orbit_days))

; 6. Ask Z3 to decide
(check-sat)   ; Expected result: unsat (i.e., the claim is false)
(get-model)