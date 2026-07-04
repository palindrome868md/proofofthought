; Question: Are Christmas trees dissimilar to deciduous trees?
; Strategy: Test if a tree can be BOTH a Christmas tree AND a deciduous tree
; If unsat, they are dissimilar (mutually exclusive categories)

; 1. Declare sort for trees
(declare-sort Tree 0)

; 2. Declare predicates for tree properties
(declare-fun is-christmas-tree (Tree) Bool)
(declare-fun is-deciduous (Tree) Bool)
(declare-fun is-evergreen (Tree) Bool)

; 3. Declare constant for testing
(declare-const test-tree Tree)

; 4. Knowledge base: Christmas trees are evergreen conifers
(assert (forall ((t Tree))
  (=> (is-christmas-tree t)
      (is-evergreen t))))

; 5. Knowledge base: Deciduous trees are NOT evergreen (they lose leaves seasonally)
(assert (forall ((t Tree))
  (=> (is-deciduous t)
      (not (is-evergreen t)))))

; 6. Test: Can a tree be both Christmas tree AND deciduous?
(assert (is-christmas-tree test-tree))
(assert (is-deciduous test-tree))

; 7. Check satisfiability
(check-sat)
; Expected: unsat (Christmas trees and deciduous trees are dissimilar)

; 8. Get model (will show no model exists if unsat)
(get-model)