; SMT-LIB 2.0 Program: Will Legal Advice Verification
; Question: "I want to make a will, do I need legal advice?"
; Based on the provided document about making a will

; ============================================
; 1. DECLARE SORTS (Types)
; ============================================
(declare-sort Person 0)
(declare-sort Dependant 0)
(declare-sort Charity 0)

; ============================================
; 2. DECLARE FUNCTIONS/PREDICATES
; ============================================
; Person properties
(declare-fun is-living (Person) Bool)
(declare-fun wants-to-make-will (Person) Bool)
(declare-fun needs-legal-advice (Person) Bool)

; Complex will conditions (require legal advice)
(declare-fun shares-property-with-non-spouse (Person) Bool)
(declare-fun has-family-members-who-may-claim (Person) Bool)
(declare-fun permanent-home-outside-uk (Person) Bool)
(declare-fun has-property-overseas (Person) Bool)
(declare-fun has-business (Person) Bool)

; Will contents
(declare-fun leaves-to-charity (Person Charity) Bool)
(declare-fun leaves-to-dependants (Person Dependant) Bool)
(declare-fun dependant-cannot-care-for-self (Dependant) Bool)

; ============================================
; 3. DECLARE CONSTANTS
; ============================================
(declare-const me Person)
(declare-const my-charity Charity)
(declare-const my-dependant Dependant)

; ============================================
; 4. ASSERT KNOWLEDGE BASE (from document)
; ============================================

; Rule 1: Complex property situations require legal advice
(assert (forall ((p Person))
  (=> (shares-property-with-non-spouse p)
      (needs-legal-advice p))))

; Rule 2: Family members who may claim require legal advice
(assert (forall ((p Person))
  (=> (has-family-members-who-may-claim p)
      (needs-legal-advice p))))

; Rule 3: Home outside UK requires legal advice
(assert (forall ((p Person))
  (=> (permanent-home-outside-uk p)
      (needs-legal-advice p))))

; Rule 4: Property overseas requires legal advice
(assert (forall ((p Person))
  (=> (has-property-overseas p)
      (needs-legal-advice p))))

; Rule 5: Having a business requires legal advice
(assert (forall ((p Person))
  (=> (has-business p)
      (needs-legal-advice p))))

; Rule 6: Dependants who cannot care for themselves require legal advice
(assert (forall ((p Person) (d Dependant))
  (=> (and (leaves-to-dependants p d) (dependant-cannot-care-for-self d))
      (needs-legal-advice p))))

; ============================================
; 5. ASSERT SCENARIO FACTS
; ============================================

; I am a living person who wants to make a will
(assert (is-living me))
(assert (wants-to-make-will me))

; I want to leave a bequest to a charity (allowed, not complex)
(assert (leaves-to-charity me my-charity))

; I want to leave possessions to dependants
(assert (leaves-to-dependants me my-dependant))

; None of the complex conditions apply to my scenario
(assert (not (shares-property-with-non-spouse me)))
(assert (not (has-family-members-who-may-claim me)))
(assert (not (permanent-home-outside-uk me)))
(assert (not (has-property-overseas me)))
(assert (not (has-business me)))

; My dependants can care for themselves (not a complex case)
(assert (not (dependant-cannot-care-for-self my-dependant)))

; ============================================
; 6. VERIFICATION TEST
; ============================================
; Question: "Do I need legal advice?"
; If unsat: NO, legal advice is not needed (contradicts KB+scenario)
; If sat: YES, legal advice might be needed (consistent with KB+scenario)

(assert (needs-legal-advice me))

; ============================================
; 7. CHECK SATISFIABILITY
; ============================================
(check-sat)
(get-model)

; ============================================
; EXPECTED RESULT: unsat
; EXPLANATION: Based on the document, legal advice is only needed for 
; non-straightforward wills. The scenario (leaving to charity + dependants 
; who can care for themselves) does not meet any conditions requiring 
; legal advice. Therefore, asserting "needs-legal-advice" contradicts 
; the knowledge base + scenario, resulting in unsat.
; ============================================