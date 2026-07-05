; Sorts
(declare-sort Person 0)
(declare-sort Country 0)

; Functions
(declare-fun age (Person) Int)
(declare-fun acquired_gender_recognised_in (Person Country) Bool)
(declare-fun has_documents (Person) Bool)
(declare-fun overseas_route_elig (Person) Bool)
(declare-fun is_approved_country (Country) Bool)

; Constants
(declare-const me Person)
(declare-const australia Country)

; Knowledge base (scenario)
(assert (>= (age me) 18))
(assert (acquired_gender_recognised_in me australia))
(assert (has_documents me))
(assert (is_approved_country australia))

; Overseas route eligibility is equivalent to meeting all requirements
; If eligible -> requirements hold
(assert (forall ((p Person))
  (=> (overseas_route_elig p)
      (and (>= (age p) 18)
           (acquired_gender_recognised_in p australia)
           (has_documents p)
           (is_approved_country australia)))))

; If requirements hold -> eligible
(assert (forall ((p Person))
  (=> (and (>= (age p) 18)
           (acquired_gender_recognised_in p australia)
           (has_documents p)
           (is_approved_country australia))
      (overseas_route_elig p))))

; Test scenario: Is me eligible via overseas route?
; Assert the scenario (the question being tested)
(assert (overseas_route_elig me))

; Check satisfiability and provide a model
(check-sat)
(get-model)