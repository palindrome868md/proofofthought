; Reasoning Steps:
; 1. Analyze the Knowledge Base:
;    - Facts: Fiona is blue, kind, nice, quiet, young.
;    - Rules: 
;      - Blue things are white.
;      - Kind things are red.
;      - Red and nice things are white.
;      - etc.
; 2. Logical Deduction:
;    - From Fact: Fiona is blue.
;    - From Rule: Blue things are white.
;    - Inference: Fiona is white.
; 3. Analyze the Question:
;    - Statement: "Fiona is not white".
;    - This contradicts the inference "Fiona is white".
; 4. Verification Strategy:
;    - Assert the Knowledge Base.
;    - Assert the Statement "(not (is-white fiona))".
;    - Check Satisfiability.
;    - Expected Result: unsat (indicating the statement is False).

; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare functions
(declare-fun is-blue (Person) Bool)
(declare-fun is-quiet (Person) Bool)
(declare-fun is-white (Person) Bool)
(declare-fun is-kind (Person) Bool)
(declare-fun is-nice (Person) Bool)
(declare-fun is-red (Person) Bool)
(declare-fun is-young (Person) Bool)

; 3. Declare constants
(declare-const anne Person)
(declare-const bob Person)
(declare-const charlie Person)
(declare-const fiona Person)

; 4. Assert knowledge base (facts)
; Anne
(assert (is-blue anne))
(assert (is-quiet anne))
(assert (is-white anne))

; Bob
(assert (is-blue bob))
(assert (is-kind bob))
(assert (is-nice bob))
(assert (is-red bob))
(assert (is-young bob))

; Charlie
(assert (is-blue charlie))
(assert (is-quiet charlie))

; Fiona
(assert (is-blue fiona))
(assert (is-kind fiona))
(assert (is-nice fiona))
(assert (is-quiet fiona))
(assert (is-young fiona))

; Rules
; If something is kind then it is red.
(assert (forall ((x Person)) (=> (is-kind x) (is-red x))))

; Red, nice things are white.
(assert (forall ((x Person)) (=> (and (is-red x) (is-nice x)) (is-white x))))

; If something is blue and white then it is red.
(assert (forall ((x Person)) (=> (and (is-blue x) (is-white x)) (is-red x))))

; If something is quiet and red then it is nice.
(assert (forall ((x Person)) (=> (and (is-quiet x) (is-red x)) (is-nice x))))

; Blue things are white.
(assert (forall ((x Person)) (=> (is-blue x) (is-white x))))

; All red things are young.
(assert (forall ((x Person)) (=> (is-red x) (is-young x))))

; If Fiona is quiet and Fiona is nice then Fiona is kind.
(assert (=> (and (is-quiet fiona) (is-nice fiona)) (is-kind fiona)))

; If something is young and white then it is kind.
(assert (forall ((x Person)) (=> (and (is-young x) (is-white x)) (is-kind x))))

; 5. Test: Fiona is not white.
(assert (not (is-white fiona)))

; 6. Check satisfiability
(check-sat)
(get-model)