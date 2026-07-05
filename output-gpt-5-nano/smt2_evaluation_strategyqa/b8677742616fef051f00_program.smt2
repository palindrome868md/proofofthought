; Sorts
(declare-sort Person 0)

; Functions
(declare-fun num-descendants (Person) Int)

; Constants
(declare-const genghis_khan Person)
(declare-const julius_caesar Person)

; Knowledge base (example counts)
(assert (= (num-descendants genghis_khan) 16000000))
(assert (= (num-descendants julius_caesar) 5000000))

; Test: Are more people today related to Genghis Khan than Julius Caesar?
(assert (> (num-descendants genghis_khan) (num-descendants julius_caesar)))

; Check satisfiability and provide a model
(check-sat)
(get-model)