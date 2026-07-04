; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare functions (predicates)
(declare-fun is-at-event (Person) Bool)
(declare-fun is-young-adult (Person) Bool)
(declare-fun likes-independence (Person) Bool)
(declare-fun is-college-student (Person) Bool)
(declare-fun is-yale-student (Person) Bool)
(declare-fun is-harvard-student (Person) Bool)
(declare-fun is-diligent (Person) Bool)

; 3. Declare constants
(declare-const susan Person)

; 4. Assert knowledge base (premises)

; Premise 1: All young adults at the event like independence.
(assert (forall ((p Person))
  (=> (and (is-at-event p) (is-young-adult p))
      (likes-independence p))))

; Premise 2: All college students at the event are young adults.
(assert (forall ((p Person))
  (=> (and (is-at-event p) (is-college-student p))
      (is-young-adult p))))

; Premise 3: All Yale students at the event are college students.
(assert (forall ((p Person))
  (=> (and (is-at-event p) (is-yale-student p))
      (is-college-student p))))

; Premise 4: Everyone at the event is a Yale student or a Harvard student.
(assert (forall ((p Person))
  (=> (is-at-event p)
      (or (is-yale-student p) (is-harvard-student p)))))

; Premise 5: All Harvard students at the event are diligent.
(assert (forall ((p Person))
  (=> (and (is-at-event p) (is-harvard-student p))
      (is-diligent p))))

; Premise 6: Susan is at the event.
(assert (is-at-event susan))

; Premise 7: If Susan is a Harvard student, then she is a young adult.
(assert (=> (is-harvard-student susan) (is-young-adult susan)))

; Premise 8: If Susan is a Yale student, then she does not like independence.
(assert (=> (is-yale-student susan) (not (likes-independence susan))))

; 5. Verification Scenario
; Statement to verify: "Susan is not both diligent and likes independence."
; We assert the NEGATION: "Susan IS both diligent and likes independence."
; If this leads to 'unsat', the original statement is True.
; If this leads to 'sat', the original statement is False.
(assert (and (is-diligent susan) (likes-independence susan)))

; 6. Check satisfiability
(check-sat)
(get-model)