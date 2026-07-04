; Sorts
(declare-sort Person 0)

; Constants
(declare-const susan Person)

; Predicates
(declare-fun at-event (Person) Bool)
(declare-fun is-yale (Person) Bool)
(declare-fun is-harvard (Person) Bool)
(declare-fun is-college (Person) Bool)
(declare-fun is-young (Person) Bool)
(declare-fun is-diligent (Person) Bool)
(declare-fun likes-independence (Person) Bool)

; Knowledge base (premises)

; 1. All young adults at the event like independence.
(assert (forall ((p Person))
  (=> (and (at-event p) (is-young p))
      (likes-independence p))))

; 2. All college students at the event are young adults.
(assert (forall ((p Person))
  (=> (and (at-event p) (is-college p))
      (is-young p))))

; 3. All Yale students at the event are college students.
(assert (forall ((p Person))
  (=> (and (at-event p) (is-yale p))
      (is-college p))))

; 4. Everyone at the event is a Yale student or a Harvard student.
(assert (forall ((p Person))
  (=> (at-event p)
      (or (is-yale p) (is-harvard p)))))

; 5. All Harvard students at the event are diligent.
(assert (forall ((p Person))
  (=> (and (at-event p) (is-harvard p))
      (is-diligent p))))

; 6. Susan is at the event.
(assert (at-event susan))

; 7. If Susan is a Harvard student, then she is a young adult.
(assert (=> (is-harvard susan) (is-young susan)))

; 8. If Susan is a Yale student, then she does not like independence.
(assert (=> (is-yale susan) (not (likes-independence susan))))

; Test scenario: Is Susan diligently and does Susan like independence?
(assert (and (is-diligent susan) (likes-independence susan))))

; Check satisfiability to answer the question
(check-sat)
(get-model)