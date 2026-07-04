; SMT-LIB 2.0 Program to verify if unreasonable behaviour can be used as grounds for civil partnership dissolution

; 1. Declare sorts
(declare-sort Person 0)
(declare-sort Behaviour 0)
(declare-sort Ground 0)

; 2. Declare functions
(declare-fun partnership-duration (Person) Int)  ; Duration in years
(declare-fun has-experienced (Person Behaviour) Bool)
(declare-fun qualifies-as-unreasonable (Behaviour) Bool)
(declare-fun can-use-ground (Person Ground) Bool)
(declare-fun is-abuse (Behaviour) Bool)
(declare-fun is-coercive-control (Behaviour) Bool)
(declare-fun is-mental-cruelty (Behaviour) Bool)

; 3. Declare constants
(declare-const user Person)
(declare-const abuse-behaviour Behaviour)
(declare-const coercive-control Behaviour)
(declare-const unreasonable-behaviour-ground Ground)

; 4. Assert knowledge base from document

; Rule: Can dissolve if partnership is over 1 year
(assert (forall ((p Person))
  (=> (> (partnership-duration p) 1)
      (can-use-ground p unreasonable-behaviour-ground))))

; Rule: Abuse qualifies as unreasonable behaviour
(assert (forall ((b Behaviour))
  (=> (is-abuse b)
      (qualifies-as-unreasonable b))))

; Rule: Coercive control qualifies as unreasonable behaviour (mental cruelty)
(assert (forall ((b Behaviour))
  (=> (is-coercive-control b)
      (qualifies-as-unreasonable b))))

; Rule: Mental cruelty qualifies as unreasonable behaviour
(assert (forall ((b Behaviour))
  (=> (is-mental-cruelty b)
      (qualifies-as-unreasonable b))))

; Rule: If partner's behaviour qualifies as unreasonable, can use this ground
(assert (forall ((p Person) (b Behaviour))
  (=> (and (has-experienced p b)
           (qualifies-as-unreasonable b))
      (can-use-ground p unreasonable-behaviour-ground))))

; 5. Assert scenario facts

; User has been in civil partnership since June 2020 (over 1 year as of 2024+)
(assert (= (partnership-duration user) 4))

; User has experienced abuse from partner
(assert (has-experienced user abuse-behaviour))
(assert (is-abuse abuse-behaviour))

; User has experienced coercive control from partner
(assert (has-experienced user coercive-control))
(assert (is-coercive-control coercive-control))

; 6. Test: Can user use unreasonable behaviour as ground for dissolution?
(assert (can-use-ground user unreasonable-behaviour-ground))

; 7. Check satisfiability
(check-sat)
(get-model)