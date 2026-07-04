;--- Sort declaration
(declare-sort Person 0)

;--- Predicate declarations
(declare-fun big   (Person) Bool)
(declare-fun blue  (Person) Bool)
(declare-fun red   (Person) Bool)
(declare-fun young (Person) Bool)
(declare-fun nice  (Person) Bool)
(declare-fun kind  (Person) Bool)
(declare-fun round (Person) Bool)

;--- Individual constants
(declare-const anne    Person)
(declare-const charlie Person)
(declare-const dave    Person)
(declare-const erin    Person)

;--- Given facts
(assert (big anne))                       ; Anne is big
(assert (not (blue charlie)))             ; Charlie is not blue
(assert (kind dave))                      ; Dave is kind
(assert (not (big erin)))                 ; Erin is not big

;--- Rules
; If someone is red then they are not young
(assert (forall ((x Person))
  (=> (red x) (not (young x)))))

; If someone is nice then they are blue
(assert (forall ((x Person))
  (=> (nice x) (blue x))))

; If someone is kind and not round then they are blue
(assert (forall ((x Person))
  (=> (and (kind x) (not (round x))) (blue x))))

; Big and blue people are red
(assert (forall ((x Person))
  (=> (and (big x) (blue x)) (red x))))

; All big people are red
(assert (forall ((x Person))
  (=> (big x) (red x))))

; Kind people are big
(assert (forall ((x Person))
  (=> (kind x) (big x))))

;--- Test the query: "Anne is not big"
(assert (not (big anne)))

;--- Check consistency
(check-sat)
(get-model)