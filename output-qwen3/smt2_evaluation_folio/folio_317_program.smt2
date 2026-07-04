; 1. Declare sorts
(declare-sort Community 0)
(declare-sort County 0)
(declare-sort Route 0)

; 2. Declare functions
(declare-fun is-unincorporated (Community) Bool)
(declare-fun located-in (Community County) Bool)
(declare-fun on-route (Community Route) Bool)
(declare-fun northwest-of (Community Community) Bool)

; 3. Declare constants
(declare-const Ordinary Community)
(declare-const Elliot-County County)
(declare-const Sandy-Hook Community)
(declare-const Route-32 Route)

; 4. Assert knowledge base (Premises)
; Premise 1: Ordinary is an unincorporated community.
(assert (is-unincorporated Ordinary))

; Premise 2: Located within Elliot County, Ordinary is on Kentucky Route 32.
(assert (located-in Ordinary Elliot-County))
(assert (on-route Ordinary Route-32))

; Premise 3: Ordinary is located northwest of Sandy Hook.
(assert (northwest-of Ordinary Sandy-Hook))

; 5. Verification
; Statement: There is an unincorporated community located in Elliot County.
; To verify this existential claim, we assert the existence of a witness 
; that satisfies the conditions and check for satisfiability.
(declare-const witness Community)
(assert (is-unincorporated witness))
(assert (located-in witness Elliot-County))

; 6. Check satisfiability
; Expected: sat (True), because 'Ordinary' satisfies these conditions in the KB.
(check-sat)
(get-model)