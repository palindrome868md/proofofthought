; -------------------------------------------------
;  Declarations
; -------------------------------------------------
(declare-sort Person 0)
(declare-sort Genus 0)
(declare-sort Species 0)
(declare-sort Location 0)

; Constants for the concrete entities
(declare-const Yevgeny_Kurochkin Person)
(declare-const Ambiortus Genus)
(declare-const Ambiortus_Dementjevi Species)
(declare-const Mongolia Location)

; -------------------------------------------------
;  Predicates / Functions
; -------------------------------------------------
; Ambiortus is a bird genus
(declare-fun bird-genus (Genus) Bool)

; Ambiortus is prehistoric
(declare-fun prehistoric (Genus) Bool)

; Species belongs to a genus
(declare-fun belongs-to (Species Genus) Bool)

; Species lived in a location
(declare-fun lived-in (Species Location) Bool)

; Person discovered a genus
(declare-fun discovered (Person Genus) Bool)

; A genus that has just been described (i.e., “new”)
(declare-fun new-genus (Genus) Bool)

; -------------------------------------------------
;  Knowledge base (premises)
; -------------------------------------------------
; Premise 1: Ambiortus is a prehistoric bird genus.
(assert (bird-genus Ambiortus))
(assert (prehistoric Ambiortus))

; Premise 2: Ambiortus Dementjevi is the only known species of Ambiortus.
(assert (belongs-to Ambiortus_Dementjevi Ambiortus))

; Premise 3: Mongolia was where Ambiortus Dementjevi lived.
(assert (lived-in Ambiortus_Dementjevi Mongolia))

; Premise 4: Yevgeny Kurochkin was the discoverer of Ambiortus.
(assert (discovered Yevgeny_Kurochkin Ambiortus))

; General rule: whenever a person discovers a genus, that genus is new.
(assert (forall ((p Person) (g Genus))
        (=> (discovered p g) (new-genus g))))

; -------------------------------------------------
;  Statement to verify
; -------------------------------------------------
; “Yevgeny Kurochkin discovered a new bird genus.”
(assert (and (bird-genus Ambiortus)
             (discovered Yevgeny_Kurochkin Ambiortus)
             (new-genus Ambiortus)))

; -------------------------------------------------
;  Query
; -------------------------------------------------
(check-sat)
(get-model)