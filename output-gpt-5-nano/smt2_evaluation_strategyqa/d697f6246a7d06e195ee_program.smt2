; Question: Are Christmas trees dissimilar to deciduous trees?

; 1. Declare sorts
(declare-sort Tree 0)

; 2. Declare constants
(declare-const christmas-tree Tree)
(declare-const deciduous-tree Tree)

; 3. Declare predicates
(declare-fun evergreen (Tree) Bool)
(declare-fun dissimilar (Tree Tree) Bool)

; 4. Knowledge base (facts)
(assert (evergreen christmas-tree))             ; Christmas trees are evergreen
(assert (not (evergreen deciduous-tree)))       ; Deciduous trees are not evergreen

; 5. Rule: if a is evergreen and b is not evergreen, then a and b are dissimilar
(assert (forall ((a Tree) (b Tree))
  (=> (and (evergreen a) (not (evergreen b)))
      (dissimilar a b))))

; 6. Test scenario: Are christmas-tree and deciduous-tree dissimilar?
(assert (dissimilar christmas-tree deciduous-tree))

; 7. Check satisfiability and produce a model
(check-sat)
(get-model)