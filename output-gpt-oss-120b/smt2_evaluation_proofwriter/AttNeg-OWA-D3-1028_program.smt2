; -------------------------------------------------
; 1. Sort declaration
; -------------------------------------------------
(declare-sort Entity 0)

; -------------------------------------------------
; 2. Predicate (function) declarations
; -------------------------------------------------
(declare-fun blue   (Entity) Bool)
(declare-fun quiet  (Entity) Bool)
(declare-fun cold   (Entity) Bool)
(declare-fun round  (Entity) Bool)
(declare-fun red    (Entity) Bool)
(declare-fun young  (Entity) Bool)
(declare-fun white  (Entity) Bool)

; -------------------------------------------------
; 3. Constant declarations (the individuals)
; -------------------------------------------------
(declare-const Bob   Entity)
(declare-const Erin  Entity)
(declare-const Fiona Entity)
(declare-const Harry Entity)

; -------------------------------------------------
; 4. Knowledge base (facts)
; -------------------------------------------------
(assert (blue Bob))          ; Bob is blue
(assert (quiet Erin))        ; Erin is quiet
(assert (cold Fiona))        ; Fiona is cold
(assert (cold Harry))        ; Harry is cold

; -------------------------------------------------
; 5. Knowledge base (rules)
; -------------------------------------------------
; All quiet things are blue.
(assert (forall ((x Entity))
          (=> (quiet x) (blue x))))

; If Harry is blue then Harry is not young.
(assert (=> (blue Harry) (not (young Harry))))

; Blue things are young.
(assert (forall ((x Entity))
          (=> (blue x) (young x))))

; Blue, round things are cold.
(assert (forall ((x Entity))
          (=> (and (blue x) (round x)) (cold x))))

; If something is blue and not red then it is round.
(assert (forall ((x Entity))
          (=> (and (blue x) (not (red x))) (round x))))

; If something is young then it is white.
(assert (forall ((x Entity))
          (=> (young x) (white x))))

; If Erin is red and Erin is not round then Erin is young.
(assert (=> (and (red Erin) (not (round Erin))) (young Erin)))

; If Erin is red and Erin is not cold then Erin is white.
(assert (=> (and (red Erin) (not (cold Erin))) (white Erin)))

; -------------------------------------------------
; 6. Query: "Erin is not blue"
; -------------------------------------------------
(assert (not (blue Erin)))   ; test the negation of the claim

; -------------------------------------------------
; 7. Check satisfiability (the answer)
; -------------------------------------------------
(check-sat)      ; Expected: unsat (the query is false)
(get-model)     ; optional: show a model if it were sat