;--- 1. Declare the domain sort
(declare-sort Entity 0)

;--- 2. Declare predicates (properties)
(declare-fun red   (Entity) Bool)
(declare-fun rough (Entity) Bool)
(declare-fun smart (Entity) Bool)
(declare-fun big   (Entity) Bool)
(declare-fun blue  (Entity) Bool)
(declare-fun young (Entity) Bool)
(declare-fun kind  (Entity) Bool)

;--- 3. Declare the individuals
(declare-const bob     Entity)
(declare-const charlie Entity)

;--- 4. Assert the explicit facts
(assert (red bob))
(assert (rough bob))
(assert (smart charlie))

;--- 5. Encode the rules

; All big things are blue
(assert (forall ((x Entity)) (=> (big x) (blue x))))

; If Charlie is big then Charlie is rough
(assert (=> (big charlie) (rough charlie)))

; If Bob is kind and Bob is big then Bob is young
(assert (=> (and (kind bob) (big bob)) (young bob)))

; If Bob is young then Bob is big
(assert (=> (young bob) (big bob)))

; All blue things are young
(assert (forall ((x Entity)) (=> (blue x) (young x))))

; If something is red then it is blue
(assert (forall ((x Entity)) (=> (red x) (blue x))))

; All smart things are kind
(assert (forall ((x Entity)) (=> (smart x) (kind x))))

; If Charlie is smart then Charlie is kind
(assert (=> (smart charlie) (kind charlie)))

;--- 6. Query: Bob is rough
(assert (rough bob))

;--- 7. Check satisfiability (sat = true, unsat = false)
(check-sat)
(get-model)