;-------------------------------------------------
; 1. Declare the uninterpreted sort for entities
;-------------------------------------------------
(declare-sort Entity 0)

;-------------------------------------------------
; 2. Declare predicates (Boolean functions)
;-------------------------------------------------
(declare-fun green (Entity) Bool)
(declare-fun rough (Entity) Bool)
(declare-fun smart (Entity) Bool)
(declare-fun blue  (Entity) Bool)
(declare-fun furry (Entity) Bool)
(declare-fun nice  (Entity) Bool)
(declare-fun red   (Entity) Bool)

;-------------------------------------------------
; 3. Declare the two individuals
;-------------------------------------------------
(declare-const fiona Entity)
(declare-const gary  Entity)

;-------------------------------------------------
; 4. Assert the explicit facts
;-------------------------------------------------
(assert (green fiona))
(assert (rough fiona))
(assert (smart fiona))

(assert (blue gary))
(assert (furry gary))
(assert (nice gary))
(assert (red gary))

;-------------------------------------------------
; 5. Encode the universal rules
;-------------------------------------------------
; All rough, green things are nice.
(assert (forall ((x Entity))
  (=> (and (rough x) (green x)) (nice x))))

; All nice things are rough.
(assert (forall ((x Entity))
  (=> (nice x) (rough x))))

; Blue things are red.
(assert (forall ((x Entity))
  (=> (blue x) (red x))))

; If something is green and blue then it is nice.
(assert (forall ((x Entity))
  (=> (and (green x) (blue x)) (nice x))))

; All blue, red things are furry.
(assert (forall ((x Entity))
  (=> (and (blue x) (red x)) (furry x))))

; Red, rough things are blue.
(assert (forall ((x Entity))
  (=> (and (red x) (rough x)) (blue x))))

; Green, furry things are blue.
(assert (forall ((x Entity))
  (=> (and (green x) (furry x)) (blue x))))

; If Fiona is green then Fiona is red.
(assert (=> (green fiona) (red fiona)))

;-------------------------------------------------
; 6. Test the statement: "Fiona is not blue."
;-------------------------------------------------
(assert (not (blue fiona)))

;-------------------------------------------------
; 7. Check satisfiability (sat = statement could be true,
;    unsat = statement contradicts the knowledge base)
;-------------------------------------------------
(check-sat)
(get-model)