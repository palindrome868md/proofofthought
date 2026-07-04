;--- Sorts ---------------------------------------------------------
(declare-sort Genus 0)
(declare-sort Species 0)
(declare-sort Country 0)

;--- Constants ------------------------------------------------------
(declare-const Ambiortus Genus)
(declare-const Ambiortus_Dementjevi Species)
(declare-const Mongolia Country)

;--- Relations ------------------------------------------------------
(declare-fun speciesOf (Species Genus) Bool)   ; species belongs to a genus
(declare-fun location (Species) Country)       ; where a species lived

;--- Premises -------------------------------------------------------
; Ambiortus is a genus (implicitly given by the constant declaration)

; Ambiortus Dementjevi is a species of Ambiortus
(assert (speciesOf Ambiortus_Dementjevi Ambiortus))

; It is the *only* known species of Ambiortus
(assert (forall ((s Species))
        (=> (speciesOf s Ambiortus)
            (= s Ambiortus_Dementjevi))))

; Mongolia was where Ambiortus Dementjevi lived
(assert (= (location Ambiortus_Dementjevi) Mongolia))

; (The discoverer fact is irrelevant to the query and thus omitted)

;--- Negation of the target statement (attempt to find a counter‑example) ---
(declare-const witness Species)
(assert (speciesOf witness Ambiortus))                ; witness is a species of Ambiortus
(assert (not (= (location witness) Mongolia)))        ; but does NOT live in Mongolia

;--- Check entailment -------------------------------------------------
(check-sat)   ; Expected result: unsat  (no such witness can exist)