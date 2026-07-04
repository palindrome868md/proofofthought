;-------------------------------------------------
; 1. Declare sorts (uninterpreted types)
;-------------------------------------------------
(declare-sort Person 0)

;-------------------------------------------------
; 2. Declare functions / predicates
;-------------------------------------------------
; d is a deputy for p
(declare-fun is_deputy (Person Person) Bool)

; p is dead
(declare-fun is_dead (Person) Bool)

; d currently has legal power for p
(declare-fun has_power (Person Person) Bool)

;-------------------------------------------------
; 3. Knowledge base (rules from the guidance)
;-------------------------------------------------
; A deputy's power ceases when the protected person dies
(assert (forall ((d Person) (p Person))
  (=> (and (is_deputy d p) (is_dead p))
      (not (has_power d p)))))

; (Optional) When the person is alive, the deputy may have power
; (not required for the contradiction, but reflects that power can exist)
(assert (forall ((d Person) (p Person))
  (=> (and (is_deputy d p) (not (is_dead p)))
      (has_power d p))))

;-------------------------------------------------
; 4. Facts of the scenario
;-------------------------------------------------
; You (me) are a deputy for your uncle
(declare-const me Person)
(declare-const uncle Person)

(assert (is_deputy me uncle))

; The uncle has died
(assert (is_dead uncle))

;-------------------------------------------------
; 5. Test the claim: "I still have power after his death"
;-------------------------------------------------
(assert (has_power me uncle))

;-------------------------------------------------
; 6. Check the consistency of the knowledge base + claim
;-------------------------------------------------
(check-sat)   ; Expected result: unsat (the claim is false)
(get-model)   ; Optional: model (will be empty because unsat)