; Declare sorts
(declare-sort Person 0)
(declare-sort Language 0)

; Declare functions
(declare-fun understands (Person Language) Bool)
(declare-fun confused_by (Person Language) Bool)

; Declare constants
(declare-const pict Person)
(declare-const old_english Language)

; Knowledge base
; Rule: if a person does not understand a language, they would be confused by it
(assert (forall ((p Person) (l Language))
  (=> (not (understands p l)) (confused_by p l))))

; Facts: the Pict does not understand Old English
(assert (not (understands pict old_english)))

; Test scenario: Would the Pict be confused by Old English?
(assert (confused_by pict old_english))

; Check satisfiability and provide a model
(check-sat)
(get-model)