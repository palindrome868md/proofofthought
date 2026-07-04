; 1. Declare sorts
(declare-sort Entity 0)

; 2. Declare functions
(declare-fun sees (Entity Entity) Bool)
(declare-fun visits (Entity Entity) Bool)
(declare-fun rough (Entity) Bool)
(declare-fun blue (Entity) Bool)
(declare-fun needs (Entity Entity) Bool)
(declare-fun nice (Entity) Bool)

; 3. Declare constants
(declare-const bald_eagle Entity)
(declare-const cow Entity)
(declare-const tiger Entity)
(declare-const cat Entity)

; 4. Assert knowledge base (facts)
(assert (sees bald_eagle cow))
(assert (not (sees bald_eagle tiger)))
(assert (not (visits bald_eagle tiger)))
(assert (not (rough cat)))
(assert (not (visits cow bald_eagle)))
(assert (blue tiger))
(assert (rough tiger))
(assert (needs tiger bald_eagle))
(assert (needs tiger cat))
(assert (sees tiger bald_eagle))
(assert (visits tiger cat))
(assert (visits tiger cow))

; 5. Assert rules
; Rule: If something visits the tiger and the tiger visits the bald eagle then the tiger does not visit the cow.
; Logical form: forall x, (visits(x, tiger) AND visits(tiger, bald_eagle)) => NOT visits(tiger, cow)
(assert (forall ((x Entity)) 
  (=> (and (visits x tiger) (visits tiger bald_eagle)) 
      (not (visits tiger cow)))))

; Rule: If something needs the tiger and the tiger sees the cat then the tiger sees the bald eagle.
; Logical form: forall x, (needs(x, tiger) AND sees(tiger, cat)) => sees(tiger, bald_eagle)
(assert (forall ((x Entity)) 
  (=> (and (needs x tiger) (sees tiger cat)) 
      (sees tiger bald_eagle))))

; Rule: If something is blue then it sees the tiger.
(assert (forall ((x Entity)) 
  (=> (blue x) (sees x tiger))))

; Rule: If something needs the cat then it is nice.
(assert (forall ((x Entity)) 
  (=> (needs x cat) (nice x))))

; Rule: If something is nice then it needs the cow.
(assert (forall ((x Entity)) 
  (=> (nice x) (needs x cow))))

; Rule: If something needs the bald eagle then it visits the bald eagle.
(assert (forall ((x Entity)) 
  (=> (needs x bald_eagle) (visits x bald_eagle))))

; Rule: If something needs the cow then the cow needs the cat.
(assert (forall ((x Entity)) 
  (=> (needs x cow) (needs cow cat))))

; 6. Test: The tiger visits the bald eagle.
; Based on Fact (needs tiger bald_eagle) and Rule (needs x bald_eagle => visits x bald_eagle),
; this should be consistent (sat).
(assert (visits tiger bald_eagle))

; 7. Check satisfiability
(check-sat)
(get-model)