; 1. Declare Sorts
(declare-sort Person 0)
(declare-sort Organization 0)

; 2. Declare Functions (Predicates)
; Did the person work at the organization?
(declare-fun worked_at (Person Organization) Bool)
; Did the person qualify for the scheme (e.g., as an employee)?
(declare-fun is_qualified (Person) Bool)
; Is person w the widow/widower of person h?
(declare-fun is_widow_of (Person Person) Bool)
; Is the person eligible for the NCFS?
(declare-fun is_eligible (Person) Bool)

; 3. Declare Constants
(declare-const widow Person)      ; The user applying
(declare-const husband Person)    ; The late husband
(declare-const bcc Organization)  ; British Coal Corporation

; 4. Assert Knowledge Base (Facts from Scenario)
; Fact: Husband worked at British Coal Corporation
(assert (worked_at husband bcc))

; Fact: Husband qualified for the scheme before death (stated in scenario)
(assert (is_qualified husband))

; Fact: User is the widow of the husband
(assert (is_widow_of widow husband))

; 5. Assert Knowledge Base (Rules from Document)
; Rule: A widow/widower of an ex-employee who qualified is eligible for NCFS
(assert (forall ((w Person) (h Person))
  (=> (and (is_widow_of w h) 
           (is_qualified h))
      (is_eligible w))))

; 6. Verification
; Question: Am I (the widow) eligible for the National Concessionary Fuel Scheme?
; We assert the eligibility condition and check for satisfiability.
(assert (is_eligible widow))

; 7. Check Satisfiability
; sat = True (Eligible), unsat = False (Not Eligible)
(check-sat)
(get-model)