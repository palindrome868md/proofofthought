; Reasoning Analysis:
; 1. Fact: Erin is red.
; 2. Rule: All red people are furry. -> Erin is furry.
; 3. Rule: If someone is furry then they are round. -> Erin is round.
; 4. Rule: If someone is red and round then they are nice. -> Erin is nice (since she is red and round).
; 5. Question to Verify: "Erin is not nice."
; 6. Logic: Since we derived "Erin is nice", the statement "Erin is not nice" contradicts the knowledge base.
; 7. Expected Result: unsat (indicating the statement is False).

; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare functions
(declare-fun is-cold (Person) Bool)
(declare-fun is-furry (Person) Bool)
(declare-fun is-nice (Person) Bool)
(declare-fun is-red (Person) Bool)
(declare-fun is-round (Person) Bool)
(declare-fun is-smart (Person) Bool)
(declare-fun is-big (Person) Bool)

; 3. Declare constants
(declare-const Bob Person)
(declare-const Erin Person)

; 4. Assert knowledge base (facts)
; Facts about Bob
(assert (is-cold Bob))
(assert (is-furry Bob))
(assert (is-nice Bob))
(assert (is-red Bob))
(assert (is-round Bob))
(assert (is-smart Bob))

; Facts about Erin
(assert (is-red Erin))

; Rules
; If someone is furry then they are round.
(assert (forall ((x Person)) (=> (is-furry x) (is-round x))))

; If Bob is nice and Bob is big then Bob is smart.
(assert (=> (and (is-nice Bob) (is-big Bob)) (is-smart Bob)))

; All red people are furry.
(assert (forall ((x Person)) (=> (is-red x) (is-furry x))))

; If someone is furry and big then they are round.
(assert (forall ((x Person)) (=> (and (is-furry x) (is-big x)) (is-round x))))

; If someone is red and round then they are nice.
(assert (forall ((x Person)) (=> (and (is-red x) (is-round x)) (is-nice x))))

; All big, cold people are red.
(assert (forall ((x Person)) (=> (and (is-big x) (is-cold x)) (is-red x))))

; All furry people are red.
(assert (forall ((x Person)) (=> (is-furry x) (is-red x))))

; All big people are cold.
(assert (forall ((x Person)) (=> (is-big x) (is-cold x))))

; 5. Verify Question: "Erin is not nice."
; Assert the statement to test
(assert (not (is-nice Erin)))

; 6. Check satisfiability
(check-sat)
(get-model)