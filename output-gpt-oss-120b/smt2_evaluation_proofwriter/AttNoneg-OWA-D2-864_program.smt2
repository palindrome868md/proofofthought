; 1. Declare the sort representing all individuals
(declare-sort Thing 0)

; 2. Declare Boolean predicates
(declare-fun cold (Thing) Bool)
(declare-fun green (Thing) Bool)
(declare-fun kind (Thing) Bool)
(declare-fun quiet (Thing) Bool)
(declare-fun red (Thing) Bool)

; 3. Declare the constants (individuals)
(declare-const bob Thing)
(declare-const erin Thing)
(declare-const gary Thing)
(declare-const harry Thing)

; 4. Assert the explicit facts
(assert (cold bob))
(assert (green bob))
(assert (kind bob))
(assert (quiet bob))

(assert (kind erin))
(assert (quiet erin))

(assert (cold gary))
(assert (green gary))
(assert (quiet gary))
(assert (red gary))

(assert (cold harry))
(assert (red harry))

; 5. Universal rules
;    All cold things are kind
(assert (forall ((x Thing))
          (=> (cold x) (kind x))))
;    If something is kind then it is green
(assert (forall ((x Thing))
          (=> (kind x) (green x))))

; 6. Query: "Gary is kind"
(assert (kind gary))

; 7. Check satisfiability (sat ⇒ true, unsat ⇒ false)
(check-sat)
(get-model)