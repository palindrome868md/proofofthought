; Question: Would a geographer use biochemistry in their work?
; This tests whether using biochemistry is consistent with being a geographer

; Declare sorts
(declare-sort Person 0)
(declare-sort Discipline 0)

; Declare functions
(declare-fun has-profession (Person Discipline) Bool)
(declare-fun uses-in-work (Person Discipline) Bool)
(declare-fun is-core-tool (Discipline Discipline) Bool)

; Declare constants
(declare-const geographer Person)
(declare-const geography Discipline)
(declare-const biochemistry Discipline)

; Knowledge base: This person is a geographer
(assert (has-profession geographer geography))

; Geography is a core tool for geographers
(assert (is-core-tool geography geography))

; Biochemistry is NOT a core tool for geography (it's for biochemistry/biology fields)
(assert (not (is-core-tool geography biochemistry)))

; Rule: Professionals use their core tools in their work
(assert (forall ((p Person) (d1 Discipline) (d2 Discipline))
  (=> (and (has-profession p d1)
           (is-core-tool d1 d2))
      (uses-in-work p d2))))

; Rule: Professionals typically don't use non-core tools as primary work methods
(assert (forall ((p Person) (d1 Discipline) (d2 Discipline))
  (=> (and (has-profession p d1)
           (not (is-core-tool d1 d2)))
      (not (uses-in-work p d2)))))

; Test: Would a geographer use biochemistry in their work?
(assert (uses-in-work geographer biochemistry))

; Check satisfiability
; If unsat: A geographer would NOT typically use biochemistry (answer: No)
; If sat: A geographer could use biochemistry (answer: Yes)
(check-sat)
(get-model)