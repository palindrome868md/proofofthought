; Sorts
(declare-sort Place 0)
(declare-sort Route 0)
(declare-sort County 0)

; Predicates
(declare-fun unincorporated (Place) Bool)
(declare-fun located-on-route (Place Route) Bool)
(declare-fun located-in-county (Place County) Bool)
(declare-fun northwest-of (Place Place) Bool)

; Constants
(declare-const ordinary Place)
(declare-const KY_R32 Route)
(declare-const Elliot_County County)
(declare-const Sandy_Hook Place)

; Facts from premises
(assert (unincorporated ordinary))
(assert (located-on-route ordinary KY_R32))
(assert (located-in-county ordinary Elliot_County))
(assert (northwest-of ordinary Sandy_Hook))

; Test scenario: existence of an unincorporated community along KY Route 32
(declare-const witness Place)
(assert (and (unincorporated witness) (located-on-route witness KY_R32)))
(check-sat)
(get-model)