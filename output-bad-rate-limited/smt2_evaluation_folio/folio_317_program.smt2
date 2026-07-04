; Declare sorts
(declare-sort Community 0)
(declare-sort County 0)

; Declare constants
(declare-const ordinary Community)
(declare-const elliott-county County)

; Predicates
(declare-fun is-unincorporated (Community) Bool)
(declare-fun located-in (Community County) Bool)

; Knowledge base (premises)
(assert (is-unincorporated ordinary))
(assert (located-in ordinary elliott-county))

; Test: There exists a Community that is unincorporated and located in Elliott County
(declare-const witness Community)
(assert (and (is-unincorporated witness) (located-in witness elliott-county)))

; Check satisfiability to verify the existential statement
(check-sat)
(get-model)