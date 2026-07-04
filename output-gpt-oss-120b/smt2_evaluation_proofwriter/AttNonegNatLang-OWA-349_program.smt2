; -------------------------------------------------
; 1. Declare the uninterpreted sort for persons
; -------------------------------------------------
(declare-sort Person 0)

; -------------------------------------------------
; 2. Declare predicates (unary Boolean functions)
; -------------------------------------------------
(declare-fun round   (Person) Bool)
(declare-fun kind    (Person) Bool)
(declare-fun young   (Person) Bool)
(declare-fun cold    (Person) Bool)
(declare-fun rough   (Person) Bool)
(declare-fun big     (Person) Bool)
(declare-fun nice    (Person) Bool)
(declare-fun red     (Person) Bool)
(declare-fun green   (Person) Bool)
(declare-fun blue    (Person) Bool)

; -------------------------------------------------
; 3. Declare the individuals mentioned in the story
; -------------------------------------------------
(declare-const bob     Person)
(declare-const charlie Person)
(declare-const dave    Person)
(declare-const gary    Person)

; -------------------------------------------------
; 4. Assert the factual information (the knowledge base)
; -------------------------------------------------
; Bob may be round, but he is also kind.
(assert (round bob))
(assert (kind  bob))

; The young person who is always feeling cold is named Charlie.
(assert (young charlie))
(assert (cold  charlie))

; Dave is a round and rough around the edges, and he is also big.
(assert (round dave))
(assert (rough dave))
(assert (big   dave))

; Gary is nice and kind even though people make fun of his red and green skin.
(assert (nice gary))
(assert (kind gary))
(assert (red  gary))
(assert (green gary))

; Gary always feels cold.
(assert (cold gary))

; -------------------------------------------------
; 5. Encode the general rules (implications)
; -------------------------------------------------
; A kind person who is blue tends to have a rough side.
(assert (forall ((p Person))
        (=> (and (kind p) (blue p))
            (rough p))))

; Every time you meet someone kind and nice, they'll be green, too.
(assert (forall ((p Person))
        (=> (and (kind p) (nice p))
            (green p))))

; A red hued and rough looking person is definitely a young person.
(assert (forall ((p Person))
        (=> (and (red p) (rough p))
            (young p))))

; Anyone who is both red and green must be as cold as Christmas.
(assert (forall ((p Person))
        (=> (and (red p) (green p))
            (cold p))))

; Young people that are kind are rough.
(assert (forall ((p Person))
        (=> (and (young p) (kind p))
            (rough p))))

; Nice and green people are often found to be big as well.
(assert (forall ((p Person))
        (=> (and (nice p) (green p))
            (big p))))

; A person who is big and green will also express a blue color.
(assert (forall ((p Person))
        (=> (and (big p) (green p))
            (blue p))))

; -------------------------------------------------
; 6. Test the statement: "Gary is young."
; -------------------------------------------------
(assert (young gary))

; -------------------------------------------------
; 7. Check satisfiability (sat = true, unsat = false)
; -------------------------------------------------
(check-sat)
(get-model)