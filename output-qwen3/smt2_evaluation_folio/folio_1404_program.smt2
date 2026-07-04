; Reasoning Steps:
; 1. Define Sort 'Thing' to represent all objects in the domain.
; 2. Define Predicates (functions returning Bool) for properties: 
;    is-biodegradable, is-environment-friendly, is-woodware, is-paper, is-good, is-bad.
; 3. Define Constant 'worksheet' of sort 'Thing'.
; 4. Encode Premises as Assertions:
;    - P1: All biodegradable things are environment-friendly.
;    - P2: All woodware is biodegradable.
;    - P3: All paper is woodware.
;    - P4: Nothing is both good and bad (Good and Bad are disjoint).
;    - P5: All environment-friendly things are good.
;    - P6: A worksheet is either paper or environment-friendly.
; 5. Encode the Statement to Test as an Assertion:
;    - "A worksheet is bad."
; 6. Check Satisfiability:
;    - If 'unsat', the statement contradicts the premises (Statement is False).
;    - If 'sat', the statement is consistent with the premises (Statement is True/Possible).
;
; Logical Deduction Preview:
;    - Case 1: Worksheet is Paper.
;      Paper -> Woodware (P3) -> Biodegradable (P2) -> Env-Friendly (P1) -> Good (P5) -> Not Bad (P4).
;    - Case 2: Worksheet is Env-Friendly.
;      Env-Friendly -> Good (P5) -> Not Bad (P4).
;    - In both cases, Worksheet is Not Bad.
;    - Asserting "Worksheet is Bad" creates a contradiction.
;    - Expected Result: unsat (Statement is False).

; 1. Declare sorts
(declare-sort Thing 0)

; 2. Declare functions (predicates)
(declare-fun is-biodegradable (Thing) Bool)
(declare-fun is-environment-friendly (Thing) Bool)
(declare-fun is-woodware (Thing) Bool)
(declare-fun is-paper (Thing) Bool)
(declare-fun is-good (Thing) Bool)
(declare-fun is-bad (Thing) Bool)

; 3. Declare constants
(declare-const worksheet Thing)

; 4. Assert knowledge base (premises)
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

; 5. Test the statement: "A worksheet is bad."
(assert (is-bad worksheet))

; 6. Check satisfiability
(check-sat)
(get-model)