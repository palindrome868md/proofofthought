; Declare sorts
(declare-sort Country 0)
(declare-sort War 0)

; Declare functions
(declare-fun is-neutral (Country War) Bool)
(declare-fun participated-in (Country War) Bool)
(declare-fun same-role-as (Country War Country War) Bool)

; Declare constants for countries
(declare-const switzerland Country)
(declare-const portugal Country)
(declare-const angola Country)
(declare-const guinea-bissau Country)
(declare-const mozambique Country)

; Declare constants for wars
(declare-const wwii War)
(declare-const portuguese-colonial-war War)

; Knowledge base: Switzerland's role in WWII was neutral
(assert (is-neutral switzerland wwii))
(assert (not (participated-in switzerland wwii)))

; Define what it means to share Switzerland's role (neutrality)
(assert (forall ((c1 Country) (w1 War) (c2 Country) (w2 War))
  (=> (and (is-neutral c1 w1) (is-neutral c2 w2)
           (not (participated-in c1 w1)) (not (participated-in c2 w2)))
      (same-role-as c2 w2 c1 w1))))

; Knowledge base: Countries involved in Portuguese Colonial War
; Portugal was the colonial power (participant, not neutral)
(assert (participated-in portugal portuguese-colonial-war))
(assert (not (is-neutral portugal portuguese-colonial-war)))

; African territories were fighting for independence (participants, not neutral)
(assert (participated-in angola portuguese-colonial-war))
(assert (not (is-neutral angola portuguese-colonial-war)))

(assert (participated-in guinea-bissau portuguese-colonial-war))
(assert (not (is-neutral guinea-bissau portuguese-colonial-war)))

(assert (participated-in mozambique portuguese-colonial-war))
(assert (not (is-neutral mozambique portuguese-colonial-war)))

; Test: Did any country in Portuguese Colonial War share Switzerland's neutral role?
; We assert that there EXISTS a country that was in the Portuguese Colonial War
; AND was neutral (like Switzerland in WWII)
(declare-const test-country Country)
(assert (participated-in test-country portuguese-colonial-war))
(assert (is-neutral test-country portuguese-colonial-war))
(assert (same-role-as test-country portuguese-colonial-war switzerland wwii))

; Check satisfiability
(check-sat)
(get-model)