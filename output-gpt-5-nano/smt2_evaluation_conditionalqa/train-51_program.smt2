; Declare sorts
(declare-sort Person 0)

; Declare functions (predicates)
(declare-fun ex_ncb (Person) Bool)
(declare-fun ncfs_eligible (Person) Bool)
(declare-fun ncfs_solid (Person) Bool)
(declare-fun ncfs_cash (Person) Bool)

; Declare constants
(declare-const me Person)

; Knowledge base (scenario: I am an ex-NCB employee)
(assert (ex_ncb me))
; If you are an ex-NCB employee, you are eligible for NCFS
(assert (=> (ex_ncb me) (ncfs_eligible me)))
; If someone is NCFS-eligible, they could receive solid fuel or a cash payment
(assert (=> (ncfs_eligible me) (or (ncfs_solid me) (ncfs_cash me))))

; Scenario: Does my employment history entitle me to any fuel payment?
; Test whether there exists some form of NCFS payment for me
(assert (or (ncfs_solid me) (ncfs_cash me)))

; Check satisfiability
(check-sat)
(get-model)