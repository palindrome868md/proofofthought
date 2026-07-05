; Sorts
(declare-sort Person 0)

; Constants
(declare-const parent Person)
(declare-const child  Person)

; Predicates (knowledge base)
(declare-fun is-parent (Person Person) Bool)
(declare-fun under-16 (Person) Bool)
(declare-fun in-gb (Person) Bool)
(declare-fun six-month-gb (Person) Bool)
(declare-fun habitual-resident (Person) Bool)
(declare-fun needs-extra-look-after (Person) Bool)
(declare-fun not-subject-to-immigration (Person) Bool)

; Derived/goal predicate
(declare-fun eligible-dla (Person) Bool)

; Knowledge base (scenario)
(assert (is-parent parent child))
(assert (under-16 child))
(assert (in-gb child))
(assert (six-month-gb child))
(assert (habitual-resident child))
(assert (needs-extra-look-after child))
(assert (not-subject-to-immigration child))

; DLA eligibility rule: if all conditions are met, child is eligible
(assert (forall ((p Person) (c Person))
  (=> (and (is-parent p c)
           (under-16 c)
           (in-gb c)
           (six-month-gb c)
           (habitual-resident c)
           (needs-extra-look-after c)
           (not-subject-to-immigration c))
      (eligible-dla c))))

; Test scenario: "Can I claim DLA for this child?"
; We test negation to see if the knowledge base entails eligibility.
(assert (not (eligible-dla child)))

; Check satisfiability (exactly one check-sat)
(check-sat)
(get-model)