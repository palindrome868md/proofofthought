(declare-sort Person 0)
(declare-sort Song 0)

(declare-const sam Person)

(declare-fun is-cpp (Person) Bool)
(declare-fun is-python (Person) Bool)
(declare-fun uses-mac (Person) Bool)
(declare-fun plays (Person Song) Bool)
(declare-fun is-Perfect (Song) Bool)

; Premises
; Sam is doing a project: the project is either C++ or Python (and not both)
(assert (or (is-cpp sam) (is-python sam)))
(assert (not (and (is-cpp sam) (is-python sam))))

; If Sam does a Python project, he will not use a Mac
(assert (=> (is-python sam) (not uses-mac sam)))

; Sam is using a Mac
(assert uses-mac sam)

; If Sam uses a Mac, he will play a song
(assert (exists ((s Song)) (plays sam s)))

; If a song is not titled "Perfect," Sam will never play it
(assert (forall ((s Song)) (=> (not (is-Perfect s)) (not (plays sam s)))))

; Test: The project Sam is doing is written in C++
(assert (not (is-cpp sam)))

(check-sat)
(get-model)