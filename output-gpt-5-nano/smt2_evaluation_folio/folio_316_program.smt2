(declare-sort Place 0)
(declare-sort County 0)

; Predicates
(declare-fun unincorporated (Place) Bool)
(declare-fun located-in-county (Place County) Bool)
(declare-fun on-route32 (Place) Bool)
(declare-fun northwest-of (Place Place) Bool)

; Constants
(declare-const ordinary Place)
(declare-const sandy-hook Place)
(declare-const elliot County)
(declare-const witness Place)

; Knowledge base
(assert (unincorporated ordinary))
(assert (located-in-county ordinary elliot))
(assert (on-route32 ordinary))
(assert (northwest-of ordinary sandy-hook))

; Test: There are no unincorporated communities along KY Route 32
(assert (and (unincorporated witness) (on-route32 witness)))

(check-sat)
(get-model)