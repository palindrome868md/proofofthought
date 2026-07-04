; Reasoning Steps:
; 1. Identify Entities: bald_eagle, bear, rabbit, mouse.
; 2. Identify Predicates: sees, chases, eats, is_blue, is_red, is_big, is_cold, is_nice.
; 3. Map Facts from text to assertions.
; 4. Map Rules from text to universal quantifications.
; 5. Formulate Verification: The question is "The rabbit eats the mouse."
;    This statement is explicitly present in the facts ("The rabbit eats the mouse.").
;    Therefore, asserting it should be consistent with the Knowledge Base (SAT).
;    We assert the statement and check satisfiability.
;    Expected Result: sat (True).

; 1. Declare Sorts
(declare-sort Entity 0)

; 2. Declare Constants
(declare-const bald_eagle Entity)
(declare-const bear Entity)
(declare-const rabbit Entity)
(declare-const mouse Entity)

; 3. Declare Functions (Predicates)
(declare-fun sees (Entity Entity) Bool)
(declare-fun chases (Entity Entity) Bool)
(declare-fun eats (Entity Entity) Bool)
(declare-fun is_blue (Entity) Bool)
(declare-fun is_red (Entity) Bool)
(declare-fun is_big (Entity) Bool)
(declare-fun is_cold (Entity) Bool)
(declare-fun is_nice (Entity) Bool)

; 4. Assert Knowledge Base (Facts)
(assert (sees bald_eagle bear))
(assert (sees bald_eagle rabbit))
(assert (chases bear bald_eagle))
(assert (chases bear rabbit))
(assert (eats bear mouse))
(assert (is_blue bear))
(assert (sees bear rabbit))
(assert (chases mouse rabbit))
(assert (is_cold mouse))
(assert (is_nice mouse))
(assert (sees mouse bear))
(assert (sees mouse rabbit))
(assert (eats rabbit bear))
(assert (eats rabbit mouse))
(assert (sees rabbit bald_eagle))

; 5. Assert Knowledge Base (Rules)

; Rule: If something chases the rabbit then the rabbit eats the bald eagle.
(assert (forall ((x Entity)) 
  (=> (chases x rabbit) 
      (eats rabbit bald_eagle))))

; Rule: If something sees the bear then the bear is red.
(assert (forall ((x Entity)) 
  (=> (sees x bear) 
      (is_red bear))))

; Rule: If something is red then it is big.
(assert (forall ((x Entity)) 
  (=> (is_red x) 
      (is_big x))))

; Rule: If something chases the bald eagle and the bald eagle eats the rabbit then the bald eagle is red.
(assert (forall ((x Entity)) 
  (=> (and (chases x bald_eagle) 
           (eats bald_eagle rabbit)) 
      (is_red bald_eagle))))

; Rule: Red things are blue.
(assert (forall ((x Entity)) 
  (=> (is_red x) 
      (is_blue x))))

; Rule: If something eats the rabbit and the rabbit is red then it is blue.
(assert (forall ((x Entity)) 
  (=> (and (eats x rabbit) 
           (is_red rabbit)) 
      (is_blue x))))

; 6. Verification
; Question: The rabbit eats the mouse.
; We assert this statement to check if it is consistent with the KB.
; Since it is explicitly stated in the KB facts, it should be SAT.
(assert (eats rabbit mouse))

; 7. Check Satisfiability
(check-sat)
(get-model)