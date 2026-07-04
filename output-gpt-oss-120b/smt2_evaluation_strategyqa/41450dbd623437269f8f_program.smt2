; 1. Declare sorts
(declare-sort Person 0)
(declare-sort Item 0)

; 2. Declare predicates / functions
(declare-fun is-depressed (Person) Bool)
(declare-fun contains-MAO (Item) Bool)
(declare-fun cheer-up (Person Item) Bool)

; 3. Declare constants (the concrete individuals)
(declare-const my-friend Person)
(declare-const moa-candy Item)

; 4. Knowledge base
; The friend is depressed
(assert (is-depressed my-friend))

; The candy bar contains a mono‑amine oxidase inhibitor
(assert (contains-MAO moa-candy))

; Rule: a depressed person is cheered up by any item that contains MAO
(assert (forall ((p Person) (i Item))
  (=> (and (is-depressed p) (contains-MAO i))
      (cheer-up p i))))

; 5. Test the question: "Would the MAO candy bar cheer up the depressed friend?"
(assert (cheer-up my-friend moa-candy))

; 6. Check satisfiability (sat = True, unsat = False)
(check-sat)
(get-model)