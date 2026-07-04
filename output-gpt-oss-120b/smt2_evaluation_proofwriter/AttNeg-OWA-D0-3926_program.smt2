; -------------------------------------------------
; 1. Declare the domain of individuals
; -------------------------------------------------
(declare-sort Entity 0)

; -------------------------------------------------
; 2. Declare unary predicates (as Bool‑valued functions)
; -------------------------------------------------
(declare-fun big   (Entity) Bool)
(declare-fun furry (Entity) Bool)
(declare-fun green (Entity) Bool)
(declare-fun rough (Entity) Bool)
(declare-fun round (Entity) Bool)
(declare-fun smart (Entity) Bool)
(declare-fun white (Entity) Bool)

; -------------------------------------------------
; 3. Declare the two individuals
; -------------------------------------------------
(declare-const bob  Entity)
(declare-const dave Entity)

; -------------------------------------------------
; 4. Assert the given facts about Bob and Dave
; -------------------------------------------------
(assert (not (big   bob)))   ; Bob is not big
(assert (furry bob))         ; Bob is furry
(assert (green bob))         ; Bob is green
(assert (rough bob))         ; Bob is rough
(assert (round bob))         ; Bob is round
(assert (smart bob))         ; Bob is smart
(assert (not (white bob)))   ; Bob is not white

(assert (big   dave))        ; Dave is big
(assert (furry dave))        ; Dave is furry
(assert (green dave))        ; Dave is green
(assert (rough dave))        ; Dave is rough
(assert (not (round dave)))  ; Dave is not round
(assert (not (smart dave)))  ; Dave is not smart
(assert (white dave))        ; Dave is white

; -------------------------------------------------
; 5. Encode the general rules (implications)
; -------------------------------------------------
; Smart + white → big
(assert (forall ((x Entity))
  (=> (and (smart x) (white x)) (big x))))

; If Dave is white then Dave is big (redundant, but included)
(assert (=> (white dave) (big dave)))

; White & not big → round
(assert (forall ((x Entity))
  (=> (and (white x) (not (big x))) (round x))))

; Big & white → not round
(assert (forall ((x Entity))
  (=> (and (big x) (white x)) (not (round x)))))

; Big & smart → round
(assert (forall ((x Entity))
  (=> (and (big x) (smart x)) (round x))))

; White → furry
(assert (forall ((x Entity))
  (=> (white x) (furry x))))

; Round & rough → furry
(assert (forall ((x Entity))
  (=> (and (round x) (rough x)) (furry x))))

; Dave round & green → furry
(assert (=> (and (round dave) (green dave)) (furry dave)))

; -------------------------------------------------
; 6. Query: Is Bob white?
; -------------------------------------------------
(assert (white bob))

; -------------------------------------------------
; 7. Solve
; -------------------------------------------------
(check-sat)   ; Expected result: unsat (Bob cannot be white)
(get-model)