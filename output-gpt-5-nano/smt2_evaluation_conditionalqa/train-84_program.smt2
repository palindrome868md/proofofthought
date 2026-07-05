; Declare sorts
(declare-sort Person 0)

; Declare constants
(declare-const me Person)
(declare-const spouse Person)

; Declare predicates/functions
(declare-fun married (Person Person) Bool)
(declare-fun apply-grc (Person) Bool)
(declare-fun stat-decl (Person Person) Bool)
(declare-fun stay-married (Person) Bool)
(declare-fun marriage-status-change (Person) Bool)

; Knowledge base (scenarios/policies)
; You are married to your spouse
(assert (married me spouse))

; You are applying for a Gender Recognition Certificate
(assert (apply-grc me))

; You and your spouse agree to stay married (statutory declaration)
(assert (stat-decl me spouse))

; If you are married and you apply for a GRC and you both agree, you stay married
(assert (=> (and (married me spouse) (apply-grc me) (stat-decl me spouse))
            (stay-married me)))

; If the marriage status changes, then you do not stay married
(assert (=> (marriage-status-change me) (not (stay-married me))))

; Test: Will my marriage's legal status change?
; We assert that the marriage status changes and see if the KB remains satisfiable
(assert (marriage-status-change me))

; Check satisfiability and get a model to illustrate
(check-sat)
(get-model)