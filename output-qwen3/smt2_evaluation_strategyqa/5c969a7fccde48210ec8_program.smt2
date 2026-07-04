; Declare sorts
(declare-sort Person 0)
(declare-sort Clothing 0)

; Declare functions
(declare-fun wears (Person Clothing) Bool)
(declare-fun is-amish (Person) Bool)
(declare-fun is-cousin (Person Person) Bool)
(declare-fun shuns (Person Person) Bool)
(declare-fun is-designer-clothing (Clothing) Bool)
(declare-fun violates-amish-standards (Person) Bool)

; Declare constants
(declare-const suit-wearer Person)
(declare-const amish-cousin Person)
(declare-const dolce-gabbana-suit Clothing)

; Knowledge base
; The suit wearer wears Dolce & Gabbana
(assert (wears suit-wearer dolce-gabbana-suit))

; Dolce & Gabbana is designer clothing
(assert (is-designer-clothing dolce-gabbana-suit))

; Amish cousins are Amish
(assert (is-amish amish-cousin))

; The amish-cousin is a cousin of the suit-wearer
(assert (is-cousin amish-cousin suit-wearer))

; Rule: Wearing designer clothing violates Amish standards
(assert (forall ((p Person) (c Clothing))
  (=> (and (wears p c) (is-designer-clothing c))
      (violates-amish-standards p))))

; Rule: Amish people shun those who violate their standards
(assert (forall ((shunner Person) (violator Person))
  (=> (and (is-amish shunner)
           (violates-amish-standards violator)
           (is-cousin shunner violator))
      (shuns shunner violator))))

; Test: Would the Amish cousin shun the suit wearer?
(assert (shuns amish-cousin suit-wearer))

; Check satisfiability
(check-sat)
(get-model)