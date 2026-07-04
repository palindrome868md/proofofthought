;--- 1. Declare Boolean variables for Rina ------------------------------------
(declare-const r Bool)   ; regularly drinks coffee
(declare-const d Bool)   ; dependent on caffeine
(declare-const w Bool)   ; wants to be addicted to caffeine
(declare-const a Bool)   ; aware that caffeine is a drug
(declare-const s Bool)   ; is a student

;--- 2. Knowledge base (premises) --------------------------------------------
; 1. All regular coffee drinkers are dependent
(assert (=> r d))

; 2. Every person either drinks coffee or doesn’t want to be addicted
(assert (or r (not w)))

; 3. No one who doesn’t want to be addicted is unaware (i.e., they are aware)
(assert (=> (not w) a))

; 4. Rina is (student ∧ unaware) OR (¬student ∧ aware)
(assert (or (and s (not a))
            (and (not s) a)))

; 5. Rina is (student ∧ dependent) OR (¬student ∧ ¬dependent)
(assert (or (and s d)
            (and (not s) (not d))))

;--- 3. Negation of the statement we want to test ----------------------------
; Statement:  r ∨ ¬a
; Negation:   ¬r ∧ a
(assert (and (not r) a))

;--- 4. Check satisfiability ---------------------------------------------------
(check-sat)
(get-model)