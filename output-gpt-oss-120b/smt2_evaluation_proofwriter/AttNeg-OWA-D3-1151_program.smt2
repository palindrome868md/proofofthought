;--- 1. Declare the person sort ---------------------------------
(declare-sort Person 0)

;--- 2. Declare predicates ---------------------------------------
(declare-fun red   (Person) Bool)
(declare-fun nice  (Person) Bool)
(declare-fun blue  (Person) Bool)
(declare-fun young (Person) Bool)
(declare-fun green (Person) Bool)
(declare-fun white (Person) Bool)

;--- 3. Declare the individuals ----------------------------------
(declare-const anne   Person)
(declare-const bob    Person)
(declare-const charlie Person)

;--- 4. Facts ----------------------------------------------------
(assert (red anne))               ; Anne is red
(assert (not (nice bob)))         ; Bob is not nice
(assert (blue charlie))           ; Charlie is blue

;--- 5. Rules ----------------------------------------------------
; If someone is young then they are green.
(assert (forall ((p Person))
        (=> (young p) (green p))))

; If someone is young and green then they are not red.
(assert (forall ((p Person))
        (=> (and (young p) (green p)) (not (red p)))))

; Red people are white.
(assert (forall ((p Person))
        (=> (red p) (white p))))

; If Charlie is white then Charlie is blue.
(assert (=> (white charlie) (blue charlie)))

; All white people are not young.
(assert (forall ((p Person))
        (=> (white p) (not (young p)))))

; If someone is red and not young then they are nice.
(assert (forall ((p Person))
        (=> (and (red p) (not (young p))) (nice p))))

;--- 6. Query: Is Anne nice? ------------------------------------
(assert (nice anne))

;--- 7. Check satisfiability ------------------------------------
(check-sat)
(get-model)