; Sorts
(declare-sort Person 0)

; Functions (predicates)
(declare-fun is-disabled (Person) Bool)
(declare-fun is-owner (Person) Bool)
(declare-fun is-tenant (Person) Bool)
(declare-fun plan-years (Person) Int)

; Constants / parameters
(declare-const you Person)
(declare-const grant-period-years Int)

; Decision predicate
(declare-fun can-apply (Person) Bool)

; Knowledge base (scenario)
(assert (is-disabled you))
(assert (or (is-owner you) (is-tenant you)))
(assert (= (plan-years you) 3))
(assert (= grant-period-years 5))

; Definition of eligibility -> can-apply
(assert (= can-apply you
          (and (is-disabled you)
               (or (is-owner you) (is-tenant you))
               (>= (plan-years you) grant-period-years))))

; Test: Can you apply?
(assert (can-apply you))

; Verification
(check-sat)
(get-model)