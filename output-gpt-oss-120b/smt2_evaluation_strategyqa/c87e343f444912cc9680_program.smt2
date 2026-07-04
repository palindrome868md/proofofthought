;-------------------------------------------------
; 1. Declare the uninterpreted sort for artifacts
;-------------------------------------------------
(declare-sort Artifact 0)

;-------------------------------------------------
; 2. Declare functions (properties of artifacts)
;-------------------------------------------------
; The year an artifact was identified
(declare-fun identified-year (Artifact) Int)
; Whether an artifact is life‑size
(declare-fun life-size (Artifact) Bool)

;-------------------------------------------------
; 3. Declare the specific artifact under discussion
;-------------------------------------------------
(declare-const donatello-crucifix Artifact)

;-------------------------------------------------
; 4. Knowledge base (facts known to be true)
;-------------------------------------------------
; The crucifix was identified in the year 2020
(assert (= (identified-year donatello-crucifix) 2020))

; The crucifix is life‑size
(assert (life-size donatello-crucifix))

;-------------------------------------------------
; 5. Query: “Was the Donatello crucifix identified in 2020 life size?”
;    We assert the property we are asking about.
;-------------------------------------------------
(assert (life-size donatello-crucifix))

;-------------------------------------------------
; 6. Check satisfiability – sat means the answer is true
;-------------------------------------------------
(check-sat)
(get-model)