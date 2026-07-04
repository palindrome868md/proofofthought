; Step 1: Reasoning and Decomposition
; Entities identified: bald-eagle, bear, tiger, cow.
; We define a single sort 'Animal' to represent these entities.
;
; Predicates identified:
; - eats (Animal, Animal)
; - is-rough (Animal)
; - likes (Animal, Animal)
; - needs (Animal, Animal)
; - is-cold (Animal)
; - is-kind (Animal)
;
; Facts Translation:
; 1. (eats bald-eagle bear)
; 2. (eats bald-eagle tiger)
; 3. (is-rough bald-eagle)
; 4. (likes bald-eagle bear)
; 5. (needs bald-eagle tiger)
; 6. (eats bear cow)
; 7. (eats bear tiger)
; 8. (is-cold bear)
; 9. (needs cow tiger)
; 10. (needs tiger bald-eagle)
;
; Rules Translation:
; 11. Rough implies Kind: (forall ((x Animal)) (=> (is-rough x) (is-kind x)))
; 12. Likes Bear AND Needs Tiger implies Bear Likes Bald Eagle:
;     (forall ((x Animal)) (=> (and (likes x bear) (needs x tiger)) (likes bear bald-eagle)))
; 13. Cold AND Needs Bear implies Needs Bald Eagle:
;     (forall ((x Animal)) (=> (and (is-cold x) (needs x bear)) (needs x bald-eagle)))
;
; Question Verification:
; Question: "The bald eagle needs the tiger."
; Strategy: Assert the Knowledge Base, then assert the statement (needs bald-eagle tiger).
; If (check-sat) returns 'sat', the statement is True (consistent with KB).
; If (check-sat) returns 'unsat', the statement is False (contradicts KB).
; Note: This statement is explicitly Fact #5, so we expect 'sat'.

; Step 2: SMT-LIB 2.0 Program

; 1. Declare Sorts
(declare-sort Animal 0)

; 2. Declare Constants
(declare-const bald-eagle Animal)
(declare-const bear Animal)
(declare-const tiger Animal)
(declare-const cow Animal)

; 3. Declare Functions (Predicates)
(declare-fun eats (Animal Animal) Bool)
(declare-fun is-rough (Animal) Bool)
(declare-fun likes (Animal Animal) Bool)
(declare-fun needs (Animal Animal) Bool)
(declare-fun is-cold (Animal) Bool)
(declare-fun is-kind (Animal) Bool)

; 4. Assert Knowledge Base (Facts)
(assert (eats bald-eagle bear))
(assert (eats bald-eagle tiger))
(assert (is-rough bald-eagle))
(assert (likes bald-eagle bear))
(assert (needs bald-eagle tiger))
(assert (eats bear cow))
(assert (eats bear tiger))
(assert (is-cold bear))
(assert (needs cow tiger))
(assert (needs tiger bald-eagle))

; 5. Assert Knowledge Base (Rules)
; Rule: Rough people (animals) are kind
(assert (forall ((x Animal))
  (=> (is-rough x) (is-kind x))))

; Rule: If someone likes the bear and they need the tiger then the bear likes the bald eagle
(assert (forall ((x Animal))
  (=> (and (likes x bear) (needs x tiger))
      (likes bear bald-eagle))))

; Rule: If someone is cold and they need the bear then they need the bald eagle
(assert (forall ((x Animal))
  (=> (and (is-cold x) (needs x bear))
      (needs x bald-eagle))))

; 6. Assert Question Scenario
; Question: The bald eagle needs the tiger.
(assert (needs bald-eagle tiger))

; 7. Check Satisfiability
(check-sat)
(get-model)