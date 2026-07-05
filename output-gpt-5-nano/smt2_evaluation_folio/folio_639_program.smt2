; Sorts
(declare-sort Person 0)
(declare-sort School 0)
(declare-sort Country 0)
(declare-sort Party 0)

; Constants
(declare-const william-dickinson Person)
(declare-const westminster-school School)
(declare-const edinburgh-university School)

(declare-const united-kingdom Country)
(declare-const portland-whigs Party)

; Predicates / Functions
(declare-fun attended (Person School) Bool)
(declare-fun located_in (School) Country)
(declare-fun is-politician (Person) Bool)
(declare-fun sits_in_house_of_commons (Person) Bool)
(declare-fun supports_party (Person Party) Bool)

; Knowledge base (premises)
(assert (is-politician william-dickinson))
(assert (attended william-dickinson westminster-school))
(assert (attended william-dickinson edinburgh-university))
(assert (= (located_in edinburgh-university) united-kingdom))
(assert (supports_party william-dickinson portland-whigs))
(assert (sits_in_house_of_commons william-dickinson))

; Rule: Portland Whigs supporters do not get a seat in Parliament
(assert (forall ((p Person))
  (=> (supports_party p portland-whigs)
      (not (sits_in_house_of_commons p)))))

; Test scenario: Does William Dickinson sit in the House of Commons?
(assert (sits_in_house_of_commons william-dickinson))

; Check satisfiability
(check-sat)