;-------------------------------------------------
; 1. Declare the uninterpreted sort for all objects
;-------------------------------------------------
(declare-sort Entity 0)

;-------------------------------------------------
; 2. Declare predicates (functions returning Bool)
;-------------------------------------------------
(declare-fun cold  (Entity) Bool)          ; cold(x)
(declare-fun blue  (Entity) Bool)          ; blue(x)
(declare-fun chase (Entity Entity) Bool)   ; chase(x,y)
(declare-fun likes (Entity Entity) Bool)   ; likes(x,y)
(declare-fun eats  (Entity Entity) Bool)   ; eats(x,y)

;-------------------------------------------------
; 3. Declare the constants mentioned in the problem
;-------------------------------------------------
(declare-const bear   Entity)
(declare-const dog    Entity)
(declare-const lion   Entity)
(declare-const squirrel Entity)

;-------------------------------------------------
; 4. Assert the given facts
;-------------------------------------------------
(assert (cold bear))                         ; The bear is cold
(assert (not (chase dog lion)))              ; The dog does not chase the lion
(assert (not (blue lion)))                   ; The lion is not blue
(assert (likes lion squirrel))               ; The lion likes the squirrel
(assert (eats squirrel lion))                ; The squirrel eats the lion
(assert (cold squirrel))                     ; The squirrel is cold
(assert (not (likes squirrel bear)))         ; The squirrel does not like the bear

;-------------------------------------------------
; 5. Encode the two implication rules
;-------------------------------------------------
; Rule 1: If the squirrel is cold then the squirrel chases the bear
(assert (=> (cold squirrel) (chase squirrel bear)))

; Rule 2: If something chases the bear then the bear eats the squirrel
(assert (forall ((x Entity))
  (=> (chase x bear) (eats bear squirrel))))

;-------------------------------------------------
; 6. Test the statement: "The bear does not eat the squirrel."
;    We add its negation to the KB and ask Z3 whether the
;    combined set is satisfiable.
;-------------------------------------------------
(assert (not (eats bear squirrel)))   ; the claim to be verified

;-------------------------------------------------
; 7. Check satisfiability (sat = true, unsat = false)
;-------------------------------------------------
(check-sat)   ; Expected result: unsat
(get-model)   ; Optional: show a model (won't be produced because UNSAT)