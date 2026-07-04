; Declare sorts
(declare-sort Animal 0)

; Declare functions
; Response time in seconds to a bell stimulus
(declare-fun response-time-to-bell (Animal) Int)

; Whether the animal is trained for bell responses
(declare-fun is-bell-trained (Animal) Bool)

; Declare constants
(declare-const dog Animal)
(declare-const grey-seal Animal)

; Knowledge base facts

; Dogs are commonly trained to respond to bells (Pavlovian conditioning)
(assert (is-bell-trained dog))

; Grey seals are not typically trained for bell responses
(assert (not (is-bell-trained grey-seal)))

; Rule: Bell-trained animals respond faster to bells
(assert (forall ((a Animal))
  (=> (is-bell-trained a)
      (< (response-time-to-bell a) 5))))

; Rule: Non-bell-trained animals respond slower to bells
(assert (forall ((a Animal))
  (=> (not (is-bell-trained a))
      (> (response-time-to-bell a) 10))))

; Test: Would a dog respond to bell before Grey seal?
; This means: is dog's response time less than grey seal's response time?
(assert (< (response-time-to-bell dog) (response-time-to-bell grey-seal)))

; Check satisfiability
(check-sat)
(get-model)