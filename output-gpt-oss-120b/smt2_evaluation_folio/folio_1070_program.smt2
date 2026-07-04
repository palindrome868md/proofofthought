; ---------- Declarations ----------
(declare-sort Lipstick 0)                ; sort of all lipsticks
(declare-fun Velvet (Lipstick) Bool)     ; has a velvet finish
(declare-fun Satin (Lipstick) Bool)      ; has a satin finish
(declare-fun Refillable (Lipstick) Bool) ; is refillable
(declare-fun Rosewood (Lipstick) Bool)   ; description contains "rosewood"

(declare-const rouge999 Lipstick)        ; ROUGE Dior Colored Lip Balm 999

; ---------- Premises ----------
; 1. All velvet‑finish lipsticks are refillable
(assert (forall ((x Lipstick))
        (=> (Velvet x) (Refillable x))))

; 2. Every lipstick has either a velvet or a satin finish
(assert (forall ((x Lipstick))
        (or (Velvet x) (Satin x))))

; 3. No satin‑finish lipstick lacks "rosewood"  →  all satin lipsticks have "rosewood"
(assert (forall ((x Lipstick))
        (=> (Satin x) (Rosewood x))))

; 4. (Logical excluded middle for Rosewood – optional but harmless)
(assert (forall ((x Lipstick))
        (or (not (Rosewood x)) (Rosewood x))))

; 5. rouge999 either has "rosewood" in its description or has a velvet finish
(assert (or (Rosewood rouge999) (Velvet rouge999)))

; ---------- Test the statement ----------
; Negation of:  (or (Refillable rouge999) (Rosewood rouge999))
(assert (and (not (Refillable rouge999)) (not (Rosewood rouge999))))

; ---------- Solve ----------
(check-sat)   ; expected: unsat (the statement must be true)
(get-model)