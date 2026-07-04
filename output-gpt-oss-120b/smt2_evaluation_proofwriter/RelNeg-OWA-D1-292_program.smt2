; -------------------------------------------------
;  Sort declaration
; -------------------------------------------------
(declare-sort Entity 0)

; -------------------------------------------------
;  Predicate declarations (all return Bool)
; -------------------------------------------------
(declare-fun likes   (Entity Entity) Bool)
(declare-fun visits  (Entity Entity) Bool)
(declare-fun eats    (Entity Entity) Bool)
(declare-fun young   (Entity)       Bool)
(declare-fun blue    (Entity)       Bool)
(declare-fun green   (Entity)       Bool)
(declare-fun cold    (Entity)       Bool)
(declare-fun nice    (Entity)       Bool)

; -------------------------------------------------
;  Constant (individual) declarations
; -------------------------------------------------
(declare-const lion  Entity)
(declare-const mouse Entity)
(declare-const rabbit Entity)

; -------------------------------------------------
;  Knowledge base (facts)
; -------------------------------------------------
; The lion is young.
(assert (young lion))

; The lion does not like the mouse.
(assert (not (likes lion mouse)))

; The lion likes the rabbit.
(assert (likes lion rabbit))

; The lion visits the mouse.
(assert (visits lion mouse))

; The mouse does not eat the rabbit.
(assert (not (eats mouse rabbit)))

; The mouse is blue.
(assert (blue mouse))

; The mouse is green.
(assert (green mouse))

; The mouse visits the lion.
(assert (visits mouse lion))

; The mouse visits the rabbit.
(assert (visits mouse rabbit))

; The rabbit eats the lion.
(assert (eats rabbit lion))

; The rabbit eats the mouse.
(assert (eats rabbit mouse))

; The rabbit is cold.
(assert (cold rabbit))

; The rabbit is green.
(assert (green rabbit))

; The rabbit is not nice.
(assert (not (nice rabbit)))

; The rabbit visits the lion.
(assert (visits rabbit lion))

; The rabbit does not visit the mouse.
(assert (not (visits rabbit mouse)))

; -------------------------------------------------
;  Rules (implications)
; -------------------------------------------------
; If someone likes the rabbit and the rabbit visits the mouse then they are not green.
(assert (forall ((x Entity))
        (=> (and (likes x rabbit) (visits rabbit mouse))
            (not (green x)))))

; If someone visits the mouse then the mouse visits the rabbit.
(assert (forall ((x Entity))
        (=> (visits x mouse)
            (visits mouse rabbit))))

; If someone is cold then they like the mouse.
(assert (forall ((x Entity))
        (=> (cold x)
            (likes x mouse))))

; If someone eats the mouse then the mouse likes the lion.
(assert (forall ((x Entity))
        (=> (eats x mouse)
            (likes mouse lion))))

; If someone is nice then they like the lion.
(assert (forall ((x Entity))
        (=> (nice x)
            (likes x lion))))

; If someone likes the rabbit and the rabbit eats the lion then the rabbit is green.
(assert (forall ((x Entity))
        (=> (and (likes x rabbit) (eats rabbit lion))
            (green rabbit))))

; -------------------------------------------------
;  Query: Does the rabbit like the mouse?
; -------------------------------------------------
(assert (likes rabbit mouse))

; -------------------------------------------------
;  Check the query
; -------------------------------------------------
(check-sat)
(get-model)