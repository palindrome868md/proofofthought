; Question: Would an ethics professor teach a class on Cezanne?
; Reasoning: Ethics professors teach ethics/philosophy. Cezanne is an art subject.
; Professors typically teach within their field of expertise.

; Declare sorts
(declare-sort Person 0)
(declare-sort Subject 0)

; Declare functions
(declare-fun is-ethics-professor (Person) Bool)
(declare-fun is-art-subject (Subject) Bool)
(declare-fun teaches (Person Subject) Bool)

; Declare constants
(declare-const prof Person)
(declare-const cezanne Subject)

; Knowledge base
; This person is an ethics professor
(assert (is-ethics-professor prof))

; Cezanne is an art subject (French Post-Impressionist painter)
(assert (is-art-subject cezanne))

; Rule: Ethics professors only teach ethics subjects, not art subjects
(assert (forall ((p Person) (s Subject))
  (=> (and (is-ethics-professor p) (teaches p s))
      (not (is-art-subject s)))))

; Test scenario: Would the ethics professor teach Cezanne?
(assert (teaches prof cezanne))

; Check satisfiability
; If unsat: Ethics professor would NOT teach Cezanne (contradiction)
; If sat: Ethics professor COULD teach Cezanne
(check-sat)
(get-model)