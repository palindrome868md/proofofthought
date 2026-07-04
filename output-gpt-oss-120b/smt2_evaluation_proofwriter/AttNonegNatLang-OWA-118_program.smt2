;--- Sorts ---------------------------------------------------------
(declare-sort Person 0)

;--- Predicates ----------------------------------------------------
(declare-fun young (Person) Bool)
(declare-fun kind (Person) Bool)
(declare-fun blue (Person) Bool)
(declare-fun green (Person) Bool)
(declare-fun cold (Person) Bool)
(declare-fun big (Person) Bool)
(declare-fun nice (Person) Bool)
(declare-fun round (Person) Bool)
(declare-fun red (Person) Bool)
(declare-fun rough (Person) Bool)

;--- Constants ------------------------------------------------------
(declare-const bob Person)
(declare-const dave Person)
(declare-const fred Person)
(declare-const gary Person)

;--- Facts ---------------------------------------------------------
(assert (young bob))
(assert (kind bob))
(assert (blue bob))
(assert (green bob))
(assert (cold bob))
(assert (big bob))

(assert (nice dave))

(assert (green fred))
(assert (cold fred))

(assert (kind gary))
(assert (round gary))
(assert (green gary))

;--- Rules ----------------------------------------------------------
; nice ∧ round ∧ cold → blue
(assert (forall ((x Person))
  (=> (and (nice x) (round x) (cold x)) (blue x))))

; green ∧ big ∧ cold → nice
(assert (forall ((x Person))
  (=> (and (green x) (big x) (cold x)) (nice x))))

; kind ∧ young ∧ green → cold
(assert (forall ((x Person))
  (=> (and (kind x) (young x) (green x)) (cold x))))

; young → round
(assert (forall ((x Person))
  (=> (young x) (round x))))

; round ∧ green ∧ nice → red
(assert (forall ((x Person))
  (=> (and (round x) (green x) (nice x)) (red x))))

; rough ∧ green ∧ kind → blue
(assert (forall ((x Person))
  (=> (and (rough x) (green x) (kind x)) (blue x))))

; round ∧ red → rough
(assert (forall ((x Person))
  (=> (and (round x) (red x)) (rough x))))

;--- Query ---------------------------------------------------------
; "Bob is not red"
(assert (not (red bob)))

;--- Check ----------------------------------------------------------
(check-sat)
(get-model)