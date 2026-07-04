; Question: Could Scooby Doo fit in a kangaroo pouch?
; This is a possibility question - we test if the scenario is satisfiable

; Declare sorts
(declare-sort Animal 0)
(declare-sort Kangaroo 0)

; Declare functions
(declare-fun size (Animal) Int)
(declare-fun pouch-capacity (Kangaroo) Int)
(declare-fun can-fit-in-pouch (Animal Kangaroo) Bool)

; Declare constants
(declare-const scooby-doo Animal)
(declare-const test-kangaroo Kangaroo)

; Knowledge Base

; Fact 1: Scooby Doo is a Great Dane dog
; Great Danes are very large - approximately 75-80 cm at shoulder
; We'll use 75 as a representative size unit
(assert (= (size scooby-doo) 75))

; Fact 2: Kangaroo pouches have limited capacity
; Pouches are designed for joeys (baby kangaroos)
; Maximum capacity is approximately 10-15 size units
(assert (= (pouch-capacity test-kangaroo) 10))

; Rule: An animal can fit in a pouch ONLY IF its size is <= pouch capacity
(assert (forall ((a Animal) (k Kangaroo))
  (=> (can-fit-in-pouch a k)
      (<= (size a) (pouch-capacity k)))))

; Verification Test: Could Scooby Doo fit in a kangaroo pouch?
; We assert that he CAN fit and check if this is satisfiable
(assert (can-fit-in-pouch scooby-doo test-kangaroo))

; Check satisfiability
(check-sat)
(get-model)

; Expected result: unsat
; Reasoning: Scooby Doo's size (75) > pouch capacity (10)
; This contradicts the rule that fitting requires size <= capacity
; Therefore, it is NOT possible for Scooby Doo to fit in a kangaroo pouch