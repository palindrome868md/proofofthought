; Declare an uninterpreted sort for all objects
(declare-sort Entity 0)

; Predicates (unary functions returning Bool)
(declare-fun red   (Entity) Bool)
(declare-fun young (Entity) Bool)
(declare-fun kind  (Entity) Bool)
(declare-fun cold  (Entity) Bool)
(declare-fun white (Entity) Bool)
(declare-fun quiet (Entity) Bool)
(declare-fun nice  (Entity) Bool)

; Individual constants
(declare-const anne   Entity)
(declare-const charlie Entity)
(declare-const erin   Entity)
(declare-const harry  Entity)

; -------------------------
; Knowledge base (facts)
; -------------------------
(assert (red anne))                     ; Anne is red.
(assert (young charlie))                ; Charlie is young.
(assert (not (young erin)))             ; Erin is not young.  (the statement we want to verify)
(assert (white harry))                  ; Harry is white.

; -------------------------
; General rules (implications)
; -------------------------

; If something is kind then it is young.
(assert (forall ((x Entity))
        (=> (kind x) (young x))))

; All cold things are young.
(assert (forall ((x Entity))
        (=> (cold x) (young x))))

; Red things are not young.
(assert (forall ((x Entity))
        (=> (red x) (not (young x)))))

; If Harry is kind and Harry is nice then Harry is red.
(assert (=> (and (kind harry) (nice harry))
            (red harry)))

; All white things are quiet.
(assert (forall ((x Entity))
        (=> (white x) (quiet x))))

; Quiet things are red.
(assert (forall ((x Entity))
        (=> (quiet x) (red x))))

; -------------------------
; Test the statement: "Erin is not young."
; -------------------------
; (already asserted above, but we repeat for clarity)
(assert (not (young erin)))

; -------------------------
; Check satisfiability: sat  -> the statement is consistent with the KB (i.e., true)
; -------------------------
(check-sat)
(get-model)