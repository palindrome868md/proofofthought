;--- Sort declaration -------------------------------------------------
(declare-sort Person 0)

;--- Predicate (function) declarations --------------------------------
(declare-fun red   (Person) Bool)
(declare-fun young (Person) Bool)
(declare-fun smart (Person) Bool)
(declare-fun cold  (Person) Bool)
(declare-fun quiet (Person) Bool)

;--- Individual constants ---------------------------------------------
(declare-const anne   Person)
(declare-const charlie Person)

;--- Knowledge base ----------------------------------------------------
; Facts
(assert (red anne))          ; Anne is red.
(assert (young charlie))     ; Charlie is young.

; Rules
; 1. All red, young people are smart.
(assert (forall ((p Person))
        (=> (and (red p) (young p))
            (smart p))))

; 2. If someone is young then they are cold.
(assert (forall ((p Person))
        (=> (young p)
            (cold p))))

; 3. If Anne is red then Anne is cold.
(assert (=> (red anne) (cold anne)))

; 4. All red people are young.
(assert (forall ((p Person))
        (=> (red p)
            (young p))))

; 5. Young, cold people are quiet.
(assert (forall ((p Person))
        (=> (and (young p) (cold p))
            (quiet p))))

; 6. All cold, young people are red.
(assert (forall ((p Person))
        (=> (and (cold p) (young p))
            (red p))))

;--- Test the query ----------------------------------------------------
; Question: "Anne is red."
(assert (red anne))

;--- Solve -------------------------------------------------------------
(check-sat)
(get-model)