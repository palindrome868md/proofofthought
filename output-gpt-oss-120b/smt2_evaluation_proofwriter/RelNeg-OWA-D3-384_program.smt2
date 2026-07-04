;----------------------------------------------------
; 1. Declare the uninterpreted sort for all entities
;----------------------------------------------------
(declare-sort Animal 0)

;----------------------------------------------------
; 2. Declare predicates (relations)
;----------------------------------------------------
(declare-fun chase   (Animal Animal) Bool)   ; chase(x, y)
(declare-fun visits  (Animal Animal) Bool)   ; visits(x, y)
(declare-fun eats    (Animal Animal) Bool)   ; eats(x, y)
(declare-fun young   (Animal)       Bool)   ; young(x)
(declare-fun kind    (Animal)       Bool)   ; kind(x)

;----------------------------------------------------
; 3. Declare the concrete constants
;----------------------------------------------------
(declare-const bear Animal)
(declare-const cat  Animal)
(declare-const dog  Animal)
(declare-const tiger Animal)

;----------------------------------------------------
; 4. Encode the given facts
;----------------------------------------------------
(assert (chase bear cat))                 ; The bear chases the cat.
(assert (visits bear tiger))              ; The bear visits the tiger.
(assert (chase cat dog))                  ; The cat chases the dog.
(assert (not (young cat)))                ; The cat is not young.
(assert (not (chase dog bear)))           ; The dog does not chase the bear.
(assert (eats dog bear))                  ; The dog eats the bear.
(assert (visits tiger cat))               ; The tiger visits the cat.

;----------------------------------------------------
; 5. Encode the rules (implications)
;----------------------------------------------------
; 5.1 If something chases the cat then the cat is not kind.
(assert (forall ((x Animal))
  (=> (chase x cat) (not (kind cat)))))

; 5.2 If something visits the tiger then the tiger chases the cat.
(assert (forall ((x Animal))
  (=> (visits x tiger) (chase tiger cat))))

; 5.3 If the cat eats the dog and the dog chases the tiger then the tiger eats the bear.
(assert (=> (and (eats cat dog) (chase dog tiger))
            (eats tiger bear)))

; 5.4 If something chases the cat then it is kind.
(assert (forall ((x Animal))
  (=> (chase x cat) (kind x))))

; 5.5 If something visits the tiger and it does not eat the tiger then the tiger visits the bear.
(assert (forall ((x Animal))
  (=> (and (visits x tiger) (not (eats x tiger)))
      (visits tiger bear))))

; 5.6 If something is kind then it visits the tiger.
(assert (forall ((x Animal))
  (=> (kind x) (visits x tiger))))

;----------------------------------------------------
; 6. Test the query: "The tiger visits the tiger."
;----------------------------------------------------
(assert (visits tiger tiger))

;----------------------------------------------------
; 7. Check satisfiability (sat → query can be true)
;----------------------------------------------------
(check-sat)
(get-model)