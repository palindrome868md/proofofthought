; 1. Declare Sorts
(declare-sort Person 0)
(declare-sort Genus 0)
(declare-sort Species 0)
(declare-sort Location 0)

; 2. Declare Functions
(declare-fun is_bird_genus (Genus) Bool)
(declare-fun is_species_of (Species Genus) Bool)
(declare-fun lived_in (Species Location) Bool)
(declare-fun discovered (Person Genus) Bool)
(declare-fun discovered_new_bird_genus (Person) Bool)

; 3. Declare Constants
(declare-const yevgeny_kurochkin Person)
(declare-const ambiortus Genus)
(declare-const ambiortus_dementjevi Species)
(declare-const mongolia Location)

; 4. Assert Knowledge Base (Premises)
; Ambiortus is a prehistoric bird genus
(assert (is_bird_genus ambiortus))

; Ambiortus Dementjevi is the only known species of Ambiortus
(assert (is_species_of ambiortus_dementjevi ambiortus))

; Mongolia was where Ambiortus Dementjevi lived
(assert (lived_in ambiortus_dementjevi mongolia))

; Yevgeny Kurochkin was the discoverer of Ambiortus
(assert (discovered yevgeny_kurochkin ambiortus))

; Logical Rule: Discovering a bird genus implies discovering a new bird genus
(assert (forall ((p Person) (g Genus))
  (=> (and (discovered p g) (is_bird_genus g))
      (discovered_new_bird_genus p))))

; 5. Assert Test Scenario (The Statement)
; Statement: Yevgeny Kurochkin discovered a new bird genus
(assert (discovered_new_bird_genus yevgeny_kurochkin))

; 6. Check Satisfiability
(check-sat)
(get-model)