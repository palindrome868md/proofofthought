; Declare numeric placeholders for the two ordinal numbers
(declare-const andrew-johnson-presidency-number Int)
(declare-const elagabalus-emperor-number Int)

; Knowledge base: assign canonical numbers
(assert (= andrew-johnson-presidency-number 17))
(assert (= elagabalus-emperor-number 11))

; Test: Does Andrew Johnson's presidential number exceed Elagabalus's Emperor number?
(assert (> andrew-johnson-presidency-number elagabalus-emperor-number))

; Check satisfiability to answer the question
(check-sat)
(get-model)