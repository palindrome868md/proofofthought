;--- Sort declaration
(declare-sort Entity 0)

;--- Predicate declarations
(declare-fun nice  (Entity) Bool)
(declare-fun quiet (Entity) Bool)
(declare-fun red   (Entity) Bool)
(declare-fun cold  (Entity) Bool)
(declare-fun blue  (Entity) Bool)
(declare-fun round (Entity) Bool)
(declare-fun green (Entity) Bool)

;--- Constant (object) declarations
(declare-const dave  Entity)
(declare-const fiona Entity)

;--- Facts
(assert (nice dave))          ; Dave is nice
(assert (quiet fiona))        ; Fiona is quiet

;--- Rules
; 1. red ∧ cold → quiet
(assert (forall ((x Entity))
  (=> (and (red x) (cold x)) (quiet x))))

; 2. Fiona quiet ∧ Fiona blue → Fiona round
(assert (=> (and (quiet fiona) (blue fiona)) (round fiona)))

; 3. nice ∧ green → red
(assert (forall ((x Entity))
  (=> (and (nice x) (green x)) (red x))))

; 4. nice → ¬blue
(assert (forall ((x Entity))
  (=> (nice x) (not (blue x)))))

; 5. ¬blue Dave → round Dave
(assert (=> (not (blue dave)) (round dave)))

; 6. Dave red ∧ ¬round Dave → ¬quiet Dave
(assert (=> (and (red dave) (not (round dave))) (not (quiet dave))))

;--- Query: Dave is not round
(assert (not (round dave)))

;--- Check consistency
(check-sat)
(get-model)