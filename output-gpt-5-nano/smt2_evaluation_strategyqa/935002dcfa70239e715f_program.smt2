; Declare sorts
(declare-sort Person 0)
(declare-sort Memorial 0)

; Declare constants
(declare-const firefighter Person)
(declare-const sept11-memorial Memorial)

; Declare predicates
(declare-fun is-firefighter (Person) Bool)
(declare-fun included-in (Person Memorial) Bool)

; Knowledge base
(assert (is-firefighter firefighter))

; Rule: All firefighters are included in the September 11 memorial
(assert (forall ((p Person))
  (=> (is-firefighter p)
      (included-in p sept11-memorial))))

; Test: Would firefighters be included in the September 11 memorial?
(assert (included-in firefighter sept11-memorial))

; Check satisfiability
(check-sat)
(get-model)