; Question: Is it okay to lie after taking an oath in a court of law?
; Expected answer: NO (unsat means it's not okay/permissible)

; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare predicates/functions
(declare-fun took-oath (Person) Bool)           ; Person took an oath
(declare-fun in-court (Person) Bool)            ; Person is in a court of law
(declare-fun is-lying (Person) Bool)            ; Person is lying
(declare-fun is-okay (Person) Bool)             ; Person's action is permissible/okay

; 3. Declare constants
(declare-const witness Person)                  ; The person in question

; 4. Knowledge base: Legal/ethical rule
; If someone took an oath in court, then lying is NOT okay
(assert (forall ((p Person))
  (=> (and (took-oath p) (in-court p) (is-lying p))
      (not (is-okay p)))))

; 5. Scenario: Witness took an oath in court and is lying
(assert (took-oath witness))
(assert (in-court witness))
(assert (is-lying witness))

; 6. Test: Is lying okay in this scenario?
; If unsat, then lying is NOT okay (violates the rule)
; If sat, then lying IS okay (no violation)
(assert (is-okay witness))

; 7. Check satisfiability
(check-sat)
(get-model)