; Declare sorts
(declare-sort Person 0)

; Declare predicates
(declare-fun AtEvent (Person) Bool)
(declare-fun YoungAdult (Person) Bool)
(declare-fun CollegeStudent (Person) Bool)
(declare-fun YaleStudent (Person) Bool)
(declare-fun HarvardStudent (Person) Bool)
(declare-fun LikesIndependence (Person) Bool)
(declare-fun Diligent (Person) Bool)

; Declare constants
(declare-const susan Person)

; Knowledge base (premises)
; 1. All young adults at the event like independence.
(assert (forall ((x Person))
  (=> (and (AtEvent x) (YoungAdult x))
      (LikesIndependence x))))
; 2. All college students at the event are young adults.
(assert (forall ((x Person))
  (=> (and (CollegeStudent x) (AtEvent x))
      (YoungAdult x))))
; 3. All Yale students at the event are college students.
(assert (forall ((x Person))
  (=> (and (YaleStudent x) (AtEvent x))
      (CollegeStudent x))))
; 4. Everyone at the event is a Yale student or a Harvard student.
(assert (forall ((x Person))
  (=> (AtEvent x)
      (or (YaleStudent x) (HarvardStudent x)))))
; 5. All Harvard students at the event are diligent.
(assert (forall ((x Person))
  (=> (and (HarvardStudent x) (AtEvent x))
      (Diligent x))))
; 6. Susan is at the event.
(assert (AtEvent susan))
; 7. If Susan is a Harvard student, then she is a young adult.
(assert (=> (HarvardStudent susan) (YoungAdult susan)))
; 8. If Susan is a Yale student, then she does not like independence.
(assert (=> (YaleStudent susan) (not (LikesIndependence susan))))

; Test: "Susan is not both diligent and likes independence."
; That is: not (Diligent(susan) and LikesIndependence(susan))
(assert (not (and (Diligent susan) (LikesIndependence susan))))

; Check satisfiability to answer the question
(check-sat)