; -------------------------------------------------
;  Declarations
; -------------------------------------------------
(declare-sort Serfdom 0)                 ; Uninterpreted sort for serfdom systems
(declare-fun status (Serfdom) Int)       ; Social‑status rating (higher = higher status)

(declare-const japanese Serfdom)         ; Japanese serfdom
(declare-const english  Serfdom)         ; English serfdom

; -------------------------------------------------
;  Knowledge base
; -------------------------------------------------
; Historical assessment (modeled as integer levels)
;   – Japanese serfdom is assigned a higher status value
;   – English serfdom is assigned a lower status value
(assert (= (status japanese) 2))
(assert (= (status english)  1))

; -------------------------------------------------
;  Verification of the claim
; -------------------------------------------------
; Claim: “Japanese serfdom had higher status than the English counterpart.”
(assert (> (status japanese) (status english)))

; -------------------------------------------------
;  Solve
; -------------------------------------------------
(check-sat)      ; Expected result: sat  (the claim is true under the given model)
(get-model)      ; Show one concrete model confirming the claim