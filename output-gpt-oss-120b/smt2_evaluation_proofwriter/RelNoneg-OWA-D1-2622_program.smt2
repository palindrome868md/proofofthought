; Declare an uninterpreted sort for all individuals
(declare-sort Entity 0)

; Declare predicates (functions returning Bool)
(declare-fun nice (Entity) Bool)
(declare-fun kind (Entity) Bool)
(declare-fun round (Entity) Bool)

(declare-fun sees   (Entity Entity) Bool)
(declare-fun chases (Entity Entity) Bool)
(declare-fun eats   (Entity Entity) Bool)

; Declare the concrete constants mentioned in the story
(declare-const cat    Entity)
(declare-const dog    Entity)
(declare-const rabbit Entity)
(declare-const lion   Entity)

; -----------------------
; Knowledge base (facts)
; -----------------------
(assert (nice cat))

(assert (sees cat dog))
(assert (chases dog rabbit))
(assert (eats   dog rabbit))
(assert (round  dog))
(assert (sees   dog lion))
(assert (sees   dog rabbit))

(assert (chases lion cat))
(assert (chases lion dog))
(assert (eats   lion cat))
(assert (eats   lion rabbit))

(assert (chases rabbit cat))
(assert (eats   rabbit cat))   ; <-- the crucial fact
(assert (eats   rabbit dog))
(assert (sees   rabbit cat))

; -----------------------
; Rules (implications)
; -----------------------
; If something eats the lion then the lion chases the rabbit.
(assert (forall ((x Entity))
        (=> (eats x lion)
            (chases lion rabbit))))

; If something chases the dog and it eats the cat then it eats the dog.
(assert (forall ((x Entity))
        (=> (and (chases x dog) (eats x cat))
            (eats x dog))))

; If something is kind then it is round.
(assert (forall ((x Entity))
        (=> (kind x) (round x))))

; -------------------------------------------------
; Test the statement: "The rabbit does not eat the cat."
; -------------------------------------------------
(assert (not (eats rabbit cat)))

; Check whether the knowledge base together with the test is consistent.
(check-sat)
(get-model)