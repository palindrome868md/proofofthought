; Question: Can the Swiss Guard fill the Virginia General Assembly chairs?

(declare-sort Person 0)

; Predicates
(declare-fun is_virginia_citizen (Person) Bool)
(declare-fun resident_of_virginia (Person) Bool)
(declare-fun in_swiss_guard (Person) Bool)
(declare-fun can_occupy_va_chair (Person) Bool)

; Witness: a specific individual we assert to be a Swiss Guard member
(declare-const witness Person)

; Knowledge base / rules
; 1) A person can occupy a VA chair if they are a Virginia citizen and a Virginia resident
(assert (forall ((p Person))
  (=> (and (is_virginia_citizen p) (resident_of_virginia p))
      (can_occupy_va_chair p))))

; 2) Swiss Guard members cannot occupy VA chairs
(assert (forall ((p Person))
  (=> (in_swiss_guard p)
      (not (can_occupy_va_chair p)))))

; 3) There exists a Swiss Guard member (witness)
(assert (in_swiss_guard witness))

; 4) Test: can witness occupy a VA chair?
(assert (can_occupy_va_chair witness))

; Check query
(check-sat)
(get-model)