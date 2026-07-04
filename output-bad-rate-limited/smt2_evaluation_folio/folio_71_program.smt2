(declare-sort Problem 0)
(declare-datatypes () ((Level easy hard)))

(declare-fun level (Problem) Level)
(declare-fun ac-rate (Problem) Real)
(declare-fun recommended-to-novices (Problem) Bool)
(declare-fun stars (Problem) Int)

(declare-const two-sum Problem)
(declare-const four-sum Problem)

; Premises / Knowledge base
; 2Sum is recommended to novices
(assert (recommended-to-novices two-sum))

; 4Sum is starred by more than 1,000 users
(assert (> (stars four-sum) 1000))

; Rules
; Novice recommendations imply easy level
(assert (forall ((p Problem))
  (=> (recommended-to-novices p)
      (= (level p) easy))))

; A problem is either easy or hard
(assert (forall ((p Problem))
  (or (= (level p) easy)
      (= (level p) hard))))

; If stars > 1000, then hard
(assert (forall ((p Problem))
  (=> (> (stars p) 1000)
      (= (level p) hard))))

; Easy level implies AC rate is lower than 20 percent
(assert (forall ((p Problem))
  (=> (= (level p) easy)
      (< (ac-rate p) 20))))

; Test scenario: assume the statement would be true, i.e., ac-rate(two-sum) > 20
(assert (> (ac-rate two-sum) 20))

; Check satisfiability to verify the statement given the premises
(check-sat)
(get-model)