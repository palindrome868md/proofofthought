; Sorts
(declare-sort Person 0)

; Predicates
(declare-fun red (Person) Bool)
(declare-fun young (Person) Bool)
(declare-fun white (Person) Bool)
(declare-fun quiet (Person) Bool)
(declare-fun kind (Person) Bool)
(declare-fun nice (Person) Bool)
(declare-fun cold (Person) Bool)

; Constants
(declare-const anne Person)
(declare-const charlie Person)
(declare-const erin Person)
(declare-const harry Person)

; Knowledge base
(assert red anne)                          ; Anne is red
(assert young charlie)                       ; Charlie is young
(assert (not (young erin)))                  ; Erin is not young
(assert white harry)                          ; Harry is white

; Rules
(assert (forall ((p Person)) (=> (kind p) (young p))))        ; If something is kind then young
(assert (forall ((p Person)) (=> (cold p) (young p))))        ; All cold things are young
(assert (forall ((p Person)) (=> (red p) (not (young p)))))  ; Red things are not young
(assert (=> (and (kind harry) (nice harry)) (red harry)))   ; If Harry is kind and nice then Harry is red
(assert (forall ((p Person)) (=> (white p) (quiet p))))       ; All white things are quiet
(assert (forall ((p Person)) (=> (quiet p) (red p))))         ; Quiet things are red

; Test: Erin is not young
(assert (not (young erin)))  ; (identical to the given fact, tests consistency)

(check-sat)
(get-model)