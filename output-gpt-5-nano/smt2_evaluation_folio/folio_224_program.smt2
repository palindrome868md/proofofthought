; Sorts
(declare-sort Genus 0)
(declare-sort Species 0)
(declare-sort Location 0)
(declare-sort Person 0)

; Constants
(declare-const Ambiortus Genus)
(declare-const Ambiortus_Dementjevi Species)
(declare-const Mongolia Location)
(declare-const Yevgeny_Kurochkin Person)

; Predicates / functions
(declare-fun species_of (Species) Genus)
(declare-fun lives_in (Species Location) Bool)
(declare-fun discovered_by (Species) Person)

; Knowledge base (premises)
(assert (= (species_of Ambiortus_Dementjevi) Ambiortus))  ; Ambiortus_Dementjevi is a species of Ambiortus

; Ambiortus Dementjevi is the only known species of Ambiortus
(assert (forall ((s Species))
          (=> (= (species_of s) Ambiortus)
              (= s Ambiortus_Dementjevi))))

; Mongolia was where Ambiortus Dementjevi lived
(assert (lives_in Ambiortus_Dementjevi Mongolia))

; Discoverer
(assert (= (discovered_by Ambiortus_Dementjevi) Yevgeny_Kurochkin))

; Test: All species of Ambiortus live in Mongolia
(declare-const witness Species)
(assert (= (species_of witness) Ambiortus))
(assert (not (lives_in witness Mongolia)))

; One check to determine truth value of the statement
(check-sat)