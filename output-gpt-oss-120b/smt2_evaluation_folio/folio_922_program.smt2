;-----------------------------------------------------------------
;  Sorts
;-----------------------------------------------------------------
(declare-sort Person 0)

;-----------------------------------------------------------------
;  Constants
;-----------------------------------------------------------------
(declare-const Susan Person)

;-----------------------------------------------------------------
;  Predicates (functions returning Bool)
;-----------------------------------------------------------------
(declare-fun atEvent            (Person) Bool)
(declare-fun youngAdult         (Person) Bool)
(declare-fun collegeStudent     (Person) Bool)
(declare-fun yaleStudent        (Person) Bool)
(declare-fun harvardStudent     (Person) Bool)
(declare-fun diligent           (Person) Bool)
(declare-fun likesIndependence  (Person) Bool)

;-----------------------------------------------------------------
;  Knowledge base (premises)
;-----------------------------------------------------------------

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

; 6. Susan is at the event, and if Susan is a Harvard student, then she is a young adult.
(assert (and (atEvent Susan)
             (=> (harvardStudent Susan) (youngAdult Susan))))

; 7. If Susan is a Yale student, then she does not like independence.
(assert (=> (yaleStudent Susan) (not (likesIndependence Susan))))

;-----------------------------------------------------------------
;  Statement to test: "Susan likes independence and is diligent."
;-----------------------------------------------------------------
(assert (and (likesIndependence Susan)
             (diligent Susan)))

;-----------------------------------------------------------------
;  Solve
;-----------------------------------------------------------------
(check-sat)
(get-model)