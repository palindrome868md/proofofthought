; Declare sorts
(declare-sort Genus 0)
(declare-sort Species 0)
(declare-sort Person 0)

; Declare constants
(declare-const Ambiortus Genus)
(declare-const ambiortus-dementjevi Species)
(declare-const yevgeny-kurochkin Person)

; Predicates
(declare-fun is-bird-genus (Genus) Bool)
(declare-fun is-prehistoric (Genus) Bool)
(declare-fun discovered (Person Genus) Bool)
(declare-fun is-new-genus (Genus) Bool)
(declare-fun is-species-of (Genus Species) Bool)

; Knowledge base (premises)
; Ambiortus is a prehistoric bird genus.
(assert (is-bird-genus Ambiortus))
(assert (is-prehistoric Ambiortus))

; Ambiortus Dementjevi is the only known species of Ambiortus.
(assert (is-species-of Ambiortus ambiortus-dementjevi))

; Mongolia was where Ambiortus Dementjevi lived.  (not modeled explicitly; omitted for brevity)

; Yevgeny Kurochkin was the discoverer of Ambiortus.
(assert (discovered yevgeny-kurochkin Ambiortus))

; Test statement: "Yevgeny Kurochkin discovered a new bird genus."
; Introduce a witness genus g and assert it satisfies the conditions.
(declare-const test-genus Genus)
(assert (and (discovered yevgeny-kurochkin test-genus)
             (is-bird-genus test-genus)
             (is-new-genus test-genus)))

; Check satisfiability to determine the truth of the statement
(check-sat)
(get-model)