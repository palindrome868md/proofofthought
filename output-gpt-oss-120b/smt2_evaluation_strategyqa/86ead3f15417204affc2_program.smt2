; ---------- Sorts ----------
(declare-sort Person 0)   ; uninterpreted sort for people

; ---------- Predicates ----------
; Predicate indicating that a person is a member of B'nei Yisrael (i.e., Jewish)
(declare-fun bnei-yisrael (Person) Bool)

; ---------- Constants ----------
(declare-const dustin-hoffman Person)

; ---------- Knowledge Base ----------
; Fact: Dustin Hoffman is of Jewish heritage, therefore he is B'nei Yisrael
(assert (bnei-yisrael dustin-hoffman))

; ---------- Query ----------
; Test the statement: "Dustin Hoffman is one of the B'nei Yisrael"
(assert (bnei-yisrael dustin-hoffman))

; ---------- Solving ----------
(check-sat)    ; Expected result: sat (the statement is true)
(get-model)    ; Optional: shows a model witnessing the truth of the assertion