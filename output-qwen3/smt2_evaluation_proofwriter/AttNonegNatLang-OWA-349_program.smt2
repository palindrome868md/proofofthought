(declare-sort Person 0)

; Declare predicates for properties
(declare-fun is-kind (Person) Bool)
(declare-fun is-nice (Person) Bool)
(declare-fun is-rough (Person) Bool)
(declare-fun is-young (Person) Bool)
(declare-fun is-big (Person) Bool)
(declare-fun is-cold (Person) Bool)
(declare-fun is-round (Person) Bool)
(declare-fun is-red (Person) Bool)
(declare-fun is-green (Person) Bool)
(declare-fun is-blue (Person) Bool)
(declare-fun is-down (Person) Bool)

; Declare individuals
(declare-const bob Person)
(declare-const charlie Person)
(declare-const dave Person)
(declare-const gary Person)

; Individuals are distinct
(assert (distinct bob charlie dave gary))

; Facts from the text
; Bob
(assert (is-round bob))
(assert (is-kind bob))

; Charlie
(assert (is-young charlie))
(assert (is-cold charlie))

; Dave
(assert (is-round dave))
(assert (is-rough dave))
(assert (is-big dave))

; Gary
(assert (is-nice gary))
(assert (is-kind gary))
(assert (is-red gary))
(assert (is-green gary))
(assert (is-cold gary))

; Rules from the text
; 1. A kind person who is down in the dumps and blue tends to have a rough side.
(assert (forall ((p Person)) (=> (and (is-kind p) (is-down p) (is-blue p)) (is-rough p))))

; 2. Every time you meet someone kind and nice, they'll be green, too.
(assert (forall ((p Person)) (=> (and (is-kind p) (is-nice p)) (is-green p))))

; 3. A red hued and rough looking person is definitely a young person.
(assert (forall ((p Person)) (=> (and (is-red p) (is-rough p)) (is-young p))))

; 4. Anyone who is both red and green must be as cold as Christmas.
(assert (forall ((p Person)) (=> (and (is-red p) (is-green p)) (is-cold p))))

; 5. Watch out for young people that are kind for they are rough.
(assert (forall ((p Person)) (=> (and (is-young p) (is-kind p)) (is-rough p))))

; 6. Nice and green people are often found to be big as well.
(assert (forall ((p Person)) (=> (and (is-nice p) (is-green p)) (is-big p))))

; 7. A person who inherits genes that make them big and green will also express a blue color.
(assert (forall ((p Person)) (=> (and (is-big p) (is-green p)) (is-blue p))))

; Uniqueness Constraint: "The young person who is always feeling cold is named Charlie."
; This implies that if any person is both young and cold, they must be Charlie.
(assert (forall ((p Person)) (=> (and (is-young p) (is-cold p)) (= p charlie))))

; Verification: Test the statement "Gary is young."
(assert (is-young gary))

; Check satisfiability
; If unsat, the statement contradicts the knowledge base (False).
; If sat, the statement is consistent with the knowledge base (True/Possible).
(check-sat)
(get-model)