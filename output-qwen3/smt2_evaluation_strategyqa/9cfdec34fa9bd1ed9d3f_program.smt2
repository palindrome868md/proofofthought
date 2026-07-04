; Declare sorts
(declare-sort Person 0)

; Declare functions
(declare-fun has-healthy-lungs (Person) Bool)
(declare-fun has-respiratory-issues (Person) Bool)
(declare-fun had-chronic-health-problems (Person) Bool)

; Declare constants
(declare-const j-p-morgan Person)

; Knowledge base: Historical facts about J.P. Morgan's health
; J.P. Morgan suffered from various chronic health conditions
(assert (had-chronic-health-problems j-p-morgan))

; J.P. Morgan had respiratory issues (historical record)
(assert (has-respiratory-issues j-p-morgan))

; Rule 1: If someone has respiratory issues, they don't have healthy lungs
(assert (forall ((p Person))
  (=> (has-respiratory-issues p)
      (not (has-healthy-lungs p)))))

; Rule 2: Chronic health problems often include respiratory complications
(assert (forall ((p Person))
  (=> (had-chronic-health-problems p)
      (has-respiratory-issues p))))

; Test: Did J.P. Morgan have healthy lungs?
; We assert the claim and check if it's satisfiable with the knowledge base
(assert (has-healthy-lungs j-p-morgan))

; Check satisfiability
(check-sat)
(get-model)