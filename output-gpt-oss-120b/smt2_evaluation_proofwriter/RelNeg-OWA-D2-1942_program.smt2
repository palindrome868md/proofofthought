; Declare an uninterpreted sort for all individuals
(declare-sort Entity 0)

; Declare predicates (Boolean‑valued functions)
(declare-fun visits (Entity Entity) Bool)   ; visits(subject, object)
(declare-fun needs  (Entity Entity) Bool)   ; needs(subject, object)
(declare-fun sees   (Entity Entity) Bool)   ; sees(subject, object)
(declare-fun rough  (Entity)       Bool)   ; rough(entity)

; Declare the two concrete individuals mentioned
(declare-const mouse  Entity)
(declare-const rabbit Entity)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Knowledge base (facts)
(assert (visits mouse rabbit))   ; The mouse visits the rabbit.
(assert (needs  rabbit mouse))   ; The rabbit needs the mouse.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Rules

; 1. If the mouse visits the rabbit then the mouse needs the rabbit.
(assert (=> (visits mouse rabbit)
            (needs mouse rabbit)))

; 2. If something visits the rabbit and the rabbit sees the mouse
;    then the mouse does not see the rabbit.
(assert (forall ((x Entity))
          (=> (and (visits x rabbit)
                   (sees rabbit mouse))
              (not (sees mouse rabbit)))))

; 3. If something needs the rabbit then it is not rough.
(assert (forall ((x Entity))
          (=> (needs x rabbit)
              (not (rough x)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Query: "The rabbit does not need the mouse."
;  i.e.,  ¬needs(rabbit, mouse)
(assert (not (needs rabbit mouse)))

; Check whether the knowledge base together with the query is consistent.
(check-sat)
(get-model)