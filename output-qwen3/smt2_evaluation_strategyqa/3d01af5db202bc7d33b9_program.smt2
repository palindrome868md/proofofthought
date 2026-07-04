; Declare sorts
(declare-sort Person 0)
(declare-sort Location 0)
(declare-sort Plant 0)
(declare-sort Term 0)

; Declare functions
(declare-fun located-in (Person Location) Bool)
(declare-fun refers-to-as (Person Plant Term) Bool)
(declare-fun common-term-in (Location Plant Term) Bool)
(declare-fun is-indian-city (Location) Bool)

; Declare constants
(declare-const person-x Person)
(declare-const mumbai Location)
(declare-const solanum-melongena Plant)
(declare-const eggplant Term)
(declare-const brinjal Term)

; Knowledge base: Mumbai is an Indian city
(assert (is-indian-city mumbai))

; Knowledge base: In Indian cities, "brinjal" is the common term for Solanum melongena
(assert (forall ((l Location) (pl Plant) (t Term))
  (=> (and (is-indian-city l) (= pl solanum-melongena) (= t brinjal))
      (common-term-in l pl t))))

; Knowledge base: "eggplant" is NOT the common term in Indian cities for Solanum melongena
(assert (forall ((l Location))
  (=> (is-indian-city l)
      (not (common-term-in l solanum-melongena eggplant)))))

; Knowledge base: People use the common term for their location
(assert (forall ((p Person) (l Location) (pl Plant) (t Term))
  (=> (and (located-in p l) (common-term-in l pl t))
      (refers-to-as p pl t))))

; Knowledge base: People don't typically use non-common terms when a common term exists
(assert (forall ((p Person) (l Location) (pl Plant) (t1 Term) (t2 Term))
  (=> (and (located-in p l)
           (common-term-in l pl t1)
           (not (common-term-in l pl t2))
           (not (= t1 t2)))
      (not (refers-to-as p pl t2)))))

; Fact: person-x is in Mumbai
(assert (located-in person-x mumbai))

; Fact: brinjal is the common term in Mumbai for Solanum melongena
(assert (common-term-in mumbai solanum-melongena brinjal))

; Test: Would someone in Mumbai refer to Solanum melongena as eggplant?
(assert (refers-to-as person-x solanum-melongena eggplant))

; Check satisfiability
(check-sat)
(get-model)