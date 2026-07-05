; Declare sorts
(declare-sort Entity 0)

; Declare constants
(declare-const bear Entity)
(declare-const cat Entity)
(declare-const dog Entity)
(declare-const tiger Entity)

; Declare predicates
(declare-fun chases (Entity Entity) Bool)
(declare-fun visits (Entity Entity) Bool)
(declare-fun eats (Entity Entity) Bool)
(declare-fun young (Entity) Bool)
(declare-fun kind (Entity) Bool)

; Knowledge base
(assert (chases bear cat))
(assert (visits bear tiger))
(assert (chases cat dog))
(assert (not (young cat)))
(assert (not (chases dog bear)))
(assert (eats dog bear))
(assert (visits tiger cat))

; Rules
; 1) If something chases the cat then the cat is not kind
(assert (forall ((x Entity))
  (=> (chases x cat)
      (not (kind cat)))))

; 2) If something visits the tiger then the tiger chases the cat
(assert (forall ((x Entity))
  (=> (visits x tiger)
      (chases tiger cat))))

; 3) If the cat eats the dog and the dog chases the tiger then the tiger eats the bear
(assert (=> (and (eats cat dog) (chases dog tiger)) (eats tiger bear)))

; 4) If something chases the cat then it is kind
(assert (forall ((x Entity))
  (=> (chases x cat)
      (kind x))))

; 5) If something visits the tiger and it does not eat the tiger then the tiger visits the bear
(assert (forall ((x Entity))
  (=> (and (visits x tiger) (not (eats x tiger)))
      (visits tiger bear))))

; 6) If something is kind then it visits the tiger
(assert (forall ((x Entity))
  (=> (kind x)
      (visits x tiger))))

; Query: The tiger visits the tiger
(assert (visits tiger tiger))

; Check satisfiability
(check-sat)