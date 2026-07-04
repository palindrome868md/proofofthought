; SMT-LIB 2.0 Program for Will Beneficiary Verification
; Question: Will I be allowed to include my new partner in my will?

; 1. Declare Sorts
(declare-sort Person 0)
(declare-sort Will 0)

; 2. Declare Functions
(declare-fun is-beneficiary (Will Person) Bool)
(declare-fun is-witness (Will Person) Bool)
(declare-fun is-married (Person Person) Bool)
(declare-fun has-capacity (Person) Bool)
(declare-fun is-signed (Will) Bool)

; 3. Declare Constants
(declare-const me Person)
(declare-const partner Person)
(declare-const witness1 Person)
(declare-const witness2 Person)
(declare-const current-will Will)

; 4. Assert Knowledge Base (Legal Rules from Document)

; Rule: To be valid, will maker must have capacity (18+, sound mind)
; Assumption: User running an estate has capacity
(assert (has-capacity me))

; Rule: Will must be signed
(assert (is-signed current-will))

; Rule: Will must have 2 witnesses over 18
(assert (is-witness current-will witness1))
(assert (is-witness current-will witness2))
(assert (distinct witness1 witness2))

; Rule: You cannot leave your witnesses anything in your will
(assert (forall ((w Will) (p Person))
  (=> (is-beneficiary w p)
      (not (is-witness w p)))))

; Rule: You cannot leave your witnesses' married partners anything in your will
(assert (forall ((w Will) (p Person) (q Person))
  (=> (and (is-beneficiary w p) 
           (is-witness w q) 
           (is-married p q))
      false)))

; 5. Assert Scenario Facts

; I remarried partner
(assert (is-married me partner))
(assert (is-married partner me))

; Partner is not a witness (Standard practice for beneficiary spouse)
(assert (not (is-witness current-will partner)))
(assert (distinct partner witness1))
(assert (distinct partner witness2))

; Partner is not married to the witnesses
(assert (not (is-married partner witness1)))
(assert (not (is-married partner witness2)))

; 6. Verification Test
; Question: Will I be allowed to include him in my will?
; We assert that he IS included and check for satisfiability.
; If SAT, it is allowed. If UNSAT, it is forbidden.
(assert (is-beneficiary current-will partner))

; 7. Check Satisfiability
(check-sat)
(get-model)