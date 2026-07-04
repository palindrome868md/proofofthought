;--- Declarations ----------------------------------------------------
(declare-sort Object 0)                ; generic objects
(declare-fun density (Object) Real)    ; density of an object (g/cm^3)
(declare-fun sinks (Object) Bool)     ; true iff the object sinks

(declare-const pear Object)            ; the specific object we care about
(declare-const water-density Real)    ; density of pure water

;--- Knowledge Base --------------------------------------------------
; Real‑world densities (approx.)
(assert (= (density pear) (/ 3 4)))    ; 0.75 g/cm³  (pear is less dense than water)
(assert (= water-density 1))           ; 1.00 g/cm³  (density of water)

; Buoyancy rule: an object sinks iff its density is greater than water's
(assert (forall ((o Object))
        (=> (> (density o) water-density) (sinks o))))

; If it is not denser, it does NOT sink
(assert (forall ((o Object))
        (=> (<= (density o) water-density) (not (sinks o)))))

;--- Question to Verify -----------------------------------------------
; Would a pear sink in water?
(assert (sinks pear))

;--- Solve ------------------------------------------------------------
(check-sat)          ; expected result: unsat (the claim is false)
(get-model)