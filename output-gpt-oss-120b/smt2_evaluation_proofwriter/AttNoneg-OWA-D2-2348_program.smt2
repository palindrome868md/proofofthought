;------------------------------
; 1. Sort declaration
;------------------------------
(declare-sort Entity 0)

;------------------------------
; 2. Predicate (function) declarations
;------------------------------
(declare-fun cold   (Entity) Bool)
(declare-fun quiet  (Entity) Bool)
(declare-fun green  (Entity) Bool)
(declare-fun kind   (Entity) Bool)
(declare-fun furry  (Entity) Bool)
(declare-fun big    (Entity) Bool)
(declare-fun blue   (Entity) Bool)

;------------------------------
; 3. Constant for Dave
;------------------------------
(declare-const dave Entity)

;------------------------------
; 4. Knowledge base (facts & rules)
;------------------------------

; Fact: Dave is cold
(assert (cold dave))

; Rule: cold -> quiet
(assert (forall ((x Entity))
  (=> (cold x) (quiet x))))

; Rule: quiet -> green
(assert (forall ((x Entity))
  (=> (quiet x) (green x))))

; Rule: (cold ∧ kind) -> furry   (specific to Dave)
(assert (=> (and (cold dave) (kind dave))
            (furry dave)))

; Rule: (kind ∧ cold) -> big    (specific to Dave)
(assert (=> (and (kind dave) (cold dave))
            (big dave)))

; Rule: (cold ∧ green) -> blue
(assert (forall ((x Entity))
  (=> (and (cold x) (green x)) (blue x))))

; Rule: kind -> big
(assert (forall ((x Entity))
  (=> (kind x) (big x))))

;------------------------------
; 5. Query: Dave is quiet
;------------------------------
(assert (quiet dave))

;------------------------------
; 6. Solve
;------------------------------
(check-sat)
(get-model)