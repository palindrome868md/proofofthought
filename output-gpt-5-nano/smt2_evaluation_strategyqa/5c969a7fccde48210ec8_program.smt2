; Sorts
(declare-sort Person 0)

; Enumerated Brand datatype
(declare-datatypes () ((Brand plain dolce_gabbana other)))

; Functions
(declare-fun wears-brand (Person) Brand)

; Predicates
(declare-fun is-amish (Person) Bool)
(declare-fun cousin (Person Person) Bool)
(declare-fun shuns (Person Person) Bool)

; Constants (test subject and an Amish cousin)
(declare-const p Person)
(declare-const amish-cousin Person)

; Knowledge base
; Rule: If y is Amish and x is a cousin of y and x wears a non-plain brand, then y shuns x
(assert
  (forall ((x Person) (y Person))
    (=> (and (is-amish y) (cousin x y) (not (= (wears-brand x) plain)))
        (shuns y x))))

; Facts for the test subject
(assert (= (wears-brand p) dolce_gabbana))  ; p wears a Dolce & Gabbana suit
(assert (is-amish amish-cousin))              ; amish-cousin is Amish
(assert (cousin p amish-cousin))              ; amish-cousin is a cousin of p
(assert (not (= p amish-cousin)))             ; p and amish-cousin are distinct

; Test scenario: Would p be shunned by their Amish cousins?
(assert (shuns amish-cousin p))

; Check satisfiability
(check-sat)
(get-model)