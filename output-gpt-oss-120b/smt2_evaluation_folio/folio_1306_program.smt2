;--- Sorts -------------------------------------------------
(declare-sort Entity 0)    ; the universe of all things mentioned

;--- Predicates (functions returning Bool) -----------------
(declare-fun Bird          (Entity) Bool)
(declare-fun Penguin       (Entity) Bool)
(declare-fun Ectothermic  (Entity) Bool)
(declare-fun Endothermic   (Entity) Bool)
(declare-fun ProducesHeat  (Entity) Bool)
(declare-fun Cat           (Entity) Bool)
(declare-fun Animal        (Entity) Bool)

;--- Constants ---------------------------------------------
(declare-const Ron   Entity)
(declare-const Henry Entity)

;--- Premises ----------------------------------------------

; 1. No birds are ectothermic.
(assert (forall ((x Entity))
        (=> (Bird x) (not (Ectothermic x)))))

; 2. All penguins are birds.
(assert (forall ((x Entity))
        (=> (Penguin x) (Bird x))))

; 3. Every animal is ectothermic or endothermic.
(assert (forall ((x Entity))
        (=> (Animal x) (or (Ectothermic x) (Endothermic x)))))

; (optional exclusivity – not required for this proof)
;(assert (forall ((x Entity))
;        (=> (Animal x) (not (and (Ectothermic x) (Endothermic x))))))

; 4. All endothermic animals produce heat within the body.
(assert (forall ((x Entity))
        (=> (Endothermic x) (ProducesHeat x))))

; 5. Ron and Henry are animals.
(assert (Animal Ron))
(assert (Animal Henry))

; 6. Ron is not a bird and does not produce heat with the body.
(assert (not (Bird Ron)))
(assert (not (ProducesHeat Ron)))

; 7. Henry is not a cat and does not produce heat with the body.
(assert (not (Cat Henry)))
(assert (not (ProducesHeat Henry)))

;--- Statement to verify -----------------------------------
; "Ron is either both a penguin and endothermic, or he is neither."
(assert (or (and (Penguin Ron) (Endothermic Ron))
            (and (not (Penguin Ron)) (not (Endothermic Ron)))))

;--- Check the result ---------------------------------------
(check-sat)      ; sat  => the statement holds given the premises
(get-model)     ; optional: shows one satisfying interpretation