(declare-sort Thing 0)

(declare-const cat Thing)
(declare-const dog Thing)
(declare-const rabbit Thing)
(declare-const tiger Thing)

(declare-fun nice (Thing) Bool)
(declare-fun blue (Thing) Bool)
(declare-fun young (Thing) Bool)
(declare-fun red (Thing) Bool)

(declare-fun chases (Thing Thing) Bool)
(declare-fun visits (Thing Thing) Bool)
(declare-fun eats (Thing Thing) Bool)

; Facts
(assert (nice cat))
(assert (chases dog rabbit))
(assert (visits rabbit tiger))
(assert (nice tiger))

; Rules
(assert (=> (and (blue rabbit) (visits rabbit tiger)) (young tiger)))
(assert (=> (and (visits rabbit dog) (visits dog rabbit)) (eats rabbit cat)))
(assert (forall ((x Thing)) (=> (and (eats x rabbit) (red x)) (eats rabbit cat))))
(assert (forall ((x Thing)) (=> (and (eats x tiger) (eats x rabbit)) (visits x tiger))))
(assert (forall ((x Thing)) (=> (young x) (blue x))))
(assert (forall ((x Thing)) (=> (chases x rabbit) (blue rabbit))))
(assert (forall ((x Thing)) (=> (and (red x) (visits x cat)) (visits cat tiger))))
(assert (forall ((x Thing)) (=> (and (eats x tiger) (visits x rabbit)) (chases x dog))))

; Query: The cat is not nice.
(assert (not (nice cat)))

(check-sat)