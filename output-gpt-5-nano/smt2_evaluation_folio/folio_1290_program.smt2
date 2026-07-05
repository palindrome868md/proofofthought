; Sorts
(declare-sort Person 0)

; Constants
(declare-const jack Person)

; Predicates
(declare-fun google_sei (Person) Bool)          ; Google SEI status
(declare-fun has_human_rights (Person) Bool)    ; Has human rights
(declare-fun entitle_life_liberty (Person) Bool) ; Entitled to life and liberty
(declare-fun knows_bfs (Person) Bool)           ; knows breadth-first-search
(declare-fun knows_queue (Person) Bool)         ; knows how to use a queue
(declare-fun knows_fifo (Person) Bool)          ; knows about FIFO data structure
(declare-fun deprived_without_due_process (Person) Bool) ; can be deprived without due process

; 1) BFS knowledge implies queue knowledge
(assert (forall ((p Person))
  (=> (google_sei p) (knows_bfs p))))
; 2) BFS -> queue
(assert (forall ((p Person))
  (=> (knows_bfs p) (knows_queue p))))
; 3) queue -> FIFO
(assert (forall ((p Person))
  (=> (knows_queue p) (knows_fifo p))))
; 4) HR -> life and liberty entitlement
(assert (forall ((p Person))
  (=> (has_human_rights p) (entitle_life_liberty p))))
; 5) Universal: everyone is either Google SEI or has human rights
(assert (forall ((p Person))
  (or (google_sei p) (has_human_rights p))))
; 6) Entitlement cannot be deprived without due process
(assert (forall ((p Person))
  (=> (entitle_life_liberty p)
      (not (deprived_without_due_process p)))))

; 7) Jack's given condition: at least one of the three holds
(assert (or (entitle_life_liberty jack)
            (has_human_rights jack)
            (knows_fifo jack)))

; Test scenario: negation of the statement "Jack cannot be deprived of their rights without due process"
; Negation is: "Jack can be deprived without due process" (deprived_without_due_process jack)
(assert (deprived_without_due_process jack))

; Check satisfiability to determine truth of the statement
(check-sat)