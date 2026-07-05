(set-logic AUFLIA)

; Sort
(declare-sort Person 0)

; Predicates
(declare-fun knows-bfs (Person) Bool)
(declare-fun knows-queue (Person) Bool)
(declare-fun knows-fifo (Person) Bool)
(declare-fun is-ssei-google (Person) Bool)
(declare-fun has-human-rights (Person) Bool)
(declare-fun ent-rightLifeLiberty (Person) Bool)
(declare-fun deprived-without-due-process (Person) Bool)

; Constant
(declare-const jack Person)

; 1) BFS -> queue
(assert (forall ((p Person)) (=> (knows-bfs p) (knows-queue p))))
; 2) SSEI-Google -> BFS
(assert (forall ((p Person)) (=> (is-ssei-google p) (knows-bfs p))))
; 3)Every person is either SSEI-Google or has human rights (or both)
(assert (forall ((p Person)) (or (is-ssei-google p) (has-human-rights p))))
; 4) If someone has human rights then ent-rightLifeLiberty
(assert (forall ((p Person)) (=> (has-human-rights p) (ent-rightLifeLiberty p))))
; 5) knows-queue -> knows-fifo
(assert (forall ((p Person)) (=> (knows-queue p) (knows-fifo p))))
; 6) ent-rightLifeLiberty -> not deprived without due process
(assert (forall ((p Person)) (=> (ent-rightLifeLiberty p) (not (deprived-without-due-process p)))))
; 7) Jack satisfies: ent-rightLifeLiberty or has-human-rights or knows FIFO
(assert (or (ent-rightLifeLiberty jack) (has-human-rights jack) (knows-fifo jack)))

; Test: Jack can be deprived without due process
(assert (deprived-without-due-process jack))

; Check whether the statement is satisfiable (i.e., can be true under the premises)
(check-sat)
(get-model)