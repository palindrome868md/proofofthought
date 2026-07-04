; Question: Can the Powerpuff Girls form a complete tag team wrestling match?
; Reasoning: A tag team match requires 2 teams with 2 wrestlers each (4 total)
; The Powerpuff Girls are only 3 members (Blossom, Bubbles, Buttercup)

; Declare sorts
(declare-sort Wrestler 0)

; Declare functions
(declare-fun is-powerpuff-girl (Wrestler) Bool)
(declare-fun num-powerpuff-girls () Int)
(declare-fun min-wrestlers-for-tag-team () Int)

; Declare constants for the three Powerpuff Girls
(declare-const blossom Wrestler)
(declare-const bubbles Wrestler)
(declare-const buttercup Wrestler)

; Knowledge Base: There are exactly 3 Powerpuff Girls
(assert (is-powerpuff-girl blossom))
(assert (is-powerpuff-girl bubbles))
(assert (is-powerpuff-girl buttercup))
(assert (= (num-powerpuff-girls) 3))

; Rule: A complete tag team wrestling match requires 4 wrestlers (2 teams of 2)
(assert (= (min-wrestlers-for-tag-team) 4))

; Rule: To form a complete tag team, you need at least the minimum number of wrestlers
(assert (forall ((n Int) (min Int))
  (=> (and (= n (num-powerpuff-girls)) (= min (min-wrestlers-for-tag-team)))
      (=> (>= n min)
          (can-form-tag-team)))))

; Test: Assert that the Powerpuff Girls CAN form a complete tag team
; If this is unsatisfiable, the answer is NO
(declare-fun can-form-tag-team () Bool)
(assert can-form-tag-team)

; Check satisfiability
(check-sat)
(get-model)