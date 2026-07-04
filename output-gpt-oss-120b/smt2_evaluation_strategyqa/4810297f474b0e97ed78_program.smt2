; -------------------------------------------------
; 1. Declare the uninterpreted sorts
; -------------------------------------------------
(declare-sort Person 0)
(declare-sort Substance 0)

; -------------------------------------------------
; 2. Declare the predicate that captures crushing ability
; -------------------------------------------------
(declare-fun can-crush (Person Substance) Bool)

; -------------------------------------------------
; 3. Declare the concrete constants we need
; -------------------------------------------------
(declare-const child6 Person)          ; a six‑year‑old
(declare-const seawater Substance)    ; the substance

; -------------------------------------------------
; 4. Declare Real‑valued parameters
; -------------------------------------------------
(declare-const density-seawater Real)      ; kg/m³
(declare-const volume-ten-gallons Real)   ; m³
(declare-const mass-seawater Real)        ; kg
(declare-const weight-seawater Real)      ; N
(declare-const crush-threshold Real)      ; N (force needed to crush)

; -------------------------------------------------
; 5. Encode the known numerical facts
; -------------------------------------------------
; density of seawater ≈ 1025 kg/m³
(assert (= density-seawater 1025.0))

; 10 US gallons in cubic metres
; 1 gallon = 0.00378541 m³  ⇒ 10 gallons = 0.0378541 m³
(assert (= volume-ten-gallons 0.0378541))

; mass = density × volume
(assert (= mass-seawater (* density-seawater volume-ten-gallons)))

; weight = mass × g (g ≈ 9.81 m/s²)
(assert (= weight-seawater (* mass-seawater 9.81)))

; crushing requires > 500 N
(assert (= crush-threshold 500.0))

; -------------------------------------------------
; 6. Define “can‑crush” as equivalent to “weight > threshold”
; -------------------------------------------------
(assert (= (can-crush child6 seawater)
           (> weight-seawater crush-threshold)))

; -------------------------------------------------
; 7. Test the question: Could ten gallons of seawater crush a six‑year‑old?
; -------------------------------------------------
; We ask Z3 whether the predicate can‑crush can be true.
(assert (can-crush child6 seawater))

; -------------------------------------------------
; 8. Decision request
; -------------------------------------------------
(check-sat)   ; expected result: unsat (i.e., it cannot crush)
(get-model)  ; optional: shows the computed numeric values