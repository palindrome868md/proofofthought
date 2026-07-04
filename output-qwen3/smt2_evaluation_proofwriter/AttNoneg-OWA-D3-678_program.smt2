; Reasoning Steps:
; 1. Identify Entities: Fiona, Gary. Sort: Thing.
; 2. Identify Properties: Green, Rough, Smart, Blue, Furry, Nice, Red.
; 3. Extract Facts:
;    - Fiona: Green, Rough, Smart.
;    - Gary: Blue, Furry, Nice, Red.
; 4. Extract Rules:
;    - R1: forall x. (Rough(x) & Green(x)) -> Nice(x)
;    - R2: forall x. Nice(x) -> Rough(x)
;    - R3: forall x. Blue(x) -> Red(x)
;    - R4: forall x. (Green(x) & Blue(x)) -> Nice(x)
;    - R5: forall x. (Blue(x) & Red(x)) -> Furry(x)
;    - R6: forall x. (Red(x) & Rough(x)) -> Blue(x)
;    - R7: forall x. (Green(x) & Furry(x)) -> Blue(x)
;    - R8: Green(Fiona) -> Red(Fiona)
; 5. Logical Deduction for Fiona:
;    - Fact: Green(Fiona) is True.
;    - Rule R8: Since Green(Fiona), Red(Fiona) is True.
;    - Fact: Rough(Fiona) is True.
;    - Rule R6: Since Red(Fiona) & Rough(Fiona), Blue(Fiona) must be True.
; 6. Verify Question: "Fiona is not blue."
;    - This contradicts the deduction (Blue(Fiona) is True).
;    - We assert (not (is-blue fiona)) and check for satisfiability.
;    - Expected result: unsat (False).

; 1. Declare sorts
(declare-sort Thing 0)

; 2. Declare functions (predicates)
(declare-fun is-green (Thing) Bool)
(declare-fun is-rough (Thing) Bool)
(declare-fun is-smart (Thing) Bool)
(declare-fun is-blue (Thing) Bool)
(declare-fun is-furry (Thing) Bool)
(declare-fun is-nice (Thing) Bool)
(declare-fun is-red (Thing) Bool)

; 3. Declare constants
(declare-const fiona Thing)
(declare-const gary Thing)

; 4. Assert knowledge base (facts)
; Fiona facts
(assert (is-green fiona))
(assert (is-rough fiona))
(assert (is-smart fiona))

; Gary facts
(assert (is-blue gary))
(assert (is-furry gary))
(assert (is-nice gary))
(assert (is-red gary))

; 5. Assert Rules
; All rough, green things are nice
(assert (forall ((x Thing)) (=> (and (is-rough x) (is-green x)) (is-nice x))))

; All nice things are rough
(assert (forall ((x Thing)) (=> (is-nice x) (is-rough x))))

; Blue things are red
(assert (forall ((x Thing)) (=> (is-blue x) (is-red x))))

; If something is green and blue then it is nice
(assert (forall ((x Thing)) (=> (and (is-green x) (is-blue x)) (is-nice x))))

; All blue, red things are furry
(assert (forall ((x Thing)) (=> (and (is-blue x) (is-red x)) (is-furry x))))

; Red, rough things are blue
(assert (forall ((x Thing)) (=> (and (is-red x) (is-rough x)) (is-blue x))))

; Green, furry things are blue
(assert (forall ((x Thing)) (=> (and (is-green x) (is-furry x)) (is-blue x))))

; If Fiona is green then Fiona is red
(assert (=> (is-green fiona) (is-red fiona)))

; 6. Verification: Test the claim "Fiona is not blue"
; If this assertion leads to 'unsat', the claim is False (Fiona IS blue).
; If this assertion leads to 'sat', the claim is Possible/True.
(assert (not (is-blue fiona)))

; 7. Check satisfiability
(check-sat)
(get-model)