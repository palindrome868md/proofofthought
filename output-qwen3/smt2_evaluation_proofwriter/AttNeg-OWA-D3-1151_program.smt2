; Reasoning Steps:
; 1. Analyze the question: "Anne is nice."
; 2. Identify relevant facts: Anne is red.
; 3. Trace logical implications for Anne:
;    - Anne is Red (Fact).
;    - Red people are White (Rule). -> Anne is White.
;    - All White people are not Young (Rule). -> Anne is Not Young.
;    - Anne is Red AND Anne is Not Young.
;    - If someone is Red and not Young then they are Nice (Rule). -> Anne is Nice.
; 4. Conclusion: The statement "Anne is nice" is logically entailed by the knowledge base.
; 5. Verification Strategy: Assert the knowledge base and the statement "Anne is nice".
;    - If (check-sat) returns 'sat', the statement is consistent/True.
;    - If (check-sat) returns 'unsat', the statement contradicts the KB/False.
;    - Expected result: sat.

; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare functions (Properties)
(declare-fun is-red (Person) Bool)
(declare-fun is-blue (Person) Bool)
(declare-fun is-green (Person) Bool)
(declare-fun is-white (Person) Bool)
(declare-fun is-young (Person) Bool)
(declare-fun is-nice (Person) Bool)

; 3. Declare constants
(declare-const anne Person)
(declare-const bob Person)
(declare-const charlie Person)

; 4. Assert knowledge base (Facts)
(assert (is-red anne))
(assert (not (is-nice bob)))
(assert (is-blue charlie))

; 5. Assert knowledge base (Rules)
; If someone is young then they are green.
(assert (forall ((p Person)) (=> (is-young p) (is-green p))))

; If someone is young and green then they are not red.
(assert (forall ((p Person)) (=> (and (is-young p) (is-green p)) (not (is-red p)))))

; Red people are white.
(assert (forall ((p Person)) (=> (is-red p) (is-white p))))

; If Charlie is white then Charlie is blue.
(assert (=> (is-white charlie) (is-blue charlie)))

; All white people are not young.
(assert (forall ((p Person)) (=> (is-white p) (not (is-young p)))))

; If someone is red and not young then they are nice.
(assert (forall ((p Person)) (=> (and (is-red p) (not (is-young p))) (is-nice p))))

; 6. Verification: Test the question "Anne is nice."
; We assert the claim to check if it is satisfiable (True) or unsatisfiable (False).
(assert (is-nice anne))

; 7. Check satisfiability
(check-sat)
(get-model)