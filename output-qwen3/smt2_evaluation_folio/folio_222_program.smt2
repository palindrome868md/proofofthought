; 1. Declare sorts
(declare-sort Species 0)
(declare-sort Genus 0)
(declare-sort Location 0)
(declare-sort Person 0)

; 2. Declare functions
(declare-fun is-species-of (Species Genus) Bool)
(declare-fun lived-in (Species Location) Bool)
(declare-fun discovered-by (Genus Person) Bool)

; 3. Declare constants
(declare-const Ambiortus Genus)
(declare-const AmbiortusDementjevi Species)
(declare-const Mongolia Location)
(declare-const YevgenyKurochkin Person)
; Witness constant to test the existential claim in the statement
(declare-const candidate-species Species)

; 4. Assert knowledge base (premises)
; Premise: Ambiortus Dementjevi is a species of Ambiortus
(assert (is-species-of AmbiortusDementjevi Ambiortus))

; Premise: Ambiortus Dementjevi is the only species of Ambiortus
; (Interpreting "only known species" as unique species within the problem context)
(assert (forall ((s Species))
  (=> (is-species-of s Ambiortus)
      (= s AmbiortusDementjevi))))

; Premise: Ambiortus Dementjevi lived in Mongolia
(assert (lived-in AmbiortusDementjevi Mongolia))

; Premise: Yevgeny Kurochkin discovered Ambiortus
(assert (discovered-by Ambiortus YevgenyKurochkin))

; 5. Test the statement
; Statement: There is a species of Ambiortus that doesn't live in Mongolia.
; We assert this scenario using the candidate-species constant
(assert (is-species-of candidate-species Ambiortus))
(assert (not (lived-in candidate-species Mongolia)))

; 6. Check satisfiability
(check-sat)
(get-model)