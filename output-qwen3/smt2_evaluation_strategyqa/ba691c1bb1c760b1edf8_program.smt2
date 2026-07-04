; The Little Prince - Allergy Verification
; Question: Was The Little Prince's titular character allergic to flowers?

; 1. Declare sorts
(declare-sort Character 0)
(declare-sort Plant 0)

; 2. Declare functions
(declare-fun is-allergic-to (Character Plant) Bool)
(declare-fun cares-for (Character Plant) Bool)
(declare-fun is-flower (Plant) Bool)
(declare-fun is-rose (Plant) Bool)
(declare-fun lives-on-same-planet (Character Plant) Bool)

; 3. Declare constants
(declare-const little-prince Character)
(declare-const his-rose Plant)

; 4. Assert knowledge base (facts from the story)

; The Little Prince has a rose on his asteroid
(assert (is-rose his-rose))

; A rose is a type of flower
(assert (is-flower his-rose))

; The Little Prince lives on the same planet as his rose
(assert (lives-on-same-planet little-prince his-rose))

; The Little Prince cares for his rose (waters it, protects it with a glass globe)
(assert (cares-for little-prince his-rose))

; Rule: If someone is allergic to a type of plant, they cannot care for it closely
; (allergic reactions would prevent intimate care)
(assert (forall ((c Character) (p Plant))
  (=> (and (is-flower p) (is-allergic-to c p))
      (not (cares-for c p)))))

; Rule: If someone lives in close proximity with a plant they're allergic to,
; they would show symptoms (we assume no symptoms are mentioned in the story)
(assert (forall ((c Character) (p Plant))
  (=> (and (lives-on-same-planet c p) (is-allergic-to c p))
      (not (cares-for c p)))))

; 5. Test the claim: Was the Little Prince allergic to flowers?
; We assert he WAS allergic and check if this is satisfiable
(assert (is-allergic-to little-prince his-rose))

; 6. Check satisfiability
(check-sat)
(get-model)

; Expected result: unsat
; Explanation: The knowledge base states the Little Prince cares for his rose,
; which is a flower. If he were allergic to flowers, he could not care for them.
; This creates a contradiction, so the claim is FALSE.
; Answer: NO, The Little Prince was NOT allergic to flowers.