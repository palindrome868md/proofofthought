;--- 1. Sort -------------------------------------------------
(declare-sort Entity 0)

;--- 2. Predicates -------------------------------------------
(declare-fun round (Entity) Bool)
(declare-fun smart (Entity) Bool)
(declare-fun white (Entity) Bool)
(declare-fun young (Entity) Bool)
(declare-fun green (Entity) Bool)
(declare-fun red   (Entity) Bool)
(declare-fun big   (Entity) Bool)

;--- 3. Constants --------------------------------------------
(declare-const bob Entity)
(declare-const charlie Entity)

;--- 4. Facts ------------------------------------------------
(assert (round bob))
(assert (smart bob))
(assert (white bob))
(assert (young bob))

(assert (green charlie))
(assert (smart charlie))
(assert (white charlie))

;--- 5. General Rules ----------------------------------------
; Red things are big
(assert (forall ((x Entity)) (=> (red x) (big x))))

; If Bob is red then Bob is white
(assert (=> (red bob) (white bob)))

; Young, red things are white
(assert (forall ((x Entity)) (=> (and (young x) (red x)) (white x))))

; All white things are green
(assert (forall ((x Entity)) (=> (white x) (green x))))

; If Bob is green then Bob is red
(assert (=> (green bob) (red bob)))

; All smart things are green
(assert (forall ((x Entity)) (=> (smart x) (green x))))

;--- 6. Query: "Bob is smart?" -------------------------------
(assert (smart bob))

;--- 7. Solve ------------------------------------------------
(check-sat)
(get-model)