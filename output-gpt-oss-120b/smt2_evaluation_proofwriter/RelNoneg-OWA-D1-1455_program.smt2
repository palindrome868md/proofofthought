;--- 1. Declare the domain of discourse ---------------------------------
(declare-sort Entity 0)

;--- 2. Declare predicates ------------------------------------------------
(declare-fun eats   (Entity Entity) Bool)
(declare-fun likes  (Entity Entity) Bool)
(declare-fun needs  (Entity Entity) Bool)
(declare-fun rough  (Entity)       Bool)
(declare-fun cold   (Entity)       Bool)
(declare-fun kind   (Entity)       Bool)

;--- 3. Declare the concrete individuals ---------------------------------
(declare-const baldEagle Entity)
(declare-const bear      Entity)
(declare-const tiger     Entity)
(declare-const cow       Entity)

;--- 4. Knowledge base (facts) -------------------------------------------
(assert (eats   baldEagle bear))
(assert (eats   baldEagle tiger))
(assert (rough  baldEagle))
(assert (likes  baldEagle bear))
(assert (needs  baldEagle tiger))

(assert (eats   bear cow))
(assert (eats   bear tiger))
(assert (cold   bear))

(assert (needs  cow tiger))
(assert (needs  tiger baldEagle))

;--- 5. General rules -----------------------------------------------------
; Rough people are kind
(assert (forall ((x Entity))
          (=> (rough x) (kind x))))

; If someone likes the bear and they need the tiger then the bear likes the bald eagle
(assert (forall ((x Entity))
          (=> (and (likes x bear) (needs x tiger))
              (likes bear baldEagle))))

; If someone is cold and they need the bear then they need the bald eagle
(assert (forall ((x Entity))
          (=> (and (cold x) (needs x bear))
              (needs x baldEagle))))

;--- 6. Test the queried statement ----------------------------------------
; The question: "The bald eagle needs the tiger."
(assert (needs baldEagle tiger))

;--- 7. Check satisfiability ---------------------------------------------
(check-sat)
(get-model)