; Sorts
(declare-sort Place 0)
(declare-sort County 0)

; Constants (representing known places and counties)
(declare-const ordinary Place)
(declare-const elliot County)
(declare-const sandyhook Place)

; Predicates
(declare-fun unincorporated (Place) Bool)
(declare-fun located-in (Place County) Bool)
(declare-fun northwest_of (Place Place) Bool)

; Knowledge base (premises)
(assert (unincorporated ordinary))
(assert (located-in ordinary elliot))
(assert (northwest_of ordinary sandyhook))

; Existential test: there exists an unincorporated community located in Elliot County
(declare-const witness Place)
(assert (and (unincorporated witness) (located-in witness elliot)))

; Check satisfiability to answer the question
(check-sat)
(get-model)