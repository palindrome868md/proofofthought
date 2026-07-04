;--- Sorts -------------------------------------------------
(declare-sort Person 0)

;--- Predicates (properties) --------------------------------
(declare-fun big   (Person) Bool)
(declare-fun blue  (Person) Bool)
(declare-fun green (Person) Bool)
(declare-fun red   (Person) Bool)
(declare-fun rough (Person) Bool)
(declare-fun round (Person) Bool)
(declare-fun white (Person) Bool)

;--- Individuals --------------------------------------------
(declare-const bob   Person)
(declare-const gary  Person)

;--- Facts --------------------------------------------------
; Bob
(assert (not (big bob)))          ; Bob is not big
(assert (blue bob))
(assert (green bob))
(assert (red bob))
(assert (rough bob))
(assert (round bob))
(assert (not (white bob)))        ; Bob is not white

; Gary
(assert (big gary))
(assert (green gary))
(assert (rough gary))
(assert (round gary))
(assert (white gary))

;--- General Rules -----------------------------------------
; Red & rough -> round
(assert (forall ((p Person))
        (=> (and (red p) (rough p)) (round p))))

; Green -> round
(assert (forall ((p Person))
        (=> (green p) (round p))))

; Red & white -> round
(assert (forall ((p Person))
        (=> (and (red p) (white p)) (round p))))

; Blue & round -> red
(assert (forall ((p Person))
        (=> (and (blue p) (round p)) (red p))))

; Round & white -> big
(assert (forall ((p Person))
        (=> (and (round p) (white p)) (big p))))

; All round -> blue
(assert (forall ((p Person))
        (=> (round p) (blue p))))

;--- Query -------------------------------------------------
; Is Bob green?
(assert (green bob))

;--- Check -----------------------------------------------
(check-sat)
(get-model)