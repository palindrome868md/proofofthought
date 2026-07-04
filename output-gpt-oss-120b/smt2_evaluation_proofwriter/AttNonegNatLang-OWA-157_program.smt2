;--- Sort declaration -------------------------------------------------
(declare-sort Person 0)

;--- Predicate (function) declarations ---------------------------------
(declare-fun rough   (Person) Bool)
(declare-fun kind    (Person) Bool)
(declare-fun cold    (Person) Bool)
(declare-fun blue    (Person) Bool)
(declare-fun young   (Person) Bool)
(declare-fun nice    (Person) Bool)
(declare-fun round   (Person) Bool)
(declare-fun red     (Person) Bool)
(declare-fun big     (Person) Bool)
(declare-fun green   (Person) Bool)

;--- Constant (individual) declarations --------------------------------
(declare-const Alan Person)
(declare-const Dave Person)
(declare-const Fred Person)

;--- Knowledge base ----------------------------------------------------
; Alan's properties
(assert (rough Alan))
(assert (kind  Alan))
(assert (cold  Alan))
(assert (blue  Alan))
(assert (young Alan))

; Dave's properties (interpreting the sentence as both cold and nice)
(assert (cold Dave))
(assert (nice Dave))

; Fred's properties
(assert (round Fred))
(assert (kind  Fred))

; Rule 1: round ∧ young ∧ red → cold
(assert (forall ((p Person))
        (=> (and (round p) (young p) (red p))
            (cold p))))

; Rule 2: nice ∧ blue ∧ rough → young
(assert (forall ((p Person))
        (=> (and (nice p) (blue p) (rough p))
            (young p))))

; Rule 3: young ∧ kind → red
(assert (forall ((p Person))
        (=> (and (young p) (kind p))
            (red p))))

; Rule 4: cold ∧ rough ∧ red → kind
(assert (forall ((p Person))
        (=> (and (cold p) (rough p) (red p))
            (kind p))))

; Rule 5: young ∧ big ∧ blue → cold
(assert (forall ((p Person))
        (=> (and (young p) (big p) (blue p))
            (cold p))))

; Rule 6: round ∧ kind → young
(assert (forall ((p Person))
        (=> (and (round p) (kind p))
            (young p))))

; Rule 7: cold ∧ nice ∧ green → kind
(assert (forall ((p Person))
        (=> (and (cold p) (nice p) (green p))
            (kind p))))

;--- Query: "Fred is not young" ---------------------------------------
(assert (not (young Fred)))   ; the statement we are testing

;--- Check satisfiability ---------------------------------------------
(check-sat)   ; Expected result: unsat (the statement is false given the KB)
(get-model)