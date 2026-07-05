; Sorts
(declare-sort Person 0)
(declare-sort Illness 0)

; Constants
(declare-const me Person)
(declare-const PTSD Illness)

; Year of injury and onset
(declare-fun injury-year (Person) Int)
(declare-fun onset-year (Person) Int)

; Illness timing property
(declare-fun late-onset (Illness) Bool)

; Relationship: illness originates from service
(declare-fun originate-from-service (Person Illness) Bool)

; Eligibility predicate
(declare-fun afcs-eligible (Person Illness) Bool)

; Knowledge base
(assert (= (injury-year me) 2013))     ; injured during Afghanistan service in 2013
(assert (= (onset-year me) 2024))      ; onset of PTSD in 2024 (late onset)
(assert (originate-from-service me PTSD))
(assert (late-onset PTSD))

; If illness originates from service and is late-onset, eligible
(forall ((p Person) (i Illness))
  (=> (and (= p me) (= i PTSD) (originate-from-service p i) (late-onset i))
      (afcs-eligible p i)))

; If illness originates from service and onset is within 7 years, eligible
(forall ((p Person) (i Illness))
  (=> (and (= p me) (= i PTSD) (originate-from-service p i) (<= (- (onset-year p) (injury-year p)) 7))
      (afcs-eligible p i)))

; Test scenario: Can I claim?
(assert (afcs-eligible me PTSD))

(check-sat)