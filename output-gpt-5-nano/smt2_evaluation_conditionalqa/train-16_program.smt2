; Sorts
(declare-sort School 0)
(declare-sort Person 0)

; Predicates / relations
(declare-fun offered (School Person) Bool)
(declare-fun rescinds (School Person) Bool)
(declare-fun has-disability (Person) Bool)
(declare-fun reason-disability (School Person) Bool)

; Constants
(declare-const school1 School)
(declare-const child1 Person)

; Knowledge base
(assert (has-disability child1))           ; child is disabled (4-year-old with scoliosis)
(assert (offered school1 child1))           ; school offered admission to child

; Scenario to test: school rescinds offer due to disability
(assert (rescinds school1 child1))
(assert (reason-disability school1 child1))

; Ethical & legal constraint: It is unlawful to discriminate against disabled children; rescinding an offer for disability is disallowed
; For all schools s and persons p, if p has disability, is offered by s, rescinds by s, and the reason is disability, this leads to false (i.e., unsatisfiable)
(assert (forall ((s School) (p Person))
  (=> (and (has-disability p)
           (offered s p)
           (rescinds s p)
           (reason-disability s p))
      false)))

; Check whether the scenario is satisfiable under the knowledge base
(check-sat)