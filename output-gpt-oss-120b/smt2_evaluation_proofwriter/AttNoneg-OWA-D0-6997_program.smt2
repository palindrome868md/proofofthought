; 1. Sort declaration
(declare-sort Person 0)

; 2. Predicate (function) declarations
(declare-fun red   (Person) Bool)
(declare-fun rough (Person) Bool)
(declare-fun round (Person) Bool)
(declare-fun kind  (Person) Bool)
(declare-fun white (Person) Bool)
(declare-fun big   (Person) Bool)

; 3. Constant declaration
(declare-const dave Person)

; 4. Knowledge base (facts)
(assert (red dave))
(assert (rough dave))
(assert (round dave))

; Universal rule: all kind people are round
(assert (forall ((p Person))
        (=> (kind p) (round p))))

; Conditional rule specific to Dave
(assert (=> (and (white dave) (big dave)) (rough dave)))

; 5. Test the statement: "Dave is rough."
(assert (rough dave))

; 6. Check satisfiability (sat = true, unsat = false)
(check-sat)
(get-model)