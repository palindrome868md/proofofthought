; Seven Deadly Sins Prevalence Analysis
; Question: Is greed the most prevalent of the Seven Deadly Sins?

; Declare sort for sins
(declare-sort Sin 0)

; Declare the seven deadly sins as constants
(declare-const pride Sin)
(declare-const greed Sin)
(declare-const lust Sin)
(declare-const envy Sin)
(declare-const gluttony Sin)
(declare-const wrath Sin)
(declare-const sloth Sin)

; Function to get prevalence ranking (lower number = more prevalent)
(declare-fun prevalence (Sin) Int)

; Function to check if a sin is one of the seven deadly sins
(declare-fun is-deadly-sin (Sin) Bool)

; Assert all seven sins are distinct
(assert (distinct pride greed lust envy gluttony wrath sloth))

; Knowledge Base: Theological understanding of the Seven Deadly Sins

; All seven are deadly sins
(assert (is-deadly-sin pride))
(assert (is-deadly-sin greed))
(assert (is-deadly-sin lust))
(assert (is-deadly-sin envy))
(assert (is-deadly-sin gluttony))
(assert (is-deadly-sin wrath))
(assert (is-deadly-sin sloth))

; Theological fact: Pride is traditionally considered the root/most serious sin
; In Christian theology, pride is often ranked as the most prevalent/fundamental
(assert (= (prevalence pride) 1))

; All other sins have prevalence ranking greater than 1
(assert (> (prevalence greed) 1))
(assert (> (prevalence lust) 1))
(assert (> (prevalence envy) 1))
(assert (> (prevalence gluttony) 1))
(assert (> (prevalence wrath) 1))
(assert (> (prevalence sloth) 1))

; Prevalence values must be positive
(assert (>= (prevalence greed) 1))
(assert (>= (prevalence lust) 1))
(assert (>= (prevalence envy) 1))
(assert (>= (prevalence gluttony) 1))
(assert (>= (prevalence wrath) 1))
(assert (>= (prevalence sloth) 1))

; Test Question: Is greed the most prevalent? (prevalence = 1)
; If this is unsat, then greed is NOT the most prevalent
(assert (= (prevalence greed) 1))

; Check satisfiability
(check-sat)
; Expected: unsat (greed is NOT the most prevalent - pride holds that position)

; Get model to see the actual prevalence values
(get-model)