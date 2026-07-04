;--- Sorts ---------------------------------------------------------
; Persons, Projects and Songs are uninterpreted sorts
(declare-sort Person 0)
(declare-sort Project 0)
(declare-sort Song 0)

; Enumerated sorts for languages, devices and song titles
(declare-datatypes () ((Language Cpp Python)))
(declare-datatypes () ((Device   Mac OtherDevice)))
(declare-datatypes () ((Title    Perfect OtherTitle)))

;--- Functions -----------------------------------------------------
; Which project belongs to a person?
(declare-fun projectOf (Person) Project)

; In which language is a project written?
(declare-fun writtenIn (Project Language) Bool)

; Which device does a person use?
(declare-fun usingDevice (Person Device) Bool)

; Which song does a person play?
(declare-fun playsSong (Person Song) Bool)

; What is the title of a song?
(declare-fun title (Song) Title)

;--- Constants -----------------------------------------------------
(declare-const Sam   Person)
(declare-const song0 Song)   ; a concrete song that Sam may play

;--- Premises -------------------------------------------------------
; 1. A project is written either in C++ or Python (exclusive)
(assert (forall ((p Project))
        (or (writtenIn p Cpp) (writtenIn p Python))))
(assert (forall ((p Project))
        (not (and (writtenIn p Cpp) (writtenIn p Python)))))

; 2. If Sam does a project written in Python, he will not use a Mac.
(assert (=> (and (writtenIn (projectOf Sam) Python))
            (not (usingDevice Sam Mac))))

; 3. Sam is using a Mac.
(assert (usingDevice Sam Mac))

; 4. If Sam uses a Mac, he will play a song.
(assert (=> (usingDevice Sam Mac) (playsSong Sam song0)))

; 5. If a song is not titled "Perfect", Sam will never play it.
(assert (forall ((s Song))
        (=> (not (= (title s) Perfect))
            (not (playsSong Sam s)))))

; 6. The song Sam plays (song0) must be titled "Perfect" to satisfy (5).
(assert (= (title song0) Perfect))

;--- Test the statement ---------------------------------------------
; Statement: "The project Sam is doing is written in C++."
; We assert its negation and ask Z3 whether the whole theory is still
; satisfiable.  If UNSAT, the original statement is forced to be true.
(assert (not (writtenIn (projectOf Sam) Cpp)))

;--- Check ----------------------------------------------------------
(check-sat)   ; Expected result: unsat → the statement is true.
(get-model)   ; Optional: shows a concrete model (if SAT) – here not needed.