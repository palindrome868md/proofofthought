; Declare sorts
(declare-sort Country 0)
(declare-sort Language 0)

; Declare functions
(declare-fun official-language (Country) Language)
(declare-fun language-root (Language) Language)
(declare-fun is-english-rooted (Language) Bool)
(declare-fun was-british-colony (Country) Bool)

; Declare constants
(declare-const saint-vincent-grenadines Country)
(declare-const english Language)

; Knowledge base
; Saint Vincent and the Grenadines was a British colony
(assert (was-british-colony saint-vincent-grenadines))

; The official language of Saint Vincent and the Grenadines is English
(assert (= (official-language saint-vincent-grenadines) english))

; English is rooted in English (trivially true)
(assert (= (language-root english) english))

; English is English-rooted
(assert (is-english-rooted english))

; Rule: If a country was a British colony, its official language is English-rooted
(assert (forall ((c Country) (l Language))
  (=> (and (was-british-colony c)
           (= (official-language c) l))
      (is-english-rooted l))))

; Rule: If language root is English, the language is English-rooted
(assert (forall ((l Language))
  (=> (= (language-root l) english)
      (is-english-rooted l))))

; Test: Is the language used in Saint Vincent and the Grenadines rooted in English?
(assert (is-english-rooted (official-language saint-vincent-grenadines)))

; Check satisfiability
(check-sat)
(get-model)