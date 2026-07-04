; 1. Declare the sort of trees
(declare-sort Tree 0)

; 2. Declare predicates
(declare-fun deciduous (Tree) Bool)          ; deciduous(t) = true iff t is a deciduous tree
(declare-fun similar   (Tree Tree) Bool)    ; similar(t1,t2) = true iff the two trees are similar

; 3. Declare the relevant tree constants
(declare-const christmas Tree)          ; a Christmas tree
(declare-const deciduous-tree Tree)     ; an arbitrary deciduous tree

; 4. Knowledge base
; Christmas trees are not deciduous (they are typically evergreen)
(assert (not (deciduous christmas)))

; The other constant is a deciduous tree
(assert (deciduous deciduous-tree))

; General rule: if exactly one of two trees is deciduous, they are not similar
(assert (forall ((t1 Tree) (t2 Tree))
  (=> (or (and (deciduous t1) (not (deciduous t2)))
          (and (not (deciduous t1)) (deciduous t2)))
      (not (similar t1 t2)))))

; 5. Query: are Christmas trees dissimilar to deciduous trees?
;   → assert the negation of similarity and see if the constraints are satisfiable
(assert (not (similar christmas deciduous-tree)))

; 6. Ask Z3 to check the constraints
(check-sat)
(get-model)