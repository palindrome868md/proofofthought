(set-logic AUFLIA)

; Sorts
(declare-sort Person 0)

; Predicates
(declare-fun at (Person) Bool)
(declare-fun investor (Person) Bool)
(declare-fun entrepreneur (Person) Bool)
(declare-fun enjoys-start (Person) Bool)
(declare-fun enjoys-state (Person) Bool)
(declare-fun prefers-planned (Person) Bool)
(declare-fun ardent (Person) Bool)
(declare-fun prefers-state (Person) Bool)

; Constant representing Ho
(declare-const Ho Person)

; Knowledge base
; 1) Everyone at the business conference is either an investor or an entrepreneur.
(assert (forall ((p Person))
  (=> (at p) (or (investor p) (entrepreneur p)))))

; 2) None of those at the business conference who enjoy the opportunity of starting a business
;    prefer a planned economy.
(assert (forall ((p Person))
  (=> (and (at p) (enjoys-start p))
      (not (prefers-planned p)))))

; 3) All entrepreneurs at the business conference enjoy the opportunity of starting a business.
(assert (forall ((p Person))
  (=> (and (at p) (entrepreneur p))
      (enjoys-start p))))

; 4) Everyone at the business conference who enjoys state ownership of means of production
;    prefers a planned economy.
(assert (forall ((p Person))
  (=> (and (at p) (enjoys-state p))
      (prefers-planned p))))

; 5) Everyone at the business conference who is an ardent communist
;    prefers state ownership of the means of production.
(assert (forall ((p Person))
  (=> (and (at p) (ardent p))
      (prefers-state p))))

; 6) Ho is at the business conference and prefers state ownership of the means of production.
(assert (at Ho))
(assert (prefers-state Ho))

; Question: Ho is an investor or is not an ardent communist.
(assert (or (investor Ho) (not (ardent Ho))))

; Check and model
(check-sat)
(get-model)