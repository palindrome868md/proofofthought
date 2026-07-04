;--- Sort declaration -------------------------------------------------
(declare-sort Person 0)

;--- Predicate (function) declarations ---------------------------------
(declare-fun green (Person) Bool)
(declare-fun rough (Person) Bool)
(declare-fun smart (Person) Bool)
(declare-fun big   (Person) Bool)
(declare-fun blue  (Person) Bool)
(declare-fun quiet (Person) Bool)
(declare-fun furry (Person) Bool)

;--- Individual constants ----------------------------------------------
(declare-const bob   Person)
(declare-const dave  Person)
(declare-const fiona Person)

;--- Facts -------------------------------------------------------------
(assert (green bob))
(assert (rough bob))
(assert (smart bob))

(assert (big   dave))
(assert (blue  dave))
(assert (quiet dave))
(assert (rough dave))
(assert (smart dave))

(assert (rough fiona))
(assert (smart fiona))

;--- General rules -----------------------------------------------------

; If someone is smart and big then they are blue.
(assert (forall ((x Person))
  (=> (and (smart x) (big x))
      (blue x))))

; All smart people are furry.
(assert (forall ((x Person))
  (=> (smart x)
      (furry x))))

; Rough, green people are big.
(assert (forall ((x Person))
  (=> (and (rough x) (green x))
      (big x))))

; All green, rough people are smart.  (redundant but kept)
(assert (forall ((x Person))
  (=> (and (green x) (rough x))
      (smart x))))

; If someone is blue and rough then they are quiet.
(assert (forall ((x Person))
  (=> (and (blue x) (rough x))
      (quiet x))))

; Bob‑specific rule: If Bob is blue and Bob is smart then Bob is big.
(assert (=> (and (blue bob) (smart bob))
            (big bob)))

; All quiet people are big.
(assert (forall ((x Person))
  (=> (quiet x)
      (big x))))

; If someone is big then they are furry.
(assert (forall ((x Person))
  (=> (big x)
      (furry x))))

;--- Query: "Bob is not furry." ----------------------------------------
(assert (not (furry bob)))

;--- Check the result --------------------------------------------------
(check-sat)
(get-model)