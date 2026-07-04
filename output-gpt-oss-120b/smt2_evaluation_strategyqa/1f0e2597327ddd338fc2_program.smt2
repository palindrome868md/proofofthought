;-------------------------------------------------
; 1. Declare sorts
(declare-sort Animal 0)
(declare-sort Location 0)

; 2. Declare predicates
(declare-fun is-warthog (Animal) Bool)
(declare-fun on-location (Animal Location) Bool)

; 3. Declare constants
(declare-const broadway Location)   ; the place "Broadway"
(declare-const a Animal)           ; a candidate animal

; 4. Knowledge base (no restrictive facts)
; (none needed for this question)

; 5. Assert the scenario we are testing:
;    a is a warthog AND a is on Broadway
(assert (is-warthog a))
(assert (on-location a broadway))

; 6. Verify the question
(check-sat)          ; Expected result: sat  (the situation is possible)
(get-model)