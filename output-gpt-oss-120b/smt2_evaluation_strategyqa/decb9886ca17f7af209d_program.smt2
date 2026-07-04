; Declare uninterpreted sorts
(declare-sort Country 0)
(declare-sort Language 0)

; Declare constants
(declare-const saint-vincent Country)
(declare-const english Language)

; Declare function: the (primary) language spoken in a country
(declare-fun language-of (Country) Language)

; Declare predicate: a language is rooted in another language
(declare-fun rooted-in (Language Language) Bool)

; Knowledge base
; Saint Vincent and the Grenadines uses English as its language
(assert (= (language-of saint-vincent) english))

; Rule: English is rooted in English (a language is trivially rooted in itself)
(assert (forall ((l Language))
        (=> (= l english) (rooted-in l english))))

; Test the query: Is the language used in Saint Vincent and the Grenadines rooted in English?
(assert (rooted-in (language-of saint-vincent) english))

; Verify the query
(check-sat)
(get-model)