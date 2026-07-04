;--- Sorts -------------------------------------------------
(declare-sort Person 0)
(declare-sort Vehicle 0)

;--- Functions ---------------------------------------------
(declare-fun born-year    (Person) Int)
(declare-fun died-year    (Person) Int)
(declare-fun invention-year (Vehicle) Int)
(declare-fun can-operate (Person Vehicle) Bool)

;--- Constants ---------------------------------------------
(declare-const oscar-wilde Person)
(declare-const motor-vehicle Vehicle)

;--- Knowledge base ----------------------------------------
; Oscar Wilde lived from 1854 to 1900
(assert (= (born-year oscar-wilde) 1854))
(assert (= (died-year oscar-wilde) 1900))

; First practical motor vehicles appeared in 1885
(assert (= (invention-year motor-vehicle) 1885))

; Rule: a person can operate a vehicle if they were alive then
;       and were at least 16 years old at that time.
(assert
  (forall ((p Person) (v Vehicle))
    (=> (and (<= (born-year p) (invention-year v))          ; alive at invention
             (>= (died-year p) (invention-year v))          ; still alive
             (>= (- (invention-year v) (born-year p)) 16)) ; age ≥ 16
        (can-operate p v))))

;--- Test the question --------------------------------------
; Could Oscar Wilde have operated a motor vehicle?
(assert (can-operate oscar-wilde motor-vehicle))

;--- Solve -------------------------------------------------
(check-sat)   ; Expected: sat  (the statement is possible)
(get-model)