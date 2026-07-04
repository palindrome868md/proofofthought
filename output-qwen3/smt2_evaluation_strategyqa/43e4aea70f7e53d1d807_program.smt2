; Declare sorts
(declare-sort Person 0)
(declare-sort Podcast 0)

; Declare functions
(declare-fun is-deacon (Person) Bool)
(declare-fun is-religious-clergy (Person) Bool)
(declare-fun is-fan-of (Person Podcast) Bool)
(declare-fun podcast-critiques-religion (Podcast) Bool)
(declare-fun respects-faith (Person) Bool)

; Declare constants
(declare-const test-person Person)
(declare-const god-awful-movies Podcast)

; Knowledge base
; Deacons are religious clergy
(assert (forall ((p Person))
  (=> (is-deacon p) (is-religious-clergy p))))

; Religious clergy respect their faith
(assert (forall ((p Person))
  (=> (is-religious-clergy p) (respects-faith p))))

; God Awful Movies is a podcast that critiques/mocks religion
(assert (podcast-critiques-religion god-awful-movies))

; People who respect their faith are not likely to be fans of content that critiques it
(assert (forall ((p Person) (pod Podcast))
  (=> (and (respects-faith p) (podcast-critiques-religion pod))
      (not (is-fan-of p pod)))))

; Test scenario: test-person is a Deacon
(assert (is-deacon test-person))

; Test: Would a Deacon be a fan of God Awful Movies?
(assert (is-fan-of test-person god-awful-movies))

; Check satisfiability
(check-sat)
(get-model)