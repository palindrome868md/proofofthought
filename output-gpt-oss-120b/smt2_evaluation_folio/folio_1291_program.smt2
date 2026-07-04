;-------------------------------------------------
; Sorts (none needed – we use Booleans only)
;-------------------------------------------------

;-------------------------------------------------
; Predicates for Jack (as Boolean constants)
;-------------------------------------------------
(declare-const season Bool)      ; seasoned Google interviewer
(declare-const bfs Bool)         ; knows BFS
(declare-const queue Bool)       ; knows how to use a queue
(declare-const fifo Bool)        ; knows FIFO data structure
(declare-const human Bool)       ; has human rights
(declare-const life Bool)        ; right to life
(declare-const liberty Bool)     ; right to liberty
(declare-const deprived Bool)    ; can be deprived without due process

;-------------------------------------------------
; Knowledge base (the premises)
;-------------------------------------------------

; 1. Everyone that knows BFS knows how to use a queue.
(assert (=> bfs queue))

; 2. Seasoned Google interviewer ⇒ knows BFS.
(assert (=> season bfs))

; 3. Every person is either a seasoned interviewer at Google,
;    has human rights, or both.  For Jack we assert the disjunction.
(assert (or season human))

; 4. Human‑rights ⇒ right to life ∧ right to liberty.
(assert (=> human (and life liberty)))

; 5. Knowing how to use a queue ⇒ knows FIFO.
(assert (=> queue fifo))

; 6. Entitled to life ∧ liberty ⇒ cannot be deprived without due process.
(assert (=> (and life liberty) (not deprived)))

; 7. Jack is entitled to the right to life and liberty,
;    has human rights, **and** knows about FIFO.
;    (interpreted as all three facts holding.)
(assert life)
(assert liberty)
(assert human)
(assert fifo)

;-------------------------------------------------
; Test the statement:
; "Jack can be deprived of their rights without due process of law."
;-------------------------------------------------
(assert deprived)

;-------------------------------------------------
; Query
;-------------------------------------------------
(check-sat)   ; Expected: unsat → the statement is false.
(get-model)   ; (optional) model showing the inconsistency.