; 1. Declare sorts
(declare-sort Person 0)
(declare-sort Property 0)

; 2. Declare functions
(declare-fun is-sole-ownership (Property) Bool)
(declare-fun is-house (Property) Bool)
(declare-fun has-will (Person) Bool)
(declare-fun needs-probate (Property) Bool)
(declare-fun wants-to-sell (Person Property) Bool)
(declare-fun must-apply-for-probate (Person) Bool)

; 3. Declare constants
(declare-const uncle Person)
(declare-const me Person)
(declare-const house Property)

; 4. Assert knowledge base (facts & rules)

; Rule 1: If the property was solely owned and is a house (not just savings), probate is needed
; (Derived from: "You may not need probate if... jointly owned... only had savings")
(assert (forall ((p Property))
  (=> (and (is-sole-ownership p) (is-house p))
      (needs-probate p))))

; Rule 2: If there is a will, probate (grant of probate) is the mechanism to deal with estate
; (Derived from: "If the person left a will you'll get either: a 'grant of probate'")
(assert (forall ((person Person))
  (=> (has-will person)
      (needs-probate house)))) ; Simplified for this context where house is the estate

; Rule 3: You should not put property on the market until you have received probate
; (Derived from: "You should not make any financial plans or put property on the market until you have received the grant of probate")
(assert (forall ((person Person) (p Property))
  (=> (and (needs-probate p) (wants-to-sell person p))
      (must-apply-for-probate person))))

; Fact 1: Uncle had sole ownership of the property
(assert (is-sole-ownership house))

; Fact 2: It is a house (high end area property)
(assert (is-house house))

; Fact 3: Uncle left a will
(assert (has-will uncle))

; Fact 4: I would like to sell it
(assert (wants-to-sell me house))

; 5. Check satisfiability
; Question: Do I need to apply for a probate before I put it on sale?
; We assert the positive claim "I must apply for probate"
; If sat (True), it means the claim is consistent/entailed by the KB.
; If unsat (False), it means the claim contradicts the KB.
(assert (must-apply-for-probate me))

(check-sat)
(get-model)