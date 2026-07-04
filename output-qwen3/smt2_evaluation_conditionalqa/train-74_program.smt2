; Shared Parental Leave and Pay Eligibility Verification
; Scenario: Married 3 years, baby girl born 1 week ago
; Question: Given baby already born, are we eligible for SPL/ShPP?

; Declare sorts
(declare-sort Person 0)

; Declare functions
(declare-fun is-married (Person Person) Bool)
(declare-fun shares-responsibility-at-birth (Person Person Person) Bool)
(declare-fun baby-born (Person) Bool)
(declare-fun within-first-year (Person) Bool)
(declare-fun started-responsibility-after-birth (Person Person Person) Bool)
(declare-fun eligible-for-spl-shpp (Person Person) Bool)

; Declare constants
(declare-const mother Person)
(declare-const partner Person)
(declare-const baby Person)

; ============================================================
; KNOWLEDGE BASE - Document Rules for Birth Parents
; ============================================================

; CRITICAL DISQUALIFYING RULE: Not eligible if started sharing 
; responsibility for the child AFTER it was born
(assert (forall ((m Person) (p Person) (b Person))
  (=> (started-responsibility-after-birth m p b)
      (not (eligible-for-spl-shpp m p)))))

; Eligibility requires sharing responsibility at birth
(assert (forall ((m Person) (p Person) (b Person))
  (=> (eligible-for-spl-shpp m p)
      (shares-responsibility-at-birth m p b))))

; Eligibility requires baby to be born (for birth parents)
; Document: "You can only start SPL/ShPP once the child has been born"
(assert (forall ((m Person) (p Person) (b Person))
  (=> (eligible-for-spl-shpp m p)
      (baby-born b))))

; Eligibility requires within first year after birth
; Document: "You need to share the pay and leave in the first year 
; after your child is born"
(assert (forall ((m Person) (p Person) (b Person))
  (=> (eligible-for-spl-shpp m p)
      (within-first-year b))))

; ============================================================
; SCENARIO FACTS
; ============================================================

; Fact: They are married (3 years)
(assert (is-married mother partner))

; Fact: Baby already born (1 week ago)
(assert (baby-born baby))

; Fact: Within first year after birth (1 week < 1 year)
(assert (within-first-year baby))

; Inference: Married couples with baby born to them share 
; responsibility from birth (not after)
(assert (=> (and (is-married mother partner) (baby-born baby))
    (shares-responsibility-at-birth mother partner baby)))

; Inference: They did NOT start responsibility after birth
; (This is the key disqualifying condition to check)
(assert (=> (and (is-married mother partner) (baby-born baby))
    (not (started-responsibility-after-birth mother partner baby))))

; ============================================================
; VERIFICATION TEST
; ============================================================

; Test: Assert eligibility and check if consistent with all facts
; If sat = eligibility is possible (True)
; If unsat = eligibility contradicts facts (False)
(assert (eligible-for-spl-shpp mother partner))

; Check satisfiability
(check-sat)
(get-model)