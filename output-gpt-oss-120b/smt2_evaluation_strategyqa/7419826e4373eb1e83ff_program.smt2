;-------------------------------------------------
;  Sorts
;-------------------------------------------------
(declare-sort Animal 0)          ; Uninterpreted sort for all animals
(declare-sort Stimulus 0)        ; Uninterpreted sort for all stimuli

;-------------------------------------------------
;  Constants (the individuals we care about)
;-------------------------------------------------
(declare-const dog Animal)       ; a particular dog
(declare-const grey_seal Animal) ; a particular grey seal
(declare-const bell Stimulus)    ; the bell stimulus

;-------------------------------------------------
;  Predicates to identify the kind of animal
;-------------------------------------------------
(declare-fun is_dog (Animal) Bool)
(declare-fun is_grey_seal (Animal) Bool)

;-------------------------------------------------
;  Function giving the (integer) time at which an animal
;  responds to a stimulus (in seconds, for example)
;-------------------------------------------------
(declare-fun response_time (Animal Stimulus) Int)

;-------------------------------------------------
;  Knowledge base
;-------------------------------------------------
; The two individuals are respectively a dog and a grey seal
(assert (is_dog dog))
(assert (is_grey_seal grey_seal))

; They are distinct individuals
(assert (distinct dog grey_seal))

; Times are non‑negative
(assert (>= (response_time dog bell) 0))
(assert (>= (response_time grey_seal bell) 0))

; General rule: any dog reacts faster to the bell than any grey seal
; (Here we instantiate the rule directly for our two constants)
(assert (< (response_time dog bell) (response_time grey_seal bell)))

;-------------------------------------------------
;  Question: "Would a dog respond to bell before Grey seal?"
;  – This is exactly the inequality we have asserted above.
;  If the constraints are consistent, the answer is True (sat).
;-------------------------------------------------
(check-sat)
(get-model)