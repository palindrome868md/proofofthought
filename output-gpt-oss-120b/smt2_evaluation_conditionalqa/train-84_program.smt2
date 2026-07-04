;--- Sorts -------------------------------------------------
(declare-sort Person 0)

;--- Constants ---------------------------------------------
(declare-const me Person)
(declare-const spouse Person)

;--- Boolean facts about the situation ----------------------
; The marriage existed before the gender change
(declare-const married_before Bool)
(assert (= married_before true))

; Both spouses sign the statutory declaration to stay married
(declare-const declaration_agree Bool)
(assert (= declaration_agree true))

; The status of the marriage after the Gender Recognition Certificate
(declare-const married_after Bool)

;--- Rule from the guidance --------------------------------
; If the marriage existed and both spouses agree to stay married,
; then the marriage remains valid afterwards.
(assert (=> (and married_before declaration_agree) married_after))

;--- Test the question: does the legal status change? ------
; Changing status means the truth value after differs from before.
(assert (not (= married_before married_after)))

;--- Check the model ----------------------------------------
(check-sat)      ; Expected: unsat (the status does NOT change)
(get-model)