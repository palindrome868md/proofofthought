; Declare sorts
(declare-sort Person 0)

; Declare constants
(declare-const class_of_2010 Person)

; Declare functions
(declare-fun birth_year (Person) Int)
(declare-fun graduation_year (Person) Int)
(declare-fun death_year (Person) Int)

; Knowledge base (example birth/death info for the class of 2010)
(assert (= (birth_year class_of_2010) 1992))
(assert (= (graduation_year class_of_2010) 2010))
(assert (= (death_year class_of_2010) 9999))

; Question: Would the high school class of 2010 have lived through the Presidency of Richard Nixon?
; Check if there exists a year y during their life that lies within Nixon's presidency (1969-1974)
(assert (exists ((y Int))
  (and (<= (birth_year class_of_2010) y)
       (<= y (death_year class_of_2010))
       (<= 1969 y)
       (<= y 1974))))
(check-sat)