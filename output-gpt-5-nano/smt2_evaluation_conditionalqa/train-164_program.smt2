; Sure Start Maternity Grant eligibility for a scenario in England with twins

; Declare sorts
(declare-sort Country 0)
(declare-sort Person 0)

; Declare constants
(declare-const england Country)
(declare-const me Person)

; Predicates / relations
(declare-fun lives-in (Person Country) Bool)

; Scenario facts
(declare-const expect-twins Bool)
(declare-const num-children-me Int)
(declare-const on-universal-credit Bool)
(declare-const within-claim-window Bool)

; Eligibility predicate
(declare-fun eligible (Person) Bool)

; Knowledge base (facts about the scenario)
(assert (lives-in me england))
(assert expect-twins)
(assert (= num-children-me 2))            ; two existing children (ages 2 and 4)
(assert on-universal-credit)
(assert within-claim-window)               ; within 6 months after birth (3 weeks ago)

; Rule: eligibility for Sure Start Maternity Grant
; You are eligible if you live in England, you (or partner) receive a qualifying benefit (Universal Credit),
; you are having a multiple birth (twins) and you have existing children, and you claim within the window.
(assert
  (=> (and (lives-in me england)
           on-universal-credit
           expect-twins
           (> num-children-me 0)
           within-claim-window)
      (eligible me))
)

; Test scenario: Am I eligible?
(assert (eligible me))

; Verification
(check-sat)
(get-model)