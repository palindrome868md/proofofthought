;--- Sorts ----------------------------------------------------
(declare-sort Lipstick 0)

;--- Functions / Predicates ------------------------------------
(declare-fun inSet (Lipstick) Bool)          ; lipstick belongs to the Rouge Dior set
(declare-fun hasVelvet (Lipstick) Bool)      ; velvet‑finish ?
(declare-fun hasSatin (Lipstick) Bool)       ; satin‑finish ?
(declare-fun hasRosewood (Lipstick) Bool)    ; “rosewood” in official description ?
(declare-fun refillable (Lipstick) Bool)     ; refillable ?

;--- Constant -------------------------------------------------
(declare-const balm Lipstick)                ; ROUGE Dior Colored Lip Balm 999

;--- Knowledge base (premises) -------------------------------
; 1. All velvet‑finish lipsticks in the set are refillable
(assert (forall ((l Lipstick))
        (=> (and (inSet l) (hasVelvet l))
            (refillable l))))

; 2. Every lipstick in the set has either velvet or satin finish
(assert (forall ((l Lipstick))
        (=> (inSet l)
            (or (hasVelvet l) (hasSatin l)))))

; 3. No satin‑finish lipstick in the set lacks “rosewood”
;    (i.e., satin ⇒ rosewood)
(assert (forall ((l Lipstick))
        (=> (and (inSet l) (hasSatin l))
            (hasRosewood l))))

; 4. Tautology: each lipstick either has or does not have “rosewood”
;    (included for completeness, but adds no restriction)
(assert (forall ((l Lipstick))
        (or (hasRosewood l) (not (hasRosewood l)))))

; 5. The specific lipstick is in the set and satisfies
;    “rosewood or velvet”
(assert (inSet balm))
(assert (or (hasRosewood balm) (hasVelvet balm)))

;--- Statement to test -----------------------------------------
; Claim: balm has a satin finish *and* has “rosewood”
(assert (hasSatin balm))
(assert (hasRosewood balm))

;--- Check the consistency --------------------------------------
(check-sat)   ; expected: sat  (the claim can be true)
(get-model)