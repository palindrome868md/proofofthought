; Sorts
(declare-sort Field 0)
(declare-sort Particle 0)

; Predicate: studies(field, topic)
(declare-fun studies (Field Particle) Bool)

; Constants
(declare-const biochemistry Field)
(declare-const gluons Particle)

; Knowledge base (empty in this minimal KB)

; Test scenario: Does Biochemistry study gluons?
(assert (studies biochemistry gluons))

; Check satisfiability (one and only one check-sat per question)
(check-sat)
(get-model)