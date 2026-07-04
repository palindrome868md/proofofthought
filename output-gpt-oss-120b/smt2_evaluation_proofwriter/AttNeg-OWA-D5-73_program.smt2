; -------------------------------------------------
; Sort declaration
; -------------------------------------------------
(declare-sort Person 0)

; -------------------------------------------------
; Predicate (Boolean function) declarations
; -------------------------------------------------
(declare-fun nice   (Person) Bool)
(declare-fun cold   (Person) Bool)
(declare-fun red    (Person) Bool)
(declare-fun rough  (Person) Bool)
(declare-fun quiet  (Person) Bool)
(declare-fun round  (Person) Bool)
(declare-fun green  (Person) Bool)

; -------------------------------------------------
; Constant (individual) declarations
; -------------------------------------------------
(declare-const anne    Person)
(declare-const bob     Person)
(declare-const charlie Person)
(declare-const harry   Person)

; -------------------------------------------------
; Knowledge base: facts
; -------------------------------------------------
(assert (nice anne))
(assert (cold bob))
(assert (not (red bob)))      ; Bob is not red (given)
(assert (rough bob))

(assert (red charlie))
(assert (rough charlie))

(assert (nice harry))
(assert (quiet harry))
(assert (rough harry))
(assert (round harry))

; -------------------------------------------------
; Knowledge base: rules (implications)
; -------------------------------------------------
; Nice people are quiet.
(assert (forall ((x Person))
          (=> (nice x) (quiet x))))

; If someone is red and nice then they are not quiet.
(assert (forall ((x Person))
          (=> (and (red x) (nice x))
              (not (quiet x)))))

; Quiet people are cold.
(assert (forall ((x Person))
          (=> (quiet x) (cold x))))

; If someone is quiet and round then they are not red.
(assert (forall ((x Person))
          (=> (and (quiet x) (round x))
              (not (red x)))))

; If someone is green and quiet then they are round.
(assert (forall ((x Person))
          (=> (and (green x) (quiet x))
              (round x))))

; If someone is cold then they are green.
(assert (forall ((x Person))
          (=> (cold x) (green x))))

; -------------------------------------------------
; Verification query: "Bob is not red."
; -------------------------------------------------
(assert (not (red bob)))   ; test the statement

; -------------------------------------------------
; Check satisfiability (sat means the statement is true)
; -------------------------------------------------
(check-sat)
(get-model)