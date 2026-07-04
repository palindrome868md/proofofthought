; 1. Declare sorts
(declare-sort Thing 0)

; 2. Declare functions (Predicates)
(declare-fun is-biodegradable (Thing) Bool)
(declare-fun is-environment-friendly (Thing) Bool)
(declare-fun is-woodware (Thing) Bool)
(declare-fun is-paper (Thing) Bool)
(declare-fun is-good (Thing) Bool)
(declare-fun is-bad (Thing) Bool)

; 3. Declare constants
(declare-const worksheet Thing)

; 4. Assert knowledge base (Premises)

; Premise 1: All biodegradable things are environment-friendly.
(assert (forall ((x Thing)) 
  (=> (is-biodegradable x) (is-environment-friendly x))))

; Premise 2: All woodware is biodegradable.
(assert (forall ((x Thing)) 
  (=> (is-woodware x) (is-biodegradable x))))

; Premise 3: All paper is woodware.
(assert (forall ((x Thing)) 
  (=> (is-paper x) (is-woodware x))))

; Premise 4: Nothing is a good thing and also a bad thing.
(assert (forall ((x Thing)) 
  (not (and (is-good x) (is-bad x)))))

; Premise 5: All environment-friendly things are good.
(assert (forall ((x Thing)) 
  (=> (is-environment-friendly x) (is-good x))))

; Premise 6: A worksheet is either paper or environment-friendly.
(assert (or (is-paper worksheet) (is-environment-friendly worksheet)))

; 5. Test Statement: A worksheet is not bad.
; We assert the statement to check if it is consistent (sat) or contradictory (unsat) with the KB.
(assert (not (is-bad worksheet)))

; 6. Check satisfiability
(check-sat)
(get-model)