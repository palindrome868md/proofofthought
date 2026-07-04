; Question: Is "double duty" an incorrect phrase for host of Dancing With The Stars?
; 
; Reasoning: "Double duty" means performing two or more roles simultaneously.
; For Dancing With The Stars, the host typically only hosts (one role),
; not also judging or competing. So "double duty" would be INCORRECT.
; We test by asserting the host DOES perform double duty - if unsat, it's incorrect.

; Declare sorts
(declare-sort Person 0)
(declare-sort Show 0)
(declare-sort Role 0)

; Declare functions
(declare-fun is-host (Person Show) Bool)
(declare-fun performs-role (Person Role) Bool)
(declare-fun has-double-duty (Person) Bool)

; Declare constants
(declare-const dwts-host Person)
(declare-const dancing-with-stars Show)
(declare-const hosting-role Role)
(declare-const judging-role Role)
(declare-const competing-role Role)

; Knowledge Base: Facts about Dancing With The Stars host

; The person is a host of Dancing With The Stars
(assert (is-host dwts-host dancing-with-stars))

; The host performs the hosting role
(assert (performs-role dwts-host hosting-role))

; DWTS host does NOT perform judging role (separate judges exist)
(assert (not (performs-role dwts-host judging-role)))

; DWTS host does NOT perform competing role (separate contestants exist)
(assert (not (performs-role dwts-host competing-role)))

; Define double duty: performing multiple distinct roles
; A person has double duty only if they perform 2+ different roles
(assert (forall ((p Person))
  (=> (has-double-duty p)
      (or (and (performs-role p hosting-role) (performs-role p judging-role))
          (and (performs-role p hosting-role) (performs-role p competing-role))
          (and (performs-role p judging-role) (performs-role p competing-role))))))

; Verification Test: Is "double duty" an INCORRECT phrase?
; We assert the host HAS double duty and check satisfiability
; If UNSAT: double duty is INCORRECT (cannot be true)
; If SAT: double duty is CORRECT (can be true)
(assert (has-double-duty dwts-host))

; Check satisfiability
(check-sat)
(get-model)