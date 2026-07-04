; 1. Declare sorts
(declare-sort Species 0)
(declare-sort Genus 0)
(declare-sort Location 0)
(declare-sort Person 0)

; 2. Declare functions
(declare-fun belongs_to (Species Genus) Bool)
(declare-fun location (Species) Location)
(declare-fun discoverer (Genus) Person)

; 3. Declare constants
(declare-const ambiortus Genus)
(declare-const ambiortus_dementjevi Species)
(declare-const mongolia Location)
(declare-const kurochkin Person)

; 4. Assert knowledge base (facts)
; Ambiortus Dementjevi belongs to the genus Ambiortus
(assert (belongs_to ambiortus_dementjevi ambiortus))

; Ambiortus Dementjevi is the ONLY species of Ambiortus
(assert (forall ((s Species))
  (=> (belongs_to s ambiortus)
      (= s ambiortus_dementjevi))))

; The location of Ambiortus Dementjevi is Mongolia
(assert (= (location ambiortus_dementjevi) mongolia))

; The discoverer of Ambiortus is Yevgeny Kurochkin
(assert (= (discoverer ambiortus) kurochkin))

; 5. Assert the statement to verify
; Statement: All species of Ambiortus live in Mongolia
(assert (forall ((s Species))
  (=> (belongs_to s ambiortus)
      (= (location s) mongolia))))

; 6. Check satisfiability
(check-sat)
(get-model)