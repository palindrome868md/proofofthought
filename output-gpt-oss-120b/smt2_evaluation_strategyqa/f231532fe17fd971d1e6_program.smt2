; -------------------------------------------------
; 1. Declare constants (monetary amounts in millions)
; -------------------------------------------------
(declare-const cost-737    Real)   ; cost of a Boeing 737 (in $M)
(declare-const receipt-WW Real)   ; Wonder Woman (2017) box‑office receipts (in $M)

; -------------------------------------------------
; 2. Knowledge base: factual numbers
; -------------------------------------------------
; Approximate list price of a Boeing 737‑800
(assert (= cost-737 100.0))

; Worldwide box‑office receipts for Wonder Woman (2017)
(assert (= receipt-WW 822.0))

; -------------------------------------------------
; 3. Claim to verify:
;    "The Boeing 737 cost is covered by Wonder Woman box‑office receipts"
;    i.e., receipts ≥ cost
; -------------------------------------------------
(assert (>= receipt-WW cost-737))

; -------------------------------------------------
; 4. Decision
; -------------------------------------------------
(check-sat)      ; Expected: sat  (the claim is true)
(get-model)      ; Show the concrete numbers used