;--- Declare an uninterpreted sort for all objects ---
(declare-sort Entity 0)

;--- Unary predicates (properties) ---
(declare-fun furry   (Entity) Bool)
(declare-fun white   (Entity) Bool)
(declare-fun cold    (Entity) Bool)
(declare-fun rough   (Entity) Bool)
(declare-fun smart   (Entity) Bool)
(declare-fun young   (Entity) Bool)
(declare-fun round   (Entity) Bool)

;--- Constants for the two individuals ---
(declare-const dave Entity)
(declare-const gary Entity)

;--- Given facts -------------------------------------------------
(assert (furry dave))

(assert (cold  gary))
(assert (furry gary))
(assert (rough gary))
(assert (smart gary))
(assert (white gary))
(assert (young gary))

;--- General rules ------------------------------------------------
; If something is furry and round then it is young
(assert (forall ((x Entity))
  (=> (and (furry x) (round x)) (young x))))

; Furry things are white
(assert (forall ((x Entity))
  (=> (furry x) (white x))))

; All smart things are cold
(assert (forall ((x Entity))
  (=> (smart x) (cold x))))

; If something is smart and white then it is cold
(assert (forall ((x Entity))
  (=> (and (smart x) (white x)) (cold x))))

; If something is white then it is smart
(assert (forall ((x Entity))
  (=> (white x) (smart x))))

; If something is white and smart then it is cold
(assert (forall ((x Entity))
  (=> (and (white x) (smart x)) (cold x))))

; Round and rough things are white
(assert (forall ((x Entity))
  (=> (and (round x) (rough x)) (white x))))

; Young and cold things are furry
(assert (forall ((x Entity))
  (=> (and (young x) (cold x)) (furry x))))

;--- Test the query: "Dave is white" -----------------------------
(assert (white dave))

;--- Ask Z3 -------------------------------------------------------
(check-sat)
(get-model)