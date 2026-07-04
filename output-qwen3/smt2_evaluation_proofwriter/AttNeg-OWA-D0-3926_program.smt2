; SMT-LIB 2.0 Program for Theorem Proving
; Task: Verify the statement "Bob is white" based on the provided knowledge base.

; 1. Declare Sorts
; We use a generic sort 'Thing' to represent entities like Bob and Dave.
(declare-sort Thing 0)

; 2. Declare Functions (Properties)
; Each property is a function from Thing to Bool.
(declare-fun is-big (Thing) Bool)
(declare-fun is-furry (Thing) Bool)
(declare-fun is-green (Thing) Bool)
(declare-fun is-rough (Thing) Bool)
(declare-fun is-round (Thing) Bool)
(declare-fun is-smart (Thing) Bool)
(declare-fun is-white (Thing) Bool)

; 3. Declare Constants
; Define the specific entities mentioned in the problem.
(declare-const bob Thing)
(declare-const dave Thing)

; 4. Assert Knowledge Base (Facts)
; Assert explicit facts about Bob provided in the text.
(assert (not (is-big bob)))
(assert (is-furry bob))
(assert (is-green bob))
(assert (is-rough bob))
(assert (is-round bob))
(assert (is-smart bob))
(assert (not (is-white bob)))

; Assert explicit facts about Dave provided in the text.
(assert (is-big dave))
(assert (is-furry dave))
(assert (is-green dave))
(assert (is-rough dave))
(assert (not (is-round dave)))
(assert (not (is-smart dave)))
(assert (is-white dave))

; 5. Assert Knowledge Base (Rules)
; Rule: Smart, white things are big.
(assert (forall ((x Thing)) (=> (and (is-smart x) (is-white x)) (is-big x))))

; Rule: If Dave is white then Dave is big.
(assert (=> (is-white dave) (is-big dave)))

; Rule: If something is white and not big then it is round.
(assert (forall ((x Thing)) (=> (and (is-white x) (not (is-big x))) (is-round x))))

; Rule: Big, white things are not round.
(assert (forall ((x Thing)) (=> (and (is-big x) (is-white x)) (not (is-round x)))))

; Rule: If something is big and smart then it is round.
(assert (forall ((x Thing)) (=> (and (is-big x) (is-smart x)) (is-round x))))

; Rule: If something is white then it is furry.
(assert (forall ((x Thing)) (=> (is-white x) (is-furry x))))

; Rule: If something is round and rough then it is furry.
(assert (forall ((x Thing)) (=> (and (is-round x) (is-rough x)) (is-furry x))))

; Rule: If Dave is round and Dave is green then Dave is furry.
(assert (=> (and (is-round dave) (is-green dave)) (is-furry dave)))

; 6. Verification
; Question: "Bob is white."
; To verify this, we assert the statement as a constraint.
; If the solver returns 'unsat', the statement contradicts the KB (is False).
; If the solver returns 'sat', the statement is consistent with the KB (is True).
(assert (is-white bob))

; 7. Check Satisfiability
(check-sat)
(get-model)