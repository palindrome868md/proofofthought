; ------------------------------------------------------------
; Sorts
(declare-sort Person 0)        ; Uninterpreted sort for historical people

; ------------------------------------------------------------
; Constants (the two figures we compare)
(declare-const genghis-khan Person)
(declare-const julius-caesar Person)

; ------------------------------------------------------------
; Function: number of living people today who are related to a Person
(declare-fun num-related (Person) Int)

; ------------------------------------------------------------
; Knowledge base: estimated descendant counts
(assert (= (num-related genghis-khan) 16000000))   ; ~16 million
(assert (= (num-related julius-caesar) 5000))      ; a few thousand

; ------------------------------------------------------------
; Test the claim: "more people today are related to Genghis Khan
; than to Julius Caesar"
(assert (> (num-related genghis-khan) (num-related julius-caesar)))

; ------------------------------------------------------------
; Query
(check-sat)      ; Expected result: sat  (the claim is true)
(get-model)      ; Optional: shows a model satisfying the assertions