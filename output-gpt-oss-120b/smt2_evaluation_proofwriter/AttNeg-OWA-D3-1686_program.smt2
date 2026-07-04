;--- Sorts ---
(declare-sort Person 0)

;--- Predicates (functions returning Bool) ---
(declare-fun cold   (Person) Bool)
(declare-fun rough  (Person) Bool)
(declare-fun kind   (Person) Bool)
(declare-fun blue   (Person) Bool)
(declare-fun round  (Person) Bool)
(declare-fun nice   (Person) Bool)

;--- Constants ---
(declare-const bob   Person)
(declare-const erin  Person)
(declare-const fiona Person)

;--- Knowledge base (facts) ---
(assert (cold bob))                ; Bob is cold
(assert (rough erin))              ; Erin is rough
(assert (kind fiona))              ; Fiona is kind

;--- Rules ---
; 1. If someone is blue then they are round.
(assert (forall ((x Person))
        (=> (blue x) (round x))))

; 2. If someone is nice then they are blue.
(assert (forall ((x Person))
        (=> (nice x) (blue x))))

; 3. All rough people are nice.
(assert (forall ((x Person))
        (=> (rough x) (nice x))))

; 4. All rough, blue people are cold.
(assert (forall ((x Person))
        (=> (and (rough x) (blue x)) (cold x))))

; 5. If Fiona is not round then Fiona is cold.
(assert (=> (not (round fiona)) (cold fiona)))

; 6. If someone is cold and rough then they are kind.
(assert (forall ((x Person))
        (=> (and (cold x) (rough x)) (kind x))))

;--- Statement to verify: "Erin is not blue" ---
(assert (not (blue erin)))

;--- Check consistency ---
(check-sat)
(get-model)