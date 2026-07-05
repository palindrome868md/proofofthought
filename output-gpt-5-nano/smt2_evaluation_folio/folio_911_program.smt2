; Sorts
(declare-sort Person 0)

; Predicates
(declare-fun Kid (Person) Bool)
(declare-fun Young (Person) Bool)
(declare-fun Elderly (Person) Bool)
(declare-fun Pirate (Person) Bool)
(declare-fun Seafarer (Person) Bool)
(declare-fun Toddler (Person) Bool)

; Constants
(declare-const Nancy Person)

; Premises (Knowledge Base)
(assert (forall ((p Person)) (=> (Kid p) (Young p))))
(assert (forall ((p Person)) (=> (Toddler p) (Kid p))))
(assert (forall ((p Person)) (=> (Young p) (not (Elderly p)))))
(assert (forall ((p Person)) (=> (Pirate p) (Seafarer p))))
(assert (=> (not (Pirate Nancy)) (Young Nancy)))
(assert (=> (not (Toddler Nancy)) (Seafarer Nancy)))

; Statement to test: S = (Pirate Nancy ∧ Toddler Nancy) ∨ (¬Pirate Nancy ∧ ¬Toddler Nancy)
; We test the negation of S to determine if S is entailed by the knowledge base.
(assert (not (or (and (Pirate Nancy) (Toddler Nancy))
                 (and (not (Pirate Nancy)) (not (Toddler Nancy))))))

; Verification
(check-sat)
(get-model)