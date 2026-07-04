;--- Sorts ---------------------------------------------------------
(declare-sort Person 0)

;--- Predicates ----------------------------------------------------
(declare-fun white (Person) Bool)
(declare-fun smart (Person) Bool)
(declare-fun cold  (Person) Bool)
(declare-fun young (Person) Bool)
(declare-fun quiet (Person) Bool)
(declare-fun rough (Person) Bool)
(declare-fun nice  (Person) Bool)

;--- Individuals ---------------------------------------------------
(declare-const bob     Person)
(declare-const charlie Person)
(declare-const fiona   Person)
(declare-const harry   Person)

;--- Facts ---------------------------------------------------------
(assert (white bob))           ; Bob is white
(assert (smart charlie))       ; Charlie is smart
(assert (cold  fiona))         ; Fiona is cold
(assert (smart harry))         ; Harry is smart

;--- Rules ---------------------------------------------------------
; If someone is smart then they are young.
(assert (forall ((p Person)) (=> (smart p) (young p))))

; All white, rough people are quiet.
(assert (forall ((p Person)) (=> (and (white p) (rough p)) (quiet p))))

; All smart people are quiet.
(assert (forall ((p Person)) (=> (smart p) (quiet p))))

; If someone is smart and white then they are young.
(assert (forall ((p Person)) (=> (and (smart p) (white p)) (young p))))

; All young people are quiet.
(assert (forall ((p Person)) (=> (young p) (quiet p))))

; All cold, quiet people are nice.
(assert (forall ((p Person)) (=> (and (cold p) (quiet p)) (nice p))))

; Cold people are smart.
(assert (forall ((p Person)) (=> (cold p) (smart p))))

; All white people are young.
(assert (forall ((p Person)) (=> (white p) (young p))))

;--- Query ---------------------------------------------------------
; Test: Is Fiona quiet?
(assert (quiet fiona))

;--- Check ---------------------------------------------------------
(check-sat)   ; expected: sat (the statement is true)
(get-model)