; Determine if interest is payable when agreeing to pay in installments

; Scenario indicators
(declare-const instalments Bool)

; Interest payable on a given instalment index
(declare-fun interest-on (Int) Bool)

; If paying in instalments, there exists a later instalment that bears interest
(assert (=> instalments
            (exists ((i Int))
              (and (> i 1)
                   (interest-on i)))))

; Test scenario: you agree to pay in instalments
(assert instalments)

; Check whether the constraints allow a situation where interest is payable
(check-sat)