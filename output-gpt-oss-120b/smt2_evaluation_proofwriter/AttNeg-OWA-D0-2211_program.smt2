; Declare the domain of individuals
(declare-sort Person 0)

; Declare unary predicates for the relevant properties
(declare-fun blue   (Person) Bool)
(declare-fun rough  (Person) Bool)
(declare-fun big    (Person) Bool)
(declare-fun furry  (Person) Bool)
(declare-fun kind   (Person) Bool)
(declare-fun green  (Person) Bool)
(declare-fun quiet  (Person) Bool)

; Declare the specific individuals mentioned
(declare-const anne Person)
(declare-const bob  Person)
(declare-const gary Person)

; ---------- Knowledge base ----------
; Facts
(assert (blue anne))
(assert (not (blue bob)))   ; Bob is not blue
(assert (blue gary))

; Rules
; 1. Rough → Big
(assert (forall ((x Person)) (=> (rough x) (big x))))

; 2. Furry ∧ Kind → Big
(assert (forall ((x Person)) (=> (and (furry x) (kind x)) (big x))))

; 3. Furry → Big
(assert (forall ((x Person)) (=> (furry x) (big x))))

; 4. Green → Rough
(assert (forall ((x Person)) (=> (green x) (rough x))))

; 5. Blue ∧ Quiet → ¬Furry
(assert (forall ((x Person)) (=> (and (blue x) (quiet x)) (not (furry x)))))

; 6. If Gary is quiet then Gary is rough
(assert (=> (quiet gary) (rough gary)))

; ---------- Query ----------
; Test the statement: "Bob is blue."
(assert (blue bob))

; Check consistency of the knowledge base together with the query
(check-sat)
(get-model)