; SMT-LIB 2.0 Program to verify CTF withdrawal control question
; Question: Can parent decide when child receives CTF money?

; 1. Declare sorts
(declare-sort Person 0)
(declare-sort Account 0)

; 2. Declare functions
(declare-fun is-parent (Person Person) Bool)
(declare-fun is-registered-contact (Person Account) Bool)
(declare-fun is-child-owner (Person Account) Bool)
(declare-fun can-control-withdrawal (Person Account) Bool)
(declare-fun child-age (Person) Int)
(declare-fun is-ctf (Account) Bool)

; 3. Declare constants
(declare-const parent Person)
(declare-const richard Person)
(declare-const savings-account Account)

; 4. Assert knowledge base (facts from document)

; Richard is the parent's child
(assert (is-parent parent richard))

; This is a CTF account
(assert (is-ctf savings-account))

; Richard owns the CTF account (money belongs to child)
(assert (is-child-owner richard savings-account))

; Parent is registered contact (manages account)
(assert (is-registered-contact parent savings-account))

; CTF Rule 1: Child can take control of account at 16
(assert (forall ((p Person) (a Account))
  (=> (and (is-child-owner p a)
           (is-ctf a)
           (>= (child-age p) 16))
      (can-control-withdrawal p a))))

; CTF Rule 2: At 18, child automatically takes over and can withdraw
(assert (forall ((p Person) (a Account))
  (=> (and (is-child-owner p a)
           (is-ctf a)
           (>= (child-age p) 18))
      (can-control-withdrawal p a))))

; CTF Rule 3: Parent cannot control withdrawal once child is 18
; (Parent's control ends when child takes over at 18)
(assert (forall ((p Person) (a Account) (par Person))
  (=> (and (is-child-owner p a)
           (is-ctf a)
           (>= (child-age p) 18)
           (is-parent par p))
      (not (can-control-withdrawal par a)))))

; CTF Rule 4: Only exception is if child lacks mental capacity
; (requires Court of Protection order - not automatic parent control)
(declare-fun lacks-mental-capacity (Person) Bool)
(assert (forall ((p Person) (a Account) (par Person))
  (=> (and (is-child-owner p a)
           (is-ctf a)
           (>= (child-age p) 18)
           (is-parent par p)
           (can-control-withdrawal par a))
      (lacks-mental-capacity p))))

; 5. Test scenario: Richard will be 18+ (20-25 years from birth as mentioned)
(assert (>= (child-age richard) 18))

; Assume Richard has normal mental capacity (no Court of Protection needed)
(assert (not (lacks-mental-capacity richard)))

; 6. Test: Can parent decide when Richard receives money?
; Assert that parent CAN control withdrawal - if UNSAT, answer is NO
(assert (can-control-withdrawal parent savings-account))

; 7. Check satisfiability
(check-sat)
(get-model)

; Expected result: UNSAT
; This means parent CANNOT decide when child receives CTF money at 18
; Child automatically gains control at 18 unless they lack mental capacity