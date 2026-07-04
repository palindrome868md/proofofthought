; SMT-LIB 2.0 Program to verify tax relief appointee authorization status
; Based on HMRC Document: Claiming and dealing with tax credits for someone else

; 1. Declare Sorts (Types)
(declare-sort Person 0)
(declare-sort Role 0)

; 2. Declare Functions
; Relationship status
(declare-fun is_next_of_kin (Person Person) Bool)
; Authorization properties
(declare-fun requires_application (Person Role) Bool)
(declare-fun is_automatic (Person Role) Bool)

; 3. Declare Constants
(declare-const me Person)
(declare-const aunt Person)
(declare-const appointee Role)

; 4. Assert Knowledge Base (Facts from Document and Scenario)

; Scenario Fact: I am the aunt's next of kin
(assert (is_next_of_kin me aunt))

; Document Rule: To become an appointee, one must apply (send form, HMRC decides)
; "Applying to become a tax credit appointee... send the form to HM Revenue and Customs"
(assert (forall ((p Person))
  (requires_application p appointee)))

; Document Logic: If a role requires application and HMRC decision, it is not automatic
; "They may contact you for more information before deciding whether to make you an appointee or not"
(assert (forall ((p Person) (r Role))
  (=> (requires_application p r)
      (not (is_automatic p r)))))

; Document Clarification: Relationship status does not exempt from application
; "You do not have to be a relative." (Implies being a relative doesn't grant special automatic status)
; No rule exists linking is_next_of_kin to is_automatic for appointees.

; 5. Verification Test
; Question: Will I be automatically authorised to undertake this role?
; We assert the hypothesis "I am automatically authorised" to check for contradiction.
(assert (is_automatic me appointee))

; 6. Check Satisfiability
; If UNSAT: The hypothesis contradicts the knowledge base (Answer: No)
; If SAT: The hypothesis is possible (Answer: Yes)
(check-sat)
(get-model)