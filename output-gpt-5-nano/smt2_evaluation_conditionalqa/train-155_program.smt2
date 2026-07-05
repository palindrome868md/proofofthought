; Question: Can I decide when and how my child is going to receive his money?
; Interpretation: Under current Child Trust Fund rules, money cannot be withdrawn
; before 18. The parent can manage investments (as registered contact) but cannot
; force an earlier withdrawal.

(declare-sort Person 0)

(declare-const father Person)
(declare-const richard Person)

; Age of a person in months
(declare-fun age-in-months (Person) Int)

; Is this person the registered contact for the account?
(declare-fun registered-contact (Person) Bool)

; Withdrawn money by the child (Richard)
(declare-fun withdraw (Person) Bool)

; Knowledge base (CTF rules encoded in a simplified form)
; Richard is 6 months old
(assert (= (age-in-months richard) 6))

; Father is the registered contact
(assert (registered-contact father))

; Rule: If there is a registered contact and Richard is under 18 years (216 months),
; then Richard cannot withdraw money yet.
(assert (forall ((p Person))
  (=> (and (registered-contact p) (< (age-in-months richard) 216))
      (not (withdraw richard)))))

; Test scenario: Attempt to withdraw money for Richard now (before 18)
(assert (withdraw richard))

; Check satisfiability: expected UNSAT (cannot withdraw before 18)
(check-sat)