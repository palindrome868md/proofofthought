;--- Sort declaration ---------------------------------------------------------
(declare-sort Entity 0)

;--- Predicate/function declarations -----------------------------------------
(declare-fun smart (Entity) Bool)
(declare-fun cold (Entity) Bool)
(declare-fun young (Entity) Bool)
(declare-fun rough (Entity) Bool)
(declare-fun furry (Entity) Bool)
(declare-fun white (Entity) Bool)
(declare-fun kind (Entity) Bool)

;--- Constant symbols ---------------------------------------------------------
(declare-const bob Entity)
(declare-const erin Entity)

;--- Knowledge base -----------------------------------------------------------
; Facts
(assert (smart bob))          ; Bob is smart
(assert (cold erin))          ; Erin is cold
(assert (young erin))         ; Erin is young

; Rules
; 4. If Bob is white and Bob is cold then Bob is kind.
(assert (forall ((x Entity))
        (=> (and (white bob) (cold bob)) (kind bob))))

; 5. Furry things are cold.
(assert (forall ((x Entity))
        (=> (furry x) (cold x))))

; 6. All furry things are white.
(assert (forall ((x Entity))
        (=> (furry x) (white x))))

; 7. All cold, smart things are rough.
(assert (forall ((x Entity))
        (=> (and (cold x) (smart x)) (rough x))))

; 8. Young things are smart.
(assert (forall ((x Entity))
        (=> (young x) (smart x))))

; 9. If Bob is white then Bob is young.
(assert (forall ((x Entity))
        (=> (white bob) (young bob))))

;--- Query: Erin is not rough -------------------------------------------------
(assert (not (rough erin)))   ; want to test the negation

;--- Check the query ---------------------------------------------------------
(check-sat)
(get-model)