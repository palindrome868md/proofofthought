; Sorts and predicates
(declare-sort Lip 0)

(declare-fun velvet (Lip) Bool)
(declare-fun satin (Lip) Bool)
(declare-fun rosewood (Lip) Bool)
(declare-fun refillable (Lip) Bool)
(declare-fun in-lyne (Lip) Bool)

; Constants
(declare-const rouge-dior-lip-balm-999 Lip)

; Knowledge base (premises)
; 1. All velvet-finish lipsticks in the Rouge Dior set (LYNE) are refillable.
(assert (forall ((l Lip)) (=> (and (velvet l) (in-lyne l)) (refillable l))))

; 2. LYNE lipsticks have either velvet-finish or satin-finish.
(assert (forall ((l Lip)) (=> (in-lyne l) (or (velvet l) (satin l)))))

; 3. No satin-finish lipsticks in the set do not have "rosewood" in its official description.
; i.e., satin -> rosewood
(assert (forall ((l Lip)) (=> (and (satin l) (in-lyne l)) (rosewood l))))

; 4. A tautology: for LYNE lipsticks, either not rosewood or rosewood.
(assert (forall ((l Lip)) (or (not (rosewood l)) (rosewood l))))

; 5. ROUGE Dior Colored Lip Balm 999 is in LYNE and it has either rosewood or velvet finish.
(assert (in-lyne rouge-dior-lip-balm-999))
(assert (or (rosewood rouge-dior-lip-balm-999) (velvet rouge-dior-lip-balm-999)))

; Test question:
; P = (refillable(ROUGE-dior-lip-balm-999) OR rosewood(ROUGE-dior-lip-balm-999))
; Q = (refillable(ROUGE-dior-lip-balm-999) OR rosewood(ROUGE-dior-lip-balm-999))
; Check (NOT (P -> Q)) to determine if the statement must be true.
(assert (not (=> (or (refillable rouge-dior-lip-balm-999)
                   (rosewood rouge-dior-lip-balm-999))
                 (or (refillable rouge-dior-lip-balm-999)
                   (rosewood rouge-dior-lip-balm-999)))))

; Check satisfiability and get a model (if any)
(check-sat)
(get-model)