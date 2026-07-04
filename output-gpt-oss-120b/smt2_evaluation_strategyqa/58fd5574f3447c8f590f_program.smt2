;-------------------------------------------------
; Sorts
;-------------------------------------------------
(declare-sort Person 0)
(declare-sort Event 0)

;-------------------------------------------------
; Functions / Predicates
;-------------------------------------------------
(declare-fun class-year (Person) Int)        ; graduation year of a student
(declare-fun birth-year (Person) Int)        ; birth year of a person
(declare-fun event-year (Event) Int)         ; calendar year of an event
(declare-fun age-at (Person Event) Int)      ; age of a person when the event occurred
(declare-fun has-amnesia (Person Event) Bool) ; true iff the person has amnesia about the event

;-------------------------------------------------
; Constants (the individuals we talk about)
;-------------------------------------------------
(declare-const student Person)          ; a student of the class of 2017
(declare-const nineeleven Event)       ; the 9/11 terrorist attacks

;-------------------------------------------------
; Knowledge Base
;-------------------------------------------------
; The student graduated in 2017
(assert (= (class-year student) 2017))

; Assume a typical graduation age of 22 years → birth year = graduation year – 22
(assert (= (birth-year student) (- (class-year student) 22)))

; The year of the 9/11 event is 2001
(assert (= (event-year nineeleven) 2001))

; Define the age of a person at an event
(assert (= (age-at student nineeleven)
           (- (event-year nineeleven) (birth-year student))))

; Rule: anyone who was at least 5 years old when an event happened does NOT have amnesia about it
(assert (forall ((p Person) (e Event))
  (=> (>= (age-at p e) 5)
      (not (has-amnesia p e)))))

;-------------------------------------------------
; Question: "Would a student of the class of 2017 have amnesia about 9/11?"
;-------------------------------------------------
; We test the negation of the rule (i.e., assume the student *does* have amnesia)
(assert (has-amnesia student nineeleven))

;-------------------------------------------------
; Decision
;-------------------------------------------------
(check-sat)   ; Expected result: unsat (the scenario is impossible)
(get-model)   ; Optional: show a model if SAT (won't be produced for UNSAT)