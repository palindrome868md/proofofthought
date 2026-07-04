; -------------------------------------------------
; 1. Declare the uninterpreted sort for geographic features
; -------------------------------------------------
(declare-sort Feature 0)

; -------------------------------------------------
; 2. Declare predicates (functions returning Bool)
; -------------------------------------------------
(declare-fun isMountain (Feature) Bool)
(declare-fun isSea (Feature) Bool)
(declare-fun locatedIn (Feature Feature) Bool)
(declare-fun sticksOutOf (Feature Feature) Bool)

; -------------------------------------------------
; 3. Declare the constants we need
; -------------------------------------------------
(declare-const fuji Feature)          ; Mount Fuji
(declare-const sea_of_japan Feature) ; Sea of Japan

; -------------------------------------------------
; 4. Knowledge base (facts)
; -------------------------------------------------
(assert (isMountain fuji))
(assert (isSea sea_of_japan))

; Mount Fuji is NOT located in the Sea of Japan
(assert (not (locatedIn fuji sea_of_japan)))

; -------------------------------------------------
; 5. General rule: if something sticks out of a sea,
;    it must be located in that sea
; -------------------------------------------------
(assert (forall ((m Feature) (s Feature))
        (=> (sticksOutOf m s)
            (locatedIn m s))))

; -------------------------------------------------
; 6. Test the statement: "The top of Mount Fuji sticks out of the Sea of Japan"
; -------------------------------------------------
(assert (sticksOutOf fuji sea_of_japan))

; -------------------------------------------------
; 7. Check satisfiability – unsat means the statement is false
; -------------------------------------------------
(check-sat)
(get-model)