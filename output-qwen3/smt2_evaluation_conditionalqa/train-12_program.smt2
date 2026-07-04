; 1. Declare Sorts
(declare-sort Person 0)
(declare-sort Property 0)
(declare-sort RepairType 0)

; 2. Declare Functions (Predicates)
(declare-fun is-disabled (Person) Bool)
(declare-fun owns (Person Property) Bool)
(declare-fun lives-in (Person Property) Bool)
(declare-fun needs-repair (Property RepairType) Bool)
(declare-fun is-covered-by-grant (RepairType) Bool)
(declare-fun is-eligible (Person) Bool)
(declare-fun allowed-to-seek (Person) Bool)

; 3. Declare Constants
(declare-const aunt Person)
(declare-const home Property)
(declare-const heating-repair RepairType)
(declare-const lighting-repair RepairType)

; 4. Assert Knowledge Base (Rules from Document)

; Rule: Heating and Lighting repairs are covered by the grant
; Document: "provide a heating system suitable for your needs", "adapt heating or lighting controls"
(assert (is-covered-by-grant heating-repair))
(assert (is-covered-by-grant lighting-repair))

; Rule: Eligibility Criteria
; Document: "You or someone living in the property must be disabled."
; Document: "own the property or be a tenant"
; Document: "intend to live in the property"
; Document: "work is necessary and appropriate" (Modeled by needs-repair + covered)
; Document: "might not get any grant if you start work... before... approves" (Implied by 'needs-repair')
(assert (forall ((p Person) (prop Property) (r RepairType))
  (=> (and (is-disabled p)
           (owns p prop)
           (lives-in p prop)
           (needs-repair prop r)
           (is-covered-by-grant r))
      (is-eligible p))))

; Rule: If eligible, allowed to seek support
; Document: "Apply through your local council."
(assert (forall ((p Person))
  (=> (is-eligible p) (allowed-to-seek p))))

; 5. Assert Scenario Facts
; Scenario: "My aunt is disabled"
(assert (is-disabled aunt))
; Scenario: "owns a big home"
(assert (owns aunt home))
; Scenario: Implied residence as it is her home needing urgent repair for living conditions
(assert (lives-in aunt home))
; Scenario: "needs light and heating system repairs"
(assert (needs-repair home heating-repair))
(assert (needs-repair home lighting-repair))

; 6. Test Question: Is she allowed to seek disabled facility support?
; We assert the proposition to check for satisfiability (sat = True/Allowed)
(assert (allowed-to-seek aunt))

; 7. Check Satisfiability
(check-sat)
(get-model)