; Sorts
(declare-sort Person 0)

; Constants
(declare-const susan Person)

; Predicates / Functions
(declare-fun at_event (Person) Bool)
(declare-fun is_yale (Person) Bool)
(declare-fun is_harvard (Person) Bool)
(declare-fun is_college (Person) Bool)
(declare-fun is_young (Person) Bool)
(declare-fun likes_independence (Person) Bool)
(declare-fun diligent (Person) Bool)

; Premises (Knowledge Base)

; 1. All young adults at the event like independence.
(assert (forall ((p Person))
  (=> (and (at_event p) (is_young p))
      (likes_independence p))))

; 2. All college students at the event are young adults.
(assert (forall ((p Person))
  (=> (and (at_event p) (is_college p))
      (is_young p))))

; 3. All Yale students at the event are college students.
(assert (forall ((p Person))
  (=> (and (at_event p) (is_yale p))
      (is_college p))))

; 4. Everyone at the event is a Yale student or a Harvard student.
(assert (forall ((p Person))
  (=> (at_event p)
      (or (is_yale p) (is_harvard p)))))

; 5. All Harvard students at the event are diligent.
(assert (forall ((p Person))
  (=> (and (at_event p) (is_harvard p))
      (diligent p))))

; 6. Susan is at the event.
(assert (at_event susan))

; 7. If Susan is a Harvard student, then she is a young adult.
(assert (=> (is_harvard susan) (is_young susan)))

; 8. If Susan is a Yale student, then she does not like independence.
(assert (=> (is_yale susan) (not (likes_independence susan))))

; Test: "Susan likes independence and is diligent."
(assert (likes_independence susan))
(assert (diligent susan))

; Check satisfiability to determine truth of the statement under the premises
(check-sat)
(get-model)