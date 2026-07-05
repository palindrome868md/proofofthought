; Sorts
(declare-sort Genus 0)
(declare-sort Species 0)
(declare-sort Place 0)
(declare-sort Person 0)

; Constants
(declare-const ambiortus-genus Genus)
(declare-const ambiortus-dementjevi Species)
(declare-const mongolia Place)
(declare-const test-species Species)
(declare-const yevgeny-kurochkin Person)

; Predicates / Functions
(declare-fun is-species-of (Species Genus) Bool)
(declare-fun lived-in (Species Place) Bool)
(declare-fun discoverer (Species) Person)

; Facts from premises
(assert (is-species-of ambiortus-dementjevi ambiortus-genus))  ; Ambiortus Dementjevi is a species of Ambiortus
(assert (lived-in ambiortus-dementjevi mongolia))            ; Ambiortus Dementjevi lived in Mongolia
(assert (= (discoverer ambiortus-dementjevi) yevgeny-kurochkin)) ; Yevgeny Kurochkin discovered Ambiortus Dementjevi

; Rule: Ambiortus has only one known species (any species of Ambiortus-genus must be Ambiortus Dementjevi)
(assert (forall ((s Species)) (=> (is-species-of s ambiortus-genus) (= s ambiortus-dementjevi))))

; Test scenario: There exists a species s of Ambiortus such that s does not live in Mongolia
(assert (is-species-of test-species ambiortus-genus))
(assert (not (lived-in test-species mongolia)))

; Check if the scenario is satisfiable given the knowledge base
(check-sat)