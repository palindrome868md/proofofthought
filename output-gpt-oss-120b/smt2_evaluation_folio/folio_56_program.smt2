;--- Sorts ---------------------------------------------------------
(declare-sort Person 0)

;--- Predicates ----------------------------------------------------
; English professional footballer
(declare-fun english_professional_footballer (Person) Bool)
; Scored the winning goal in the 1913 FA Cup Final
(declare-fun scored_winning_goal_1913 (Person) Bool)

;--- Constants -----------------------------------------------------
(declare-const thomas Person)

;--- Knowledge base (premises) -------------------------------------
; Thomas Barber was an English professional footballer
(assert (english_professional_footballer thomas))
; Thomas Barber scored the winning goal in the 1913 FA Cup Final
(assert (scored_winning_goal_1913 thomas))

;--- Statement to verify (existential claim) -----------------------
; An English professional footballer scored the winning goal in 1913 FA Cup Final
(assert (exists ((p Person))
        (and (english_professional_footballer p)
             (scored_winning_goal_1913 p))))

;--- Check the statement -------------------------------------------
(check-sat)   ; expected result: sat (the statement is true)
(get-model)