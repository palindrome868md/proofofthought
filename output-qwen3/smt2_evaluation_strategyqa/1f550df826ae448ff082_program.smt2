; Question: Has the Subway restaurant franchise had any connections with child abusers?

; Declare sorts
(declare-sort Person 0)
(declare-sort Organization 0)
(declare-sort Crime 0)

; Declare functions
(declare-fun is-spokesperson (Person Organization) Bool)
(declare-fun is-employee (Person Organization) Bool)
(declare-fun convicted-of (Person Crime) Bool)
(declare-fun is-child-abuse (Crime) Bool)
(declare-fun has-connection (Organization Person) Bool)

; Declare constants
(declare-const subway Organization)
(declare-const jared-fogle Person)
(declare-const child-sex-crime Crime)

; Knowledge Base Facts

; Jared Fogle was a Subway spokesperson
(assert (is-spokesperson jared-fogle subway))

; Jared Fogle was convicted of child sex crimes
(assert (convicted-of jared-fogle child-sex-crime))

; Child sex crimes are a form of child abuse
(assert (is-child-abuse child-sex-crime))

; Rule: If someone is a spokesperson for an organization, they have a connection to it
(assert (forall ((p Person) (o Organization))
  (=> (is-spokesperson p o)
      (has-connection o p))))

; Rule: If someone is convicted of child abuse and has connection to organization,
; then organization had connections with child abusers
(assert (forall ((o Organization) (p Person) (c Crime))
  (=> (and (has-connection o p)
           (convicted-of p c)
           (is-child-abuse c))
      (has-connection o p))))

; Test: Did Subway have connections with child abusers?
; We assert there exists a person connected to Subway who was convicted of child abuse
(declare-const test-person Person)
(declare-const test-crime Crime)
(assert (has-connection subway test-person))
(assert (convicted-of test-person test-crime))
(assert (is-child-abuse test-crime))

; Check satisfiability - if sat, then the claim is possible/true
(check-sat)
(get-model)