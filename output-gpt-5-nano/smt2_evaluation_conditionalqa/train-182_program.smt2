(declare-sort Person 0)

; Functions
(declare-fun age (Person) Int)
(declare-fun is-close-relative (Person Person) Bool)
(declare-fun lacks-capacity (Person) Bool)
(declare-fun has-objection (Person Person) Bool)

; Constants (the people in the scenario)
(declare-const brother Person)           ; the brother who lacks capacity
(declare-const partner-brother Person)   ; the partner's brother (potential deputy)

; Knowledge base (facts)
(assert (lacks-capacity brother))                         ; the brother lacks mental capacity

; Relationship facts
(assert (is-close-relative partner-brother brother))     ; partner's brother is a close relative of the brother

; Age facts (we assume both exist; at least the potential deputy must be 18+)
(assert (>= (age partner-brother) 18))                   ; partner's brother is 18 or older

; Objections
(assert (not (has-objection partner-brother brother)))    ; there are no objections to partner's brother becoming deputy

; Verification test: is it possible for "partner's brother" to be deputy for "brother"?
; There exists at least one candidate who is 18+, a close relative, with no objections, for whom the brother lacks capacity
(assert (exists ((cand Person))
  (and (>= (age cand) 18)
       (is-close-relative cand brother)
       (not (has-objection cand brother))
       (lacks-capacity brother))))

; Check satisfiability to answer the question
(check-sat)
(get-model)