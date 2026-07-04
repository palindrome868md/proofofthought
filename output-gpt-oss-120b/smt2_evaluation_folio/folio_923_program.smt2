; -------------------------------------------------
; Sorts
(declare-sort Person 0)

; -------------------------------------------------
; Predicates (as Boolean‑valued functions)
(declare-fun atEvent          (Person) Bool)
(declare-fun youngAdult       (Person) Bool)
(declare-fun collegeStudent   (Person) Bool)
(declare-fun yaleStudent      (Person) Bool)
(declare-fun harvardStudent   (Person) Bool)
(declare-fun likesIndependence(Person) Bool)
(declare-fun diligent         (Person) Bool)

; -------------------------------------------------
; Constant for Susan
(declare-const susan Person)

; -------------------------------------------------
; Premises

; 1. All young adults at the event like independence.
(assert (forall ((p Person))
  (=> (and (youngAdult p) (atEvent p))
      (likesIndependence p))))

; 2. All college students at the event are young adults.
(assert (forall ((p Person))
  (=> (and (collegeStudent p) (atEvent p))
      (youngAdult p))))

; 3. All Yale students at the event are college students.
(assert (forall ((p Person))
  (=> (and (yaleStudent p) (atEvent p))
      (collegeStudent p))))

; 4. Everyone at the event is a Yale student or a Harvard student.
(assert (forall ((p Person))
  (=> (atEvent p)
      (or (yaleStudent p) (harvardStudent p)))))

; 5. All Harvard students at the event are diligent.
(assert (forall ((p Person))
  (=> (and (harvardStudent p) (atEvent p))
      (diligent p))))

; 6. Susan is at the event.
(assert (atEvent susan))

; 7. If Susan is a Harvard student, then she is a young adult.
(assert (=> (harvardStudent susan) (youngAdult susan)))

; 8. If Susan is a Yale student, then she does not like independence.
(assert (=> (yaleStudent susan) (not (likesIndependence susan))))

; -------------------------------------------------
; Negation of the target statement:
; Assume Susan is both diligent AND likes independence.
(assert (diligent susan))
(assert (likesIndependence susan))

; -------------------------------------------------
(check-sat)
(get-model)