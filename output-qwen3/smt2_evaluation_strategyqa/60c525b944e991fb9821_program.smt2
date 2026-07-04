; Declare sorts
(declare-sort Person 0)
(declare-sort Language 0)

; Declare functions
(declare-fun native-language (Person) Language)
(declare-fun would-be-confused-by (Person Language) Bool)
(declare-fun are-same-language (Language Language) Bool)

; Declare constants
(declare-const pict-person Person)
(declare-const old-english Language)
(declare-const pictish Language)

; Knowledge base: Picts' native language is Pictish
(assert (= (native-language pict-person) pictish))

; Knowledge base: Old English is different from Pictish
(assert (not (are-same-language old-english pictish)))

; Rule: If a person's native language is different from a language, they would be confused by it
(assert (forall ((p Person) (l Language))
  (=> (not (are-same-language (native-language p) l))
      (would-be-confused-by p l))))

; Test: Would a Pict be confused by Old English?
(assert (would-be-confused-by pict-person old-english))

; Check satisfiability
(check-sat)
(get-model)