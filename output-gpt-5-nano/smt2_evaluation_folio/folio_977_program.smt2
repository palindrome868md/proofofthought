; Sorts
(declare-sort Person 0)

; Constants
(declare-const bunny Person)

; Predicates
(declare-fun at_clay_school (Person) Bool)
(declare-fun makes_matcha_ceremonial (Person) Bool)
(declare-fun wakes_late (Person) Bool)
(declare-fun starts_past_noon (Person) Bool)
(declare-fun lives_in_CA (Person) Bool)
(declare-fun attends_yoga (Person) Bool)
(declare-fun is_celebrity (Person) Bool)
(declare-fun has_regular_9_to_5 (Person) Bool)
(declare-fun prefers_home (Person) Bool)

; Premises
; 1) If someone went to Clay's school and makes ceremonial matcha, then they do not wake late and do not start past noon
(assert
  (forall ((x Person))
    (=> (and (at_clay_school x) (makes_matcha_ceremonial x))
        (and (not (wakes_late x)) (not (starts_past_noon x))))))

; 2) If someone went to Clay's school, lives in CA, and attends yoga, then they make ceremonial matcha
(assert
  (forall ((x Person))
    (=> (and (at_clay_school x) (lives_in_CA x) (attends_yoga x))
        (makes_matcha_ceremonial x))))

; 3) If someone went to Clay's school and is a celebrity, they wake late and start past noon
(assert
  (forall ((x Person))
    (=> (and (at_clay_school x) (is_celebrity x))
        (and (wakes_late x) (starts_past_noon x)))))

; 4) If someone went to Clay's school and does not have a regular 9-5 job, they are a celebrity
(assert
  (forall ((x Person))
    (=> (and (at_clay_school x) (not (has_regular_9_to_5 x)))
        (is_celebrity x))))

; 5) If someone went to Clay's school and prefers to work at home, they do not have a regular 9-5 job
(assert
  (forall ((x Person))
    (=> (and (at_clay_school x) (prefers_home x))
        (not (has_regular_9_to_5 x)))))

; 6) Bunny's scenario
(assert
  (and (at_clay_school bunny)
       (or (and (prefers_home bunny) (makes_matcha_ceremonial bunny))
           (and (not (prefers_home bunny)) (not (makes_matcha_ceremonial bunny))))))

; Query: Would Bunny go to Clay's school AND live in CA AND attend yoga regularly?
(assert (and (at_clay_school bunny)
             (lives_in_CA bunny)
             (attends_yoga bunny)))

; Check satisfiability and model
(check-sat)
(get-model)