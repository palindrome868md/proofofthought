; Question: Is there a warthog on Broadway?

; Declare sorts
(declare-sort Animal 0)
(declare-sort Location 0)

; Declare constants
(declare-const broadway Location)

; Declare predicates
(declare-fun is-warthog (Animal) Bool)
(declare-fun on-location (Animal Location) Bool)

; Knowledge base
; Rule: If an animal is on Broadway, then it is not a warthog
(assert (forall ((a Animal))
  (=> (on-location a broadway)
      (not (is-warthog a)))))

; Test scenario: There exists an animal that is a warthog and is on Broadway
(assert (exists ((a Animal))
  (and (is-warthog a)
       (on-location a broadway))))

; Check satisfiability to answer the question
(check-sat)