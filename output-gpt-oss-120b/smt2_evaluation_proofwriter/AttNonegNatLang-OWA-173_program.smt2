; -------------------------------------------------
; 1. Declare the uninterpreted sort for persons
; -------------------------------------------------
(declare-sort Person 0)

; -------------------------------------------------
; 2. Declare predicates (unary Boolean functions)
; -------------------------------------------------
(declare-fun young (Person) Bool)
(declare-fun rough (Person) Bool)
(declare-fun round (Person) Bool)
(declare-fun kind (Person) Bool)
(declare-fun cold (Person) Bool)
(declare-fun nice (Person) Bool)
(declare-fun red (Person) Bool)
(declare-fun green (Person) Bool)
(declare-fun big (Person) Bool)
(declare-fun blue (Person) Bool)

; -------------------------------------------------
; 3. Declare the constant persons
; -------------------------------------------------
(declare-const alan Person)
(declare-const bob Person)
(declare-const charlie Person)
(declare-const eric Person)

; -------------------------------------------------
; 4. Assert the factual knowledge base
; -------------------------------------------------
; Alan
(assert (young alan))
(assert (rough alan))
(assert (round alan))
(assert (kind alan))

; Bob
(assert (cold bob))
(assert (nice bob))
(assert (red bob))
(assert (green bob))

; Charlie
(assert (rough charlie))
(assert (red charlie))
(assert (kind charlie))

; Eric
(assert (round eric))

; -------------------------------------------------
; 5. Assert the general rules (universally quantified)
; -------------------------------------------------
; Rule 1: rough ∧ red ∧ green → blue
(assert (forall ((p Person))
  (=> (and (rough p) (red p) (green p))
      (blue p))))

; Rule 2: big ∧ round ∧ kind → rough
(assert (forall ((p Person))
  (=> (and (big p) (round p) (kind p))
      (rough p))))

; Rule 3: kind ∧ red → green
(assert (forall ((p Person))
  (=> (and (kind p) (red p))
      (green p))))

; Rule 4: kind ∧ rough → red
(assert (forall ((p Person))
  (=> (and (kind p) (rough p))
      (red p))))

; Rule 5: blue ∧ red ∧ big → cold
(assert (forall ((p Person))
  (=> (and (blue p) (red p) (big p))
      (cold p))))

; -------------------------------------------------
; 6. Test the query: "Alan is not red."
; -------------------------------------------------
(assert (not (red alan)))

; -------------------------------------------------
; 7. Run the solver
; -------------------------------------------------
(check-sat)   ; Expect unsat (the query is false)
(get-model)