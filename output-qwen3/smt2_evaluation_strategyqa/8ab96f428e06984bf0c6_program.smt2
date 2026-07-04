; Question: Could someone with fine motor control issues benefit from an altered keyboard layout?
; This is a possibility question - we test if such a scenario is satisfiable

; 1. Declare sorts
(declare-sort Person 0)
(declare-sort KeyboardLayout 0)

; 2. Declare functions
(declare-fun has-fine-motor-issues (Person) Bool)
(declare-fun uses-keyboard (Person KeyboardLayout) Bool)
(declare-fun benefits-from (Person KeyboardLayout) Bool)
(declare-fun is-altered-layout (KeyboardLayout) Bool)
(declare-fun is-standard-layout (KeyboardLayout) Bool)
(declare-fun reduces-motor-demand (KeyboardLayout) Bool)

; 3. Declare constants for testing
(declare-const test-person Person)
(declare-const altered-keyboard KeyboardLayout)

; 4. Assert knowledge base

; Rule 1: Altered keyboards reduce motor demand
(assert (forall ((k KeyboardLayout))
  (=> (is-altered-layout k)
      (reduces-motor-demand k))))

; Rule 2: People with fine motor issues benefit from keyboards that reduce motor demand
(assert (forall ((p Person) (k KeyboardLayout))
  (=> (and (has-fine-motor-issues p)
           (uses-keyboard p k)
           (reduces-motor-demand k))
      (benefits-from p k))))

; Rule 3: Altered layouts are not standard layouts
(assert (forall ((k KeyboardLayout))
  (=> (is-altered-layout k)
      (not (is-standard-layout k)))))

; Fact 1: The test keyboard is an altered layout
(assert (is-altered-layout altered-keyboard))

; 5. Test scenario: Someone with fine motor issues uses an altered keyboard
; We assert this scenario and check if it's satisfiable (possible)
(assert (has-fine-motor-issues test-person))
(assert (uses-keyboard test-person altered-keyboard))
(assert (benefits-from test-person altered-keyboard))

; 6. Check satisfiability
; sat = True (yes, it's possible someone could benefit)
; unsat = False (no, it's not possible)
(check-sat)
(get-model)