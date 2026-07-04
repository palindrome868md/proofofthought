; Legal Reasoning: Presumption of Death Certificate Revocation
; Question: Do I need to send a copy of my claim to my father's civil partner?

; 1. Declare sorts
(declare-sort Person 0)
(declare-sort ClaimType 0)

; 2. Declare functions/relations
(declare-fun is-civil-partner (Person Person) Bool)
(declare-fun is-child (Person Person) Bool)
(declare-fun is-parent (Person Person) Bool)
(declare-fun is-sibling (Person Person) Bool)
(declare-fun is-missing-person (Person) Bool)
(declare-fun made-original-claim (Person) Bool)
(declare-fun is-claimant (Person) Bool)
(declare-fun is-alive (Person) Bool)
(declare-fun must-send-copy-to (Person Person) Bool)
(declare-fun claim-is-revoke (ClaimType) Bool)

; 3. Declare constants
(declare-const claimant Person)
(declare-const father Person)
(declare-const civil-partner Person)
(declare-const revoke-claim ClaimType)

; 4. Assert knowledge base (facts from scenario)

; The father is the missing person
(assert (is-missing-person father))

; The civil partner is the father's civil partner
(assert (is-civil-partner civil-partner father))

; The claimant is the father's child
(assert (is-child claimant father))

; The civil partner made the original presumption of death claim
(assert (made-original-claim civil-partner))

; The civil partner is alive (they made the claim 3 years ago)
(assert (is-alive civil-partner))

; The father is alive (claimant has evidence)
(assert (is-alive father))

; The claimant is making the claim
(assert (is-claimant claimant))

; This is a revoke claim
(assert (claim-is-revoke revoke-claim))

; 5. Assert legal rules from document

; Rule: Send copies to the person who made the original claim
(assert (forall ((c Person) (o Person))
  (=> (and (is-claimant c) (made-original-claim o) (is-alive o))
      (must-send-copy-to c o))))

; Rule: Send copies to missing person's spouse or civil partner (if alive)
(assert (forall ((c Person) (m Person) (s Person))
  (=> (and (is-claimant c) 
           (is-missing-person m)
           (is-civil-partner s m)
           (is-alive s))
      (must-send-copy-to c s))))

; Rule: Send copies to missing person's parents, children, siblings (if alive)
(assert (forall ((c Person) (m Person) (r Person))
  (=> (and (is-claimant c)
           (is-missing-person m)
           (is-alive r)
           (or (is-parent r m) (is-child r m) (is-sibling r m)))
      (must-send-copy-to c r))))

; 6. Test: Does claimant need to send copy to civil partner?
; We assert they MUST send, then check if this is satisfiable with the knowledge base
(assert (must-send-copy-to claimant civil-partner))

; 7. Check satisfiability
(check-sat)
(get-model)

; Expected result: sat (TRUE)
; This means YES, the claimant needs to send a copy to the father's civil partner
; because the civil partner is alive and falls under the category of 
; "missing person's spouse or civil partner" who must receive copies