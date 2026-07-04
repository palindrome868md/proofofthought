;--- Sort declaration -------------------------------------------------
(declare-sort Person 0)

;--- Predicate (unary function) declarations ---------------------------
(declare-fun round (Person) Bool)
(declare-fun kind (Person) Bool)
(declare-fun young (Person) Bool)
(declare-fun cold (Person) Bool)
(declare-fun rough (Person) Bool)
(declare-fun green (Person) Bool)
(declare-fun nice (Person) Bool)
(declare-fun red (Person) Bool)
(declare-fun big (Person) Bool)
(declare-fun blue (Person) Bool)

;--- Constant (individual) declarations --------------------------------
(declare-const alan Person)
(declare-const dave Person)
(declare-const gary Person)
(declare-const harry Person)

;--- Facts -------------------------------------------------------------
(assert (round alan))
(assert (kind alan))

(assert (round dave))
(assert (kind dave))

(assert (young gary))
(assert (round gary))
(assert (cold gary))

(assert (young harry))
(assert (rough harry))
(assert (green harry))
(assert (cold harry))
(assert (nice harry))

;--- General rules -----------------------------------------------------

; 1. Red ⇒ kind ∧ young
(assert (forall ((p Person))
  (=> (red p) (and (kind p) (young p)))))

; 2. young ∧ rough ∧ round ⇒ kind
(assert (forall ((p Person))
  (=> (and (young p) (rough p) (round p)) (kind p))))

; 3. nice ∧ rough ⇒ big
(assert (forall ((p Person))
  (=> (and (nice p) (rough p)) (big p))))

; 4. big ∧ round ⇒ red
(assert (forall ((p Person))
  (=> (and (big p) (round p)) (red p))))

; 5. red ∧ nice ⇒ blue
(assert (forall ((p Person))
  (=> (and (red p) (nice p)) (blue p))))

; 6. cold ∧ rough ∧ red ⇒ kind
(assert (forall ((p Person))
  (=> (and (cold p) (rough p) (red p)) (kind p))))

; 7. young ∧ big ∧ rough ⇒ round
(assert (forall ((p Person))
  (=> (and (young p) (big p) (rough p)) (round p))))

;--- Query: is Harry big? ---------------------------------------------
(assert (big harry))

(check-sat)
(get-model)