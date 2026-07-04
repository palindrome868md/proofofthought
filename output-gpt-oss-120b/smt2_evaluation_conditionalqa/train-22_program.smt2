; Declare sorts
(declare-sort Person 0)
(declare-sort Marriage 0)

; Declare functions / predicates
(declare-fun is_void (Marriage) Bool)        ; marriage is void
(declare-fun is_voidable (Marriage) Bool)    ; marriage is voidable
(declare-fun can_annul (Marriage) Bool)      ; can obtain an annulment

; Declare the specific marriage in question
(declare-const myMarriage Marriage)

; Knowledge base: the marriage is neither void nor voidable
(assert (not (is_void myMarriage)))          ; not a void marriage
(assert (not (is_voidable myMarriage)))      ; not a voidable marriage

; Legal rule: an annulment is possible only if the marriage is void or voidable
(assert (forall ((m Marriage))
  (=> (can_annul m) (or (is_void m) (is_voidable m)))))

; Test the question: "Can I get an annulment?"
(assert (can_annul myMarriage))

; Check satisfiability
(check-sat)   ; Expected result: unsat (cannot get an annulment)
(get-model)   ; (optional) model, not reachable because unsat