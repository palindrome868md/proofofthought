;--- Sorts -------------------------------------------------
(declare-sort Person 0)

;--- Predicates (properties) --------------------------------
(declare-fun blue   (Person) Bool)
(declare-fun quiet  (Person) Bool)
(declare-fun white  (Person) Bool)
(declare-fun kind   (Person) Bool)
(declare-fun nice   (Person) Bool)
(declare-fun red    (Person) Bool)
(declare-fun young  (Person) Bool)

;--- Individuals -------------------------------------------
(declare-const anne    Person)
(declare-const bob     Person)
(declare-const charlie Person)
(declare-const fiona   Person)

;--- Facts -------------------------------------------------
(assert (blue anne))
(assert (quiet anne))
(assert (white anne))

(assert (blue bob))
(assert (kind bob))
(assert (nice bob))
(assert (red bob))
(assert (young bob))

(assert (blue charlie))
(assert (quiet charlie))

(assert (blue fiona))
(assert (kind fiona))
(assert (nice fiona))
(assert (quiet fiona))
(assert (young fiona))

;--- General Rules -----------------------------------------

; 1. If something is kind then it is red.
(forall ((p Person))
  (=> (kind p) (red p)))

; 2. Red and nice things are white.
(forall ((p Person))
  (=> (and (red p) (nice p)) (white p)))

; 3. If something is blue and white then it is red.
(forall ((p Person))
  (=> (and (blue p) (white p)) (red p)))

; 4. If something is quiet and red then it is nice.
(forall ((p Person))
  (=> (and (quiet p) (red p)) (nice p)))

; 5. Blue things are white.
(forall ((p Person))
  (=> (blue p) (white p)))

; 6. All red things are young.
(forall ((p Person))
  (=> (red p) (young p)))

; 7. If something is young and white then it is kind.
(forall ((p Person))
  (=> (and (young p) (white p)) (kind p)))

; 8. Specific rule for Fiona (already entailed, but included for completeness)
(assert (=> (and (quiet fiona) (nice fiona)) (kind fiona)))

;--- Query -------------------------------------------------
; Test the statement: "Fiona is not white"
(assert (not (white fiona)))

;--- Solve -------------------------------------------------
(check-sat)
(get-model)