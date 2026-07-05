; Declare sorts
(declare-sort Language 0)

; Declare predicate: (rooted_in language another_language) means "the first language is rooted in the second language"
(declare-fun rooted_in (Language Language) Bool)

; Declare constants representing the SVG language and English
(declare-const svg_language Language)
(declare-const english Language)

; Knowledge base: SVG language is rooted in English
(assert (rooted_in svg_language english))

; Test scenario: Is the language used in SVG rooted in English?
(assert (rooted_in svg_language english))

; Check satisfiability and provide a model
(check-sat)
(get-model)