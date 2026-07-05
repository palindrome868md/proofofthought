(declare-sort Person 0)

; Individuals
(declare-const alan Person)
(declare-const dave Person)
(declare-const fred Person)

; Predicates
(declare-fun rough (Person) Bool)
(declare-fun kind (Person) Bool)
(declare-fun cold (Person) Bool)
(declare-fun blue (Person) Bool)
(declare-fun young (Person) Bool)
(declare-fun round (Person) Bool)
(declare-fun red (Person) Bool)
(declare-fun nice (Person) Bool)
(declare-fun green (Person) Bool)
(declare-fun big (Person) Bool)
(declare-fun pretty (Person) Bool)
(declare-fun trust (Person) Bool)

; Facts about individuals
(assert (rough alan))
(assert (kind alan))
(assert (cold alan))
(assert (blue alan))
(assert (young alan))

(assert (nice dave))

(assert (round fred))
(assert (kind fred))

; Rules / Knowledge base
; 1) Round and young -> red and cold
(assert
 (forall ((p Person))
   (=> (and (round p) (young p))
       (and (red p) (cold p)))))

; 2) Nice and blue and rough -> young and not trust
(assert
 (forall ((p Person))
   (=> (and (nice p) (blue p) (rough p))
       (and (young p) (not (trust p))))))

; 3) Young and kind -> red
(assert
 (forall ((p Person))
   (=> (and (young p) (kind p)) (red p))))

; 4) Cold and rough and red -> kind
(assert
 (forall ((p Person))
   (=> (and (cold p) (rough p) (red p)) (kind p))))

; 5) Young and big and blue -> cold
(assert
 (forall ((p Person))
   (=> (and (young p) (big p) (blue p)) (cold p))))

; 6) Round and kind -> young and pretty
(assert
 (forall ((p Person))
   (=> (and (round p) (kind p)) (and (young p) (pretty p)))))

; 7) Cold and nice and green -> kind
(assert
 (forall ((p Person))
   (=> (and (cold p) (nice p) (green p)) (kind p))))

; Test: Fred is not young
(assert (not (young fred)))

(check-sat)
(get-model)