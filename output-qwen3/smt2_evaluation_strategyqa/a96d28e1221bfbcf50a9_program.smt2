; Question: Would an uninsured person be more likely than an insured person to decline a CT scan?

; Declare sorts
(declare-sort Person 0)

; Declare functions for properties
(declare-fun is-uninsured (Person) Bool)
(declare-fun is-insured (Person) Bool)
(declare-fun cost-sensitivity (Person) Int)
(declare-fun would-decline-ct (Person) Bool)

; Declare test persons
(declare-const uninsured-person Person)
(declare-const insured-person Person)

; Knowledge Base: Insurance status definitions
(assert (is-uninsured uninsured-person))
(assert (not (is-insured uninsured-person)))
(assert (is-insured insured-person))
(assert (not (is-uninsured insured-person)))

; Knowledge Base: Uninsured people have higher cost sensitivity
(assert (forall ((p Person))
  (=> (is-uninsured p)
      (>= (cost-sensitivity p) 8))))

(assert (forall ((p Person))
  (=> (is-insured p)
      (<= (cost-sensitivity p) 4))))

; Knowledge Base: CT scans are expensive procedures
; High cost sensitivity leads to declining expensive medical procedures
(assert (forall ((p Person))
  (=> (>= (cost-sensitivity p) 7)
      (would-decline-ct p))))

(assert (forall ((p Person))
  (=> (<= (cost-sensitivity p) 5)
      (not (would-decline-ct p)))))

; Verification Test: Would uninsured be more likely to decline than insured?
; We test if uninsured-person would decline AND insured-person would not decline
(assert (and (would-decline-ct uninsured-person)
             (not (would-decline-ct insured-person))))

; Check satisfiability
(check-sat)
(get-model)