; SMT-LIB 2.0 Program to verify eligibility for a declaration of presumed death
; Scenario: Civil partner missing for 7+ years abroad (Canada), Claimant living in Wales for 18 months.
; Question: Can the claimant make a claim despite the missing person being abroad?

; 1. Declare Sorts
(declare-sort Person 0)

; 2. Declare Functions
; Relationship predicate
(declare-fun is-civil-partner (Person Person) Bool)
; Duration of missing status in years
(declare-fun years-missing (Person) Int)
; Residency in England or Wales in months (for the year prior to claim/disappearance)
(declare-fun months-lived-in-england-or-wales (Person) Int)
; Eligibility predicate
(declare-fun eligible-to-claim (Person Person) Bool)

; 3. Declare Constants
(declare-const claimant Person)
(declare-const missing_person Person)

; 4. Assert Knowledge Base (Facts from Scenario)
; Fact: They are civil partners
(assert (is-civil-partner claimant missing_person))
; Fact: Missing for 7 years or more
(assert (>= (years-missing missing_person) 7))
; Fact: Claimant has been living in Wales (part of England or Wales) for 18 months
(assert (= (months-lived-in-england-or-wales claimant) 18))
; Fact: Missing person was living in Canada (not England or Wales) at time of disappearance
(assert (= (months-lived-in-england-or-wales missing_person) 0))

; 5. Assert Rules (Legal Requirements)
; Rule: To make a claim, one must be a spouse/civil partner, missing >= 7 years,
; AND meet at least one residency/domicile condition (Simplified to residency for this verification).
; Condition: Claimant lived in England/Wales for whole year (12 months) OR Missing Person did.
(assert (forall ((c Person) (m Person))
  (=> (and 
        (is-civil-partner c m)
        (>= (years-missing m) 7)
        (or 
          (>= (months-lived-in-england-or-wales c) 12)
          (>= (months-lived-in-england-or-wales m) 12)
        )
      )
      (eligible-to-claim c m))))

; 6. Verification
; Question: Can I make a claim?
; We assert that the claim is eligible and check for satisfiability.
; If 'sat', it is possible/valid under the rules.
(assert (eligible-to-claim claimant missing_person))

(check-sat)
(get-model)