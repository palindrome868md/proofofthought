; Sorts
(declare-sort Person 0)

; Predicates / relations
(declare-fun at-event (Person) Bool)
(declare-fun is-yale-student (Person) Bool)
(declare-fun is-harvard-student (Person) Bool)
(declare-fun is-college-student (Person) Bool)
(declare-fun is-young-adult (Person) Bool)
(declare-fun likes-independence (Person) Bool)
(declare-fun diligent (Person) Bool)

; Constants
(declare-const susan Person)

; Knowledge base

; 1) All Yale students at the event are college students
(assert (forall ((p Person))
  (=> (and (is-yale-student p) (at-event p))
      (is-college-student p))))

; 2) All college students at the event are young adults
(assert (forall ((p Person))
  (=> (and (is-college-student p) (at-event p))
      (is-young-adult p))))

; 3) All young adults at the event like independence
(assert (forall ((p Person))
  (=> (and (is-young-adult p) (at-event p))
      (likes-independence p))))

; 4) All Harvard students at the event are diligent
(assert (forall ((p Person))
  (=> (and (is-harvard-student p) (at-event p))
      (diligent p))))

; 5) Everyone at the event is a Yale student or a Harvard student
(assert (forall ((p Person))
  (=> (at-event p)
      (or (is-yale-student p) (is-harvard-student p)))))

; 6) Susan is at the event
(assert (at-event susan))

; 7) If Susan is Harvard, then she is a young adult
(assert (=> (is-harvard-student susan) (is-young-adult susan)))

; 8) Test: Susan likes independence and is diligent
(assert (likes-independence susan))
(assert (diligent susan))

; Check the satisfiability of the scenario
(check-sat)
(get-model)