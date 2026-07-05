; Declare sorts
(declare-sort Person 0)
(declare-sort Application 0)

; Declare constants
(declare-const grandmother Person)
(declare-const other1 Person)
(declare-const the-app Application)

; Predicates / functions
(declare-fun connected-to-app (Person Application) Bool)
(declare-fun told-app (Person Application) Bool)
(declare-fun target-of (Application) Person)

; Knowledge base: if someone is connected to an application, they must be told
(assert (forall ((p Person) (a Application))
  (=> (connected-to-app p a)
      (told-app p a))))

; Facts about a specific application
(assert (= (target-of the-app) grandmother))
(assert (connected-to-app other1 the-app))

; Test: Can you seek a court protection order without informing the connected person?
(assert (not (told-app other1 the-app)))

; Check satisfiability
(check-sat)
(get-model)