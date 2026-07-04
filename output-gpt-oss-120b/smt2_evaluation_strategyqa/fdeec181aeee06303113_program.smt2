;--- 1. Declare sorts -------------------------------------------------
(declare-sort City 0)

;--- 2. Enumerated datatypes -------------------------------------------
(declare-datatypes () ((Religion (Christian) (Muslim) (Other))))
(declare-datatypes () ((Artifact (crucifix) (otherArtifact))))

;--- 3. Declare functions -----------------------------------------------
; Majority religion of a city
(declare-fun majority-religion (City) Religion)

; Does a city contain a given artifact?
(declare-fun has-artifact (City Artifact) Bool)

;--- 4. Declare constants -----------------------------------------------
(declare-const karachi City)

;--- 5. Knowledge base -------------------------------------------------
; Karachi’s majority religion is Muslim
(assert (= (majority-religion karachi) Muslim))

; Universal rule: a Muslim‑majority city does NOT have a crucifix
(assert (forall ((c City) (a Artifact))
        (=> (and (= (majority-religion c) Muslim) (= a crucifix))
            (not (has-artifact c a)))))

;--- 6. Test the question -----------------------------------------------
; "Are you likely to find a crucifix in Karachi?"  →  assert that it exists
(assert (has-artifact karachi crucifix))

;--- 7. Verification ----------------------------------------------------
(check-sat)      ; Expected: unsat (the scenario cannot hold)
(get-model)