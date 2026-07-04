; ==============================================================================
; REASONING STEPS
; ==============================================================================
; 1. Analyze the Domain:
;    - Sort: Person
;    - Properties (Predicates): is-big, is-kind, is-red, is-cold, is-young, 
;      is-blue, is-rough. All map Person -> Bool.
;
; 2. Extract Facts from Text:
;    - Bob: is-big, is-kind, is-red.
;    - Fiona: is-big, is-cold, is-kind, is-red, is-young.
;    - Gary: is-blue, is-cold, is-kind, is-red, is-rough, is-young.
;    - Harry: is-blue.
;
; 3. Extract Rules from Text:
;    - Rule 1: All red people are blue. (forall p, is-red(p) => is-blue(p))
;    - Rule 2: If someone is blue then they are young. (forall p, is-blue(p) => is-young(p))
;    - Rule 3: Red, young people are cold. (forall p, is-red(p) AND is-young(p) => is-cold(p))
;
; 4. Analyze the Question:
;    - Question Statement: "Harry is not young."
;    - Logical Deduction for Harry:
;      a. Harry is Blue (Fact).
;      b. If Blue -> Young (Rule 2).
;      c. Therefore, Harry IS Young.
;    - The Question Statement ("Harry is not young") contradicts the Deduction.
;
; 5. Verification Strategy:
;    - Assert the Knowledge Base (Facts + Rules).
;    - Assert the Question Statement: (not (is-young Harry)).
;    - Run (check-sat).
;    - Interpretation:
;      - sat: The statement is consistent (True/Possible).
;      - unsat: The statement contradicts the KB (False).
;    - Expected Result: unsat (Because Harry must be young).
; ==============================================================================

; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare functions (properties)
(declare-fun is-big (Person) Bool)
(declare-fun is-kind (Person) Bool)
(declare-fun is-red (Person) Bool)
(declare-fun is-cold (Person) Bool)
(declare-fun is-young (Person) Bool)
(declare-fun is-blue (Person) Bool)
(declare-fun is-rough (Person) Bool)

; 3. Declare constants
(declare-const Bob Person)
(declare-const Fiona Person)
(declare-const Gary Person)
(declare-const Harry Person)

; 4. Assert knowledge base (facts)
; Bob
(assert (is-big Bob))
(assert (is-kind Bob))
(assert (is-red Bob))

; Fiona
(assert (is-big Fiona))
(assert (is-cold Fiona))
(assert (is-kind Fiona))
(assert (is-red Fiona))
(assert (is-young Fiona))

; Gary
(assert (is-blue Gary))
(assert (is-cold Gary))
(assert (is-kind Gary))
(assert (is-red Gary))
(assert (is-rough Gary))
(assert (is-young Gary))

; Harry
(assert (is-blue Harry))

; Rules
; All red people are blue
(assert (forall ((p Person))
  (=> (is-red p) (is-blue p))))

; If someone is blue then they are young
(assert (forall ((p Person))
  (=> (is-blue p) (is-young p))))

; Red, young people are cold
(assert (forall ((p Person))
  (=> (and (is-red p) (is-young p)) (is-cold p))))

; 5. Verification
; Question: Harry is not young.
; We assert the negation of "Harry is young" to test the statement.
(assert (not (is-young Harry)))

; Check satisfiability
; Expected: unsat (The statement contradicts the knowledge base)
(check-sat)
(get-model)