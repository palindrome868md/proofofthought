; -------------------------------------------------
; 1. Sort declaration
; -------------------------------------------------
(declare-sort Entity 0)

; -------------------------------------------------
; 2. Predicate (function) declarations
; -------------------------------------------------
(declare-fun chases (Entity Entity) Bool)
(declare-fun eats   (Entity Entity) Bool)
(declare-fun red    (Entity)       Bool)
(declare-fun round  (Entity)       Bool)
(declare-fun kind   (Entity)       Bool)
(declare-fun visits (Entity Entity) Bool)

; -------------------------------------------------
; 3. Constant (entity) declarations
; -------------------------------------------------
(declare-const cow    Entity)
(declare-const dog    Entity)
(declare-const rabbit Entity)
(declare-const mouse  Entity)

; -------------------------------------------------
; 4. Knowledge base (facts)
; -------------------------------------------------
(assert (chases cow rabbit))
(assert (eats   cow dog))
(assert (red    cow))
(assert (round  cow))

(assert (chases dog cow))
(assert (chases dog rabbit))
(assert (eats   dog mouse))
(assert (kind   dog))

(assert (eats   mouse cow))

(assert (not (chases rabbit cow)))   ; rabbit does not chase the cow
(assert (eats   rabbit cow))
(assert (kind   rabbit))

; -------------------------------------------------
; 5. Universal rules (implications)
; -------------------------------------------------
; If someone chases the cow then the cow eats the mouse.
(assert (forall ((x Entity))
          (=> (chases x cow)
              (eats cow mouse))))

; If the dog does not visit the cow then the dog is not round.
(assert (=> (not (visits dog cow))
            (not (round dog))))

; If someone chases the cow then they chase the rabbit.
(assert (forall ((x Entity))
          (=> (chases x cow)
              (chases x rabbit))))

; -------------------------------------------------
; 6. Test the query: "The cow eats the dog."
; -------------------------------------------------
(assert (eats cow dog))

; -------------------------------------------------
; 7. Check satisfiability (one check-sat only)
; -------------------------------------------------
(check-sat)
(get-model)