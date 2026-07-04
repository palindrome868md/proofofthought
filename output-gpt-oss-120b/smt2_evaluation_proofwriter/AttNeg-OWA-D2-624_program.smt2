;--- Sorts ---------------------------------------------------------
(declare-sort Person 0)

;--- Predicates ----------------------------------------------------
(declare-fun big   (Person) Bool)
(declare-fun nice  (Person) Bool)
(declare-fun cold  (Person) Bool)
(declare-fun smart (Person) Bool)
(declare-fun furry (Person) Bool)   ; needed for the third rule
(declare-fun round (Person) Bool)

;--- Constants -----------------------------------------------------
(declare-const anne   Person)
(declare-const bob    Person)
(declare-const fiona  Person)
(declare-const gary   Person)

;--- Knowledge base -----------------------------------------------
; Facts
(assert (big anne))
(assert (nice anne))

(assert (big bob))
(assert (cold bob))
(assert (nice bob))

(assert (cold fiona))

(assert (not (cold gary)))   ; Gary is not cold

; Rules
; 1. nice ∧ cold → smart
(assert (forall ((p Person))
        (=> (and (nice p) (cold p))
            (smart p))))

; 2. nice ∧ big  → cold
(assert (forall ((p Person))
        (=> (and (nice p) (big p))
            (cold p))))

; 3. furry → round
(assert (forall ((p Person))
        (=> (furry p)
            (round p))))

;--- Query ---------------------------------------------------------
; "Anne is not cold"
(assert (not (cold anne)))

;--- Check ---------------------------------------------------------
(check-sat)
(get-model)