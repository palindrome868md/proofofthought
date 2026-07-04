; SMT-LIB 2.0 Program to verify Childcare Grant Eligibility
; Question: Can I apply for a grant to cover the cost of childcare for my son whilst I attend my course?

; 1. Declare Constants (Properties of the applicant and situation)
(declare-const is-full-time-student Bool)
(declare-const child-age Int)
(declare-const has-special-needs Bool)
(declare-const gets-undergrad-finance Bool)
(declare-const gets-postgrad-loan Bool)
(declare-const is-permanent-resident-england Bool)
(declare-const child-financially-dependent Bool)
(declare-const provider-registered Bool)
(declare-const claims-tax-free-childcare-me Bool)
(declare-const claims-tax-free-childcare-partner Bool)
(declare-const claims-working-tax-credit-me Bool)
(declare-const claims-working-tax-credit-partner Bool)
(declare-const claims-universal-credit-me Bool)
(declare-const claims-universal-credit-partner Bool)
(declare-const receives-nhs-help-me Bool)
(declare-const receives-nhs-help-partner Bool)
(declare-const is-eligible Bool)

; 2. Assert Knowledge Base (Eligibility Rules from Document)
; Rule: Must be a full-time student
(assert (=> is-eligible is-full-time-student))

; Rule: Child must be under 15, or under 17 with special needs
(assert (=> is-eligible 
            (or (< child-age 15) 
                (and (< child-age 17) has-special-needs))))

; Rule: Must get undergraduate student finance (or be eligible to)
(assert (=> is-eligible gets-undergrad-finance))

; Rule: Must not be getting a Postgraduate Loan
(assert (=> is-eligible (not gets-postgrad-loan)))

; Rule: Must be a permanent resident in England
(assert (=> is-eligible is-permanent-resident-england))

; Rule: Children must be financially dependent
(assert (=> is-eligible child-financially-dependent))

; Rule: Childcare provider must be registered
(assert (=> is-eligible provider-registered))

; Rule: Neither you nor partner claiming Tax-Free Childcare, Working Tax Credit, or Universal Credit
(assert (=> is-eligible 
            (not (or claims-tax-free-childcare-me 
                     claims-tax-free-childcare-partner
                     claims-working-tax-credit-me 
                     claims-working-tax-credit-partner
                     claims-universal-credit-me 
                     claims-universal-credit-partner))))

; Rule: Neither you nor partner receive help from NHS
(assert (=> is-eligible 
            (not (or receives-nhs-help-me receives-nhs-help-partner))))

; 3. Assert Scenario Facts (From User Input)
; "currently studying for a degree at University" + "get undergraduate student finance" -> Full-time
(assert (= is-full-time-student true))

; "5 year old son"
(assert (= child-age 5))

; "I get undergraduate student finance"
(assert (= gets-undergrad-finance true))

; "studying for a degree" (Undergraduate implied)
(assert (= gets-postgrad-loan false))

; "live in England"
(assert (= is-permanent-resident-england true))

; "my ... son" (Implies dependency)
(assert (= child-financially-dependent true))

; Assumption for "Can I apply": Provider can be chosen to be registered
(assert (= provider-registered true))

; No mention of claiming benefits, assume false for possibility check
(assert (= claims-tax-free-childcare-me false))
(assert (= claims-tax-free-childcare-partner false))
(assert (= claims-working-tax-credit-me false))
(assert (= claims-working-tax-credit-partner false))
(assert (= claims-universal-credit-me false))
(assert (= claims-universal-credit-partner false))

; No mention of NHS help
(assert (= receives-nhs-help-me false))
(assert (= receives-nhs-help-partner false))

; 4. Verification Test
; Question: Can I apply? (Is it possible to be eligible?)
; Assert the positive claim and check satisfiability
(assert is-eligible)

; 5. Check Satisfiability
(check-sat)
(get-model)