;--- 1. Declare an uninterpreted sort for all objects ---------------------------------
(declare-sort Entity 0)

;--- 2. Declare the constant representing Erin -----------------------------------------
(declare-const Erin Entity)

;--- 3. Declare unary predicates (as Boolean‑valued functions) -------------------------
(declare-fun red (Entity) Bool)
(declare-fun nice (Entity) Bool)
(declare-fun cold (Entity) Bool)
(declare-fun big (Entity) Bool)

;--- 4. Knowledge base ---------------------------------------------------------------

; Erin is red
(assert (red Erin))

; General rule: red ⇒ nice
(assert (forall ((x Entity))
        (=> (red x) (nice x))))

; Specific rule: Erin nice ⇒ Erin cold
(assert (=> (nice Erin) (cold Erin)))

; Specific rule: Erin cold ⇒ Erin big
(assert (=> (cold Erin) (big Erin)))

;--- 5. Query: Erin is NOT cold ------------------------------------------------------
(assert (not (cold Erin)))   ; this is the statement we are testing

;--- 6. Check satisfiability ---------------------------------------------------------
(check-sat)
(get-model)