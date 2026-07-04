;--- Sort declarations -------------------------------------------------------
(declare-sort Genus 0)
(declare-sort Species 0)
(declare-sort Location 0)
(declare-sort Person 0)

;--- Predicate (function) declarations ---------------------------------------
; species-of : Species × Genus → Bool
(declare-fun species-of (Species Genus) Bool)
; lives-in   : Species × Location → Bool
(declare-fun lives-in (Species Location) Bool)
; discoverer : Genus × Person → Bool
(declare-fun discoverer (Genus Person) Bool)

;--- Constant symbols --------------------------------------------------------
(declare-const Ambiortus Genus)
(declare-const Ambiortus_Dementjevi Species)
(declare-const Mongolia Location)
(declare-const Yevgeny_Kurochkin Person)

;--- Premises ---------------------------------------------------------------
; Ambiortus_Dementjevi is a species of Ambiortus
(assert (species-of Ambiortus_Dementjevi Ambiortus))

; It is the *only* known species of Ambiortus
(assert (forall ((s Species))
        (=> (species-of s Ambiortus)
            (= s Ambiortus_Dementjevi))))

; Ambiortus_Dementjevi lived in Mongolia
(assert (lives-in Ambiortus_Dementjevi Mongolia))

; Yevgeny Kurochkin discovered the genus Ambiortus
(assert (discoverer Ambiortus Yevgeny_Kurochkin))

;--- Statement to test -------------------------------------------------------
; "There exists a species of Ambiortus that does NOT live in Mongolia."
(assert (exists ((s Species))
        (and (species-of s Ambiortus)
             (not (lives-in s Mongolia)))))

;--- Check the combined theory -----------------------------------------------
(check-sat)
(get-model)