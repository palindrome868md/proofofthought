; Question: Are more people today related to Genghis Khan than Julius Caesar?

; Declare sorts
(declare-sort Person 0)

; Declare function for counting descendants/relatives
(declare-fun num-descendants (Person) Int)

; Declare constants for historical figures
(declare-const genghis-khan Person)
(declare-const julius-caesar Person)

; Knowledge Base - Historical Facts
; Genghis Khan has approximately 16 million descendants today
; (Genetic studies show ~0.5% of world population carries his Y-chromosome)
(assert (= (num-descendants genghis-khan) 16000000))

; Julius Caesar's direct bloodline died out
; (His only legitimate daughter Julia died in childbirth, no surviving direct descendants)
(assert (= (num-descendants julius-caesar) 0))

; Test: Are more people related to Genghis Khan than Julius Caesar?
(assert (> (num-descendants genghis-khan) (num-descendants julius-caesar)))

; Check satisfiability
(check-sat)
(get-model)