; Declare sorts
(declare-sort Church 0)
(declare-sort Person 0)

; Declare functions
(declare-fun recognizes-as-saint (Church Person) Bool)
(declare-fun is-orthodox-church (Church) Bool)
(declare-fun is-catholic-church (Church) Bool)
(declare-fun is-russian-prince (Person) Bool)
(declare-fun venerated-in (Person Church) Bool)

; Declare constants
(declare-const ugcc Church)
(declare-const alexander-nevsky Person)
(declare-const russian-orthodox-church Church)

; Knowledge base

; UGCC is an Eastern Catholic Church (in communion with Rome)
(assert (is-catholic-church ugcc))
(assert (not (is-orthodox-church ugcc)))

; Russian Orthodox Church is Orthodox (not Catholic)
(assert (is-orthodox-church russian-orthodox-church))
(assert (not (is-catholic-church russian-orthodox-church)))

; Alexander Nevsky was a Russian prince
(assert (is-russian-prince alexander-nevsky))

; Alexander Nevsky is venerated as a saint in the Russian Orthodox Church
(assert (venerated-in alexander-nevsky russian-orthodox-church))
(assert (recognizes-as-saint russian-orthodox-church alexander-nevsky))

; Rule: Churches typically recognize saints from their own tradition
; Catholic churches recognize saints approved by the Catholic Church
; Orthodox churches recognize saints from Orthodox tradition
(assert (forall ((c Church) (p Person))
  (=> (and (is-catholic-church c) (recognizes-as-saint c p))
      (not (is-orthodox-church c)))))

; Rule: UGCC follows Catholic saint recognition, not independent Orthodox saints
(assert (forall ((c Church) (p Person))
  (=> (and (is-catholic-church c) (is-russian-prince p) 
           (venerated-in p russian-orthodox-church)
           (not (is-orthodox-church c)))
      (not (recognizes-as-saint c p)))))

; Test: Does UGCC recognize Alexander Nevsky as a saint?
(assert (recognizes-as-saint ugcc alexander-nevsky))

; Check satisfiability
(check-sat)
; Expected: unsat (UGCC does NOT recognize Alexander Nevsky as a saint)
; He is venerated in Russian Orthodox Church, not Ukrainian Greek Catholic Church

(get-model)