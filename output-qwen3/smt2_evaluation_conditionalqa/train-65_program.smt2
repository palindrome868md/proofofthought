; SMT-LIB 2.0 Program to Verify Remote Will Witnessing Eligibility
; Question: Can a 68-year-old in Scotland with terminal cancer witness their will remotely?

; 1. Declare sorts
(declare-sort Person 0)
(declare-sort Location 0)

; 2. Declare functions
(declare-fun age (Person) Int)
(declare-fun lives-in (Person Location) Bool)
(declare-fun is-sound-mind (Person) Bool)
(declare-fun is-immunocompromised (Person) Bool)
(declare-fun remote-signing-allowed (Location) Bool)
(declare-fun can-witness-remotely (Person) Bool)

; 3. Declare constants
(declare-const test-person Person)
(declare-const scotland Location)
(declare-const england Location)
(declare-const wales Location)

; 4. Assert knowledge base from document

; Rule: Remote signing is only allowed in England or Wales (NOT Scotland)
(assert (remote-signing-allowed england))
(assert (remote-signing-allowed wales))
(assert (not (remote-signing-allowed scotland)))

; Rule: A person can witness remotely only if their location allows remote signing
(assert (forall ((p Person) (l Location))
  (=> (and (lives-in p l) (remote-signing-allowed l))
      (can-witness-remotely p))))

; Rule: To make a valid will, person must be 18 or over
(assert (forall ((p Person))
  (=> (< (age p) 18)
      (not (can-witness-remotely p)))))

; Rule: To make a valid will, person must be of sound mind
(assert (forall ((p Person))
  (=> (not (is-sound-mind p))
      (not (can-witness-remotely p)))))

; 5. Assert person's specific facts from scenario
(assert (= (age test-person) 68))
(assert (lives-in test-person scotland))
(assert (is-sound-mind test-person))
(assert (is-immunocompromised test-person))

; 6. Test: Can this person witness their will remotely via videoconferencing?
(assert (can-witness-remotely test-person))

; 7. Check satisfiability
(check-sat)
(get-model)

; Expected result: unsat
; Reason: Person lives in Scotland, but remote signing is only allowed in England or Wales
; Therefore, the assertion (can-witness-remotely test-person) contradicts the knowledge base