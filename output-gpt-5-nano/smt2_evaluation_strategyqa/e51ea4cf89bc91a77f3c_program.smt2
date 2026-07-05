; Sorts
(declare-sort Country 0)

; Constants: countries involved in the Portuguese Colonial War (as per modeling)
(declare-const portugal Country)
(declare-const angola Country)
(declare-const mozambique Country)
(declare-const guinea_bissau Country)
(declare-const cape_verde Country)
(declare-const sao_tome_principe Country)

; Predicates
; in_portuguese_colonial_war(c): true if the country participated in the Portuguese Colonial War
(declare-fun in_portuguese_colonial_war (Country) Bool)

; neutral_in_WWII(c): true if the country had Switzerland's role in WWII (i.e., was neutral)
(declare-fun neutral_in_WWII (Country) Bool)

; Knowledge base (facts)
(assert (in_portuguese_colonial_war portugal))
(assert (neutral_in_WWII portugal))

(assert (in_portuguese_colonial_war angola))
(assert (in_portuguese_colonial_war mozambique))
(assert (in_portuguese_colonial_war guinea_bissau))
(assert (in_portuguese_colonial_war cape_verde))
(assert (in_portuguese_colonial_war sao_tome_principe))

; Test: Did any country in the Portuguese Colonial War share Switzerland's WWII role (i.e., neutral)?
(assert (exists ((c Country))
  (and (in_portuguese_colonial_war c)
       (neutral_in_WWII c))))

; Check satisfiability (one and only one check-sat as required)
(check-sat)
(get-model)