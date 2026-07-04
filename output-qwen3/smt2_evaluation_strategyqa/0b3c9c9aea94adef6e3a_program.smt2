; Declare sorts
(declare-sort Event 0)
(declare-sort Currency 0)

; Declare functions
(declare-fun year-of-event (Event) Int)
(declare-fun currency-used-for (Event Currency) Bool)
(declare-fun year-created (Currency) Int)

; Declare constants
(declare-const louisiana-purchase Event)
(declare-const bitcoin Currency)

; Knowledge base
; Louisiana Purchase occurred in 1803
(assert (= (year-of-event louisiana-purchase) 1803))

; Bitcoin was created in 2009
(assert (= (year-created bitcoin) 2009))

; Rule: An event can only use a currency if the currency existed at or before the time of the event
(assert (forall ((e Event) (c Currency))
  (=> (currency-used-for e c)
      (<= (year-created c) (year-of-event e)))))

; Test: Was the Louisiana Purchase made with bitcoin?
(assert (currency-used-for louisiana-purchase bitcoin))

; Check satisfiability
(check-sat)
; Expected: unsat (False - bitcoin did not exist in 1803)

(get-model)