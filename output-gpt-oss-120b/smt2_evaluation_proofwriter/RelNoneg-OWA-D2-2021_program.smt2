; -------------------------------------------------
; 1. Declare the domain of discourse (entities)
; -------------------------------------------------
(declare-sort Entity 0)

; -------------------------------------------------
; 2. Declare constants for the individuals
; -------------------------------------------------
(declare-const mouse  Entity)
(declare-const rabbit Entity)
(declare-const tiger  Entity)

; -------------------------------------------------
; 3. Declare predicates (as Boolean‑valued functions)
; -------------------------------------------------
(declare-fun rough  (Entity) Bool)
(declare-fun likes  (Entity Entity) Bool)
(declare-fun visits (Entity Entity) Bool)
(declare-fun red    (Entity) Bool)
(declare-fun round  (Entity) Bool)
(declare-fun nice   (Entity) Bool)
(declare-fun kind   (Entity) Bool)

; -------------------------------------------------
; 4. Assert the given facts
; -------------------------------------------------
(assert (rough mouse))
(assert (likes mouse rabbit))
(assert (likes mouse tiger))
(assert (visits mouse rabbit))

(assert (red rabbit))
(assert (round rabbit))
(assert (likes rabbit tiger))
(assert (visits rabbit tiger))

(assert (nice tiger))
(assert (rough tiger))

; -------------------------------------------------
; 5. Add the general rules
; -------------------------------------------------
; Rule: red ∧ nice → kind
(assert (forall ((x Entity))
          (=> (and (red x) (nice x))
              (kind x))))

; Rule: if something likes the rabbit then the rabbit is nice
(assert (forall ((y Entity))
          (=> (likes y rabbit)
              (nice rabbit))))

; -------------------------------------------------
; 6. Query: is the rabbit kind?
; -------------------------------------------------
(assert (kind rabbit))

; -------------------------------------------------
; 7. Ask Z3 to check satisfiability
; -------------------------------------------------
(check-sat)
(get-model)