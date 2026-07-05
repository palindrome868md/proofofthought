(declare-sort Person 0)

(declare-const me Person)
(declare-const partner Person)

; Predicates / Functions
(declare-fun recipient-dla-high-care (Person) Bool)
(declare-fun hours-caring (Person) Int)
(declare-fun earnings (Person) Int)
(declare-fun age (Person) Int)
(declare-fun in-full-time-education (Person) Bool)
(declare-fun eligible (Person) Bool)

; Knowledge about the scenario
(assert (recipient-dla-high-care partner))          ; partner receives DLA high care

; Your caring scenario
(assert (= (hours-caring me) 30))                   ; you care ~30 hours/week
(assert (= (earnings me) 125))                      ; earnings ~£125/week
(assert (= (age me) 30))                            ; you are over 16
(assert (not (in-full-time-education me)))          ; not in full-time education

; Eligibility rule: Carer's Allowance is available iff the required conditions hold
(assert (forall ((p Person))
  (= (eligible p)
     (and (recipient-dla-high-care partner)
          (>= (hours-caring p) 35)
          (<= (earnings p) 128)
          (>= (age p) 16)
          (not (in-full-time-education p))))))

; Test: Can I claim Carer's Allowance?
(assert (eligible me))

; Check satisfiability (answers the question)
(check-sat)