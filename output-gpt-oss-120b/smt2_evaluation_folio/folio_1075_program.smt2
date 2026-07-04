;--- Sort declaration -------------------------------------------------
(declare-sort Lipstick 0)

;--- Predicate (function) declarations ---------------------------------
(declare-fun velvet (Lipstick) Bool)        ; velvet‑finish ?
(declare-fun satin  (Lipstick) Bool)        ; satin‑finish ?
(declare-fun refillable (Lipstick) Bool)    ; refillable ?
(declare-fun rosewood (Lipstick) Bool)      ; “rosewood” in description ?

;--- Constant for the specific product --------------------------------
(declare-const lb999 Lipstick)   ; ROUGE Dior Colored Lip Balm 999

;--- Knowledge base (premises) ----------------------------------------

; 1. All velvet‑finish lipsticks are refillable
(assert (forall ((l Lipstick))
  (=> (velvet l) (refillable l))))

; 2. Every lipstick has either a velvet‑finish or a satin‑finish
(assert (forall ((l Lipstick))
  (or (velvet l) (satin l))))

; 3. No satin‑finish lipstick lacks “rosewood” in its description
;    (i.e., satin ⇒ rosewood)
(assert (forall ((l Lipstick))
  (=> (satin l) (rosewood l))))

; 4. (Logical tautology) – every lipstick either lacks or has “rosewood”
;    This is always true, so we omit it (it does not affect satisfiability).

; 5. The specific lipstick either has “rosewood” or has a velvet finish
(assert (or (rosewood lb999) (velvet lb999)))

;--- Statement to verify ----------------------------------------------

; If it is refillable or has “rosewood”, then it is refillable or has “rosewood”.
(assert (=> (or (refillable lb999) (rosewood lb999))
            (or (refillable lb999) (rosewood lb999))))

;--- Check the model ---------------------------------------------------
(check-sat)   ; Expected result: sat (the statement is true under the premises)
(get-model)