;--------------------------------------------------------------------
;  Eligibility of mother for the NCFS cash allowance after father's death
;--------------------------------------------------------------------

; 1. Declare an uninterpreted sort for people
(declare-sort Person 0)

; 2. Declare constants representing the relevant individuals
(declare-const father Person)
(declare-const mother Person)

; 3. Declare the predicates (functions returning Bool) needed
(declare-fun ex_employee (Person) Bool)               ; ex‑employee of NCB/BCC
(declare-fun qualified_for_scheme (Person) Bool)     ; qualified for NCFS
(declare-fun receiving_fuel (Person) Bool)           ; currently receiving fuel
(declare-fun widowed_of (Person Person) Bool)        ; widowed_of(w, e) = w is widow of e
(declare-fun eligible_for_allowance (Person) Bool)   ; eligible for cash allowance

; 4. Knowledge base derived from the scenario and the document

; Father was an ex‑employee and was receiving fuel -> he was qualified
(assert (ex_employee father))
(assert (receiving_fuel father))
; By the rules of the scheme, receiving fuel implies qualification
(assert (=> (receiving_fuel ?p) (qualified_for_scheme ?p))) ; generic rule
; To keep things simple we also assert father qualified directly
(assert (qualified_for_scheme father))

; Mother is the widow of the father
(assert (widowed_of mother father))

; General eligibility rule from the document:
; A widow/widower of an ex‑employee who would have been eligible
; (i.e., the ex‑employee is qualified for the scheme) is eligible.
(assert
  (forall ((w Person) (e Person))
    (=> (and (widowed_of w e)
             (ex_employee e)
             (qualified_for_scheme e))
        (eligible_for_allowance w))))

; 5. Test the specific question:
; "Is my mother eligible for the allowance after my dad's death?"
; We assert the statement we want to verify and ask Z3 whether the
; constraints can be satisfied.
(assert (eligible_for_allowance mother))

; 6. Check satisfiability – SAT means the statement is logically implied
;     by the knowledge base (i.e., the mother is indeed eligible).
(check-sat)
(get-model)