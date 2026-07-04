; 1. Declare sorts
(declare-sort Person 0)
(declare-sort Club 0)
(declare-sort Position 0)

; 2. Declare functions
(declare-fun is-english-footballer (Person) Bool)
(declare-fun played-for (Person Club) Bool)
(declare-fun played-position (Person Position) Bool)
(declare-fun scored-winning-goal-1913 (Person) Bool)

; 3. Declare constants
(declare-const thomas-barber Person)
(declare-const aston-villa Club)
(declare-const halfback Position)
(declare-const inside-left Position)

; 4. Assert knowledge base (premises)
; Thomas Barber was an English professional footballer.
(assert (is-english-footballer thomas-barber))
; Thomas Barber played in the Football League for Aston Villa.
(assert (played-for thomas-barber aston-villa))
; Thomas Barber played as a halfback and inside left.
(assert (played-position thomas-barber halfback))
(assert (played-position thomas-barber inside-left))
; Thomas Barber scored the winning goal in the 1913 FA Cup Final.
(assert (scored-winning-goal-1913 thomas-barber))

; 5. Assert the statement to verify
; Statement: "An English professional footballer scored the winning goal in the 1913 FA Cup Final."
; We use a witness constant to represent the existential claim as per guidelines.
(declare-const statement-witness Person)
(assert (is-english-footballer statement-witness))
(assert (scored-winning-goal-1913 statement-witness))

; 6. Check satisfiability
; Expected: sat (True)
(check-sat)
(get-model)