; 1. Declare sorts
(declare-sort Animal 0)

; 2. Declare functions
(declare-fun chases (Animal Animal) Bool)
(declare-fun visits (Animal Animal) Bool)
(declare-fun young (Animal) Bool)
(declare-fun eats (Animal Animal) Bool)
(declare-fun kind (Animal) Bool)

; 3. Declare constants
(declare-const bear Animal)
(declare-const cat Animal)
(declare-const dog Animal)
(declare-const tiger Animal)

; 4. Assert knowledge base (facts)
(assert (chases bear cat))
(assert (visits bear tiger))
(assert (chases cat dog))
(assert (not (young cat)))
(assert (not (chases dog bear)))
(assert (eats dog bear))
(assert (visits tiger cat))

; Rules
; If something chases the cat then the cat is not kind.
(assert (forall ((x Animal))
  (=> (chases x cat) (not (kind cat)))))

; If something visits the tiger then the tiger chases the cat.
(assert (forall ((x Animal))
  (=> (visits x tiger) (chases tiger cat))))

; If the cat eats the dog and the dog chases the tiger then the tiger eats the bear.
(assert (=> (and (eats cat dog) (chases dog tiger))
            (eats tiger bear)))

; If something chases the cat then it is kind.
(assert (forall ((x Animal))
  (=> (chases x cat) (kind x))))

; If something visits the tiger and it does not eat the tiger then the tiger visits the bear.
(assert (forall ((x Animal))
  (=> (and (visits x tiger) (not (eats x tiger)))
      (visits tiger bear))))

; If something is kind then it visits the tiger.
(assert (forall ((x Animal))
  (=> (kind x) (visits x tiger))))

; 5. Check satisfiability (Question: The tiger visits the tiger)
; We assert the statement to check if it is consistent (sat) or contradictory (unsat) with the KB.
(assert (visits tiger tiger))

(check-sat)
(get-model)