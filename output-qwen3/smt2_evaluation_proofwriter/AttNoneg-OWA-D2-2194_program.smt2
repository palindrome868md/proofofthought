; Reasoning Steps:
; 1. Identify Sorts: We need a sort for people, let's call it 'Person'.
; 2. Identify Functions: We need predicates for properties mentioned (quiet, young, furry, big).
;    - is-quiet: Person -> Bool
;    - is-young: Person -> Bool
;    - is-furry: Person -> Bool
;    - is-big: Person -> Bool
; 3. Identify Constants: Specific individuals mentioned are Erin and Fiona.
;    - erin: Person
;    - fiona: Person
; 4. Encode Knowledge Base (Facts):
;    - Erin is quiet: (is-quiet erin)
;    - Erin is young: (is-young erin)
;    - Fiona is furry: (is-furry fiona)
; 5. Encode Knowledge Base (Rules):
;    - If someone is young then they are big: (forall ((p Person)) (=> (is-young p) (is-big p)))
;    - All furry people are young: (forall ((p Person)) (=> (is-furry p) (is-young p)))
; 6. Encode Question to Verify:
;    - Statement: "Fiona is not furry"
;    - Assertion: (not (is-furry fiona))
; 7. Verification Logic:
;    - The KB explicitly states (is-furry fiona).
;    - The Test asserts (not (is-furry fiona)).
;    - This creates a direct contradiction.
;    - Expected Result: unsat (indicating the statement "Fiona is not furry" is False).

; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare functions
(declare-fun is-quiet (Person) Bool)
(declare-fun is-young (Person) Bool)
(declare-fun is-furry (Person) Bool)
(declare-fun is-big (Person) Bool)

; 3. Declare constants
(declare-const erin Person)
(declare-const fiona Person)

; 4. Assert knowledge base (facts)
(assert (is-quiet erin))
(assert (is-young erin))
(assert (is-furry fiona))

; 5. Assert knowledge base (rules)
(assert (forall ((p Person)) (=> (is-young p) (is-big p))))
(assert (forall ((p Person)) (=> (is-furry p) (is-young p))))

; 6. Test the question: "Fiona is not furry"
(assert (not (is-furry fiona)))

; 7. Check satisfiability
(check-sat)
(get-model)