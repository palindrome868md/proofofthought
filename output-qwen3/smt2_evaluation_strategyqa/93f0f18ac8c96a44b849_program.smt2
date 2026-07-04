; Question: Was Lil Jon's top ranked Billboard song a collaboration with a member of The Lox?
; Answer: NO - His top song "Yeah!" featured Usher and Ludacris, not The Lox members

; Declare sorts
(declare-sort Artist 0)
(declare-sort Song 0)

; Declare functions
(declare-fun is-top-song (Artist Song) Bool)
(declare-fun features (Song Artist) Bool)
(declare-fun is-lox-member (Artist) Bool)

; Declare constants - Artists
(declare-const lil-jon Artist)
(declare-const usher Artist)
(declare-const ludacris Artist)
(declare-const jadakiss Artist)
(declare-const sheek Artist)
(declare-const styles-p Artist)

; Declare constants - Song
(declare-const yeah-song Song)

; Declare test artist for verification
(declare-const test-collaborator Artist)

; Knowledge Base

; "Yeah!" is Lil Jon's top ranked Billboard song
(assert (is-top-song lil-jon yeah-song))

; The song features Usher and Ludacris
(assert (features yeah-song usher))
(assert (features yeah-song ludacris))

; The Lox members
(assert (is-lox-member jadakiss))
(assert (is-lox-member sheek))
(assert (is-lox-member styles-p))

; Usher and Ludacris are NOT Lox members
(assert (not (is-lox-member usher)))
(assert (not (is-lox-member ludacris)))

; Rule: The top song only features known collaborators (Usher and Ludacris)
(assert (forall ((s Song) (a Artist))
  (=> (and (is-top-song lil-jon s) (features s a))
      (or (= a usher) (= a ludacris)))))

; Verification Test: Assert that a Lox member collaborated on the top song
; If UNSAT, then NO Lox member was on the top song (answer is NO)
(assert (is-lox-member test-collaborator))
(assert (features yeah-song test-collaborator))

; Check satisfiability
(check-sat)
; Expected: unsat (meaning the top song did NOT feature a Lox member)

(get-model)