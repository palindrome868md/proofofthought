; Question: Would a student of the class of 2017 have amnesia about 9/11?
; This tests whether a 2017 graduate would have memory of the 9/11 attacks

; Declare sorts
(declare-sort Person 0)
(declare-sort Event 0)

; Declare functions
(declare-fun birth-year (Person) Int)
(declare-fun graduation-year (Person) Int)
(declare-fun event-year (Event) Int)
(declare-fun remembers (Person Event) Bool)
(declare-fun age-at-event (Person Event) Int)

; Declare constants
(declare-const student-2017 Person)
(declare-const sept-11 Event)

; Knowledge base: 9/11 occurred in 2001
(assert (= (event-year sept-11) 2001))

; Knowledge base: Class of 2017 graduates in 2017
(assert (= (graduation-year student-2017) 2017))

; Knowledge base: Typical high school graduation age is 18
; Therefore birth year = graduation year - 18
(assert (= (birth-year student-2017) (- (graduation-year student-2017) 18)))

; Calculate age at time of 9/11
(assert (= (age-at-event student-2017 sept-11) 
           (- (event-year sept-11) (birth-year student-2017))))

; Psychological fact: People do not form conscious memories before age 3
; (This is known as infantile/childhood amnesia)
(assert (forall ((p Person) (e Event))
  (=> (< (age-at-event p e) 3)
      (not (remembers p e)))))

; Test assertion: Would the 2017 student remember 9/11?
; If this is unsat, it means they would NOT remember (have amnesia about it)
(assert (remembers student-2017 sept-11))

; Check satisfiability
(check-sat)
(get-model)