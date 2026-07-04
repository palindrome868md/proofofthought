; Sorts
(declare-sort Person 0)
(declare-sort Project 0)

; Language datatype: cpp or python
(declare-datatypes () ((Language cpp python)))

; Song titles (we only need Perfect for this problem)
(declare-datatypes () ((Title Perfect Other)))

; Song and title interface
(declare-sort Song 0)
(declare-fun title (Song) Title)

; Predicates
(declare-fun doing (Person Project) Bool)
(declare-fun language (Project) Language)
(declare-fun uses-mac (Person) Bool)
(declare-fun plays (Person Song) Bool)

; Witnesses
(declare-const sam Person)
(declare-const p Project)
(declare-const s Song)

; Knowledge base (premises)
; 1. Sam is doing a project
(assert (doing sam p))

; 2. A project is written either in C++ or Python
(assert (or (= (language p) cpp) (= (language p) python)))

; 3. If Sam does a project written in Python, he will not use a Mac
(assert (=> (= (language p) python) (not (uses-mac sam))))

; 4. Sam is using a Mac
(assert (uses-mac sam))

; 5. If Sam uses a Mac, he will play a song
(assert (=> (uses-mac sam) (plays sam s)))

; 6. If a song is not titled "Perfect," Sam will never play it
; For all people and all songs, if the song's title is not Perfect, then nobody plays it
(assert (forall ((pp Person) (ss Song))
  (=> (not (= (title ss) Perfect))
      (not (plays pp ss)))))

; 6b. Title of the song Sam plays is Perfect (to satisfy the consequence of 5)
(assert (= (title s) Perfect))

; Test scenario: negate the statement to be proven
; Statement to test: "The project p is written in C++." We test negation:
; (not (language p) = cpp)
(assert (not (= (language p) cpp)))

; Check satisfiability to determine if the statement is entailed
(check-sat)