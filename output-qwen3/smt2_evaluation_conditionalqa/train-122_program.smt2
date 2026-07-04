; SMT-LIB 2.0 Program for SMI Eligibility Verification
; Question: Can I get financial help to cushion my mortgage interest?
; Scenario: Landlord, loan for repairs, tenants not paying, financially struggling.
; Document: Support for Mortgage Interest (SMI) rules.

; 1. Declare Sorts
(declare-sort Person 0)
(declare-sort BenefitType 0)

; 2. Declare Functions (Predicates)
(declare-fun is-landlord (Person) Bool)
(declare-fun is-homeowner (Person) Bool)
(declare-fun has-repair-loan (Person) Bool)
(declare-fun financially-struggling (Person) Bool)
(declare-fun receives-qualifying-benefit (Person) Bool)
(declare-fun treated-as-getting-benefit (Person) Bool)
(declare-fun eligible-for-smi (Person) Bool)

; 3. Declare Constants
(declare-const me Person)

; 4. Assert Knowledge Base (SMI Rules)
; Rule 1: To be eligible for SMI, you usually need to be getting or treated as getting a qualifying benefit.
(assert (forall ((p Person))
  (=> (eligible-for-smi p)
      (or (receives-qualifying-benefit p) (treated-as-getting-benefit p)))))

; Rule 2: SMI is for homeowners (implied by "If you're a homeowner").
; We assume landlords are homeowners, but eligibility depends on benefits.
(assert (forall ((p Person))
  (=> (is-landlord p) (is-homeowner p))))

; Rule 3: SMI covers loans for repairs to your home.
; (This condition is met in the scenario, so no negative constraint here).

; Rule 4: You cannot get SMI if you don't meet the benefit requirement.
; (Covered by Rule 1 implication).

; 5. Assert Scenario Facts
; Fact 1: I am a landlord.
(assert (is-landlord me))

; Fact 2: I took a loan to repair my home.
(assert (has-repair-loan me))

; Fact 3: I am financially struggling.
(assert (financially-struggling me))

; Fact 4: Scenario does not state I receive a qualifying benefit.
; In eligibility checking, unstated prerequisites are assumed false.
(assert (not (receives-qualifying-benefit me)))

; Fact 5: Scenario does not state I am treated as getting a benefit.
(assert (not (treated-as-getting-benefit me)))

; 6. Verification Test
; Question: Can I get financial help (SMI)?
; We assert eligibility and check for consistency with the scenario + rules.
(assert (eligible-for-smi me))

; 7. Check Satisfiability
(check-sat)
(get-model)