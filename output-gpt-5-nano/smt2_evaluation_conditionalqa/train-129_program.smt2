; Mortgage Interest Run On feasibility test

; Declare scenario data
(declare-const hours-now Int)
(declare-const weeks-smi Int)
(declare-const ent-before Bool)
(declare-const costs-still Bool)
(declare-const expect-last5 Bool)

; Declare test predicate
(declare-const can-run-on Bool)

; Knowledge base / scenario assertions
(assert (= hours-now 40))
(assert (= weeks-smi 16))          ; 4 months ~ 16 weeks since claim began
(assert ent-before)                ; entitled to housing costs before work started
(assert costs-still)                 ; you’ll still have these costs when you start work
(assert expect-last5)                ; you expect the work to last 5 weeks or more

; Define when Run On would apply
(assert (= can-run-on
            (and (>= hours-now 30)
                 (>= weeks-smi 26)
                 ent-before
                 costs-still
                 expect-last5)))

; Test: Can I claim Mortgage Interest Run On?
(assert can-run-on)

; Check satisfiability and show a model if any
(check-sat)
(get-model)