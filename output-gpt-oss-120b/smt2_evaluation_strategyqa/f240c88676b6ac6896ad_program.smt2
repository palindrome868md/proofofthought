; -------------------------------------------------
; 1. Declare sorts
; -------------------------------------------------
(declare-sort Boat 0)          ; Uninterpreted sort for all boats
(declare-sort Country 0)      ; Uninterpreted sort for countries

; -------------------------------------------------
; 2. Declare functions
; -------------------------------------------------
; is-traditional : Boat × Country → Bool
(declare-fun is-traditional (Boat Country) Bool)

; -------------------------------------------------
; 3. Declare constants (the relevant individuals)
; -------------------------------------------------
(declare-const kayak Boat)      ; the kayak
(declare-const canoe Boat)     ; the traditional Māori war‑canoe (waka)
(declare-const new-zealand Country)  ; New Zealand

; -------------------------------------------------
; 4. Knowledge base
; -------------------------------------------------
; In New Zealand the only boats regarded as *traditional* are canoes.
; (If a boat is traditional in New Zealand, it must be the canoe.)
(assert (forall ((b Boat))
  (=> (is-traditional b new-zealand)
      (= b canoe))))

; The kayak is a different vessel from the canoe.
(assert (distinct kayak canoe))

; -------------------------------------------------
; 5. Test the statement: “The kayak is a traditional boat in New Zealand.”
; -------------------------------------------------
(assert (is-traditional kayak new-zealand))

; -------------------------------------------------
; 6. Check satisfiability
; -------------------------------------------------
(check-sat)      ; Expected: unsat (the statement cannot be true)
(get-model)     ; Optional: show a model for the background, if any