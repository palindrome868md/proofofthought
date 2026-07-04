;--- Sort declaration -------------------------------------------------
(declare-sort Person 0)

;--- Predicate (function) declarations --------------------------------
(declare-fun big   (Person) Bool)
(declare-fun red   (Person) Bool)
(declare-fun round (Person) Bool)
(declare-fun smart (Person) Bool)
(declare-fun furry (Person) Bool)
(declare-fun blue  (Person) Bool)
(declare-fun white (Person) Bool)

;--- Constant (individual) declarations -------------------------------
(declare-const anne  Person)
(declare-const fiona Person)
(declare-const gary  Person)

;--- Knowledge base ----------------------------------------------------
(assert (big anne))
(assert (red anne))

(assert (big fiona))
(assert (not (round fiona)))   ; Fiona is not round
(assert (smart fiona))

(assert (furry gary))
(assert (smart gary))

; Rule: If Anne is big and Anne is furry then Anne is blue.
(assert (=> (and (big anne) (furry anne)) (blue anne)))

; Rule: If someone is white then they are round.
(assert (forall ((x Person)) (=> (white x) (round x))))

; Rule: If Anne is blue then Anne is white.
(assert (=> (blue anne) (white anne)))

; Rule: All red, big people are white.
(assert (forall ((x Person)) (=> (and (red x) (big x)) (white x))))

; Rule: All white people are furry.
(assert (forall ((x Person)) (=> (white x) (furry x))))

; Rule: If someone is furry then they are smart.
(assert (forall ((x Person)) (=> (furry x) (smart x))))

; Rule: If Gary is blue and Gary is not big then Gary is smart.
(assert (=> (and (blue gary) (not (big gary))) (smart gary)))

; Rule: If Fiona is red and Fiona is not furry then Fiona is smart.
(assert (=> (and (red fiona) (not (furry fiona))) (smart fiona)))

;--- Test the statement: "Gary is not smart" -------------------------
(assert (not (smart gary)))   ; the claim we are checking

;--- Check satisfiability ---------------------------------------------
(check-sat)   ; expected result: unsat (the claim is false)
(get-model)