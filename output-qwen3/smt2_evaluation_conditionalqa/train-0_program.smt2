; SMT-LIB 2.0 Program for Probate Entitlement Reasoning
; Question: Does the child have greater right to probate than the paternal uncle?

; 1. Declare sorts
(declare-sort Person 0)
(declare-sort Relationship 0)

; 2. Declare functions
; Entitlement order (lower number = higher priority)
(declare-fun entitlement-order (Relationship) Int)

; Family relationships
(declare-fun is-child (Person Person) Bool)
(declare-fun is-brother (Person Person) Bool)
(declare-fun is-spouse (Person Person) Bool)
(declare-fun is-widower (Person) Bool)

; 3. Declare constants
(declare-const deceased Person)
(declare-const user Person)
(declare-const paternal-uncle Person)

(declare-const child-rel Relationship)
(declare-const sibling-rel Relationship)
(declare-const spouse-rel Relationship)

; 4. Assert knowledge base from the document

; Entitlement order for intestate succession (from document)
; 1 = spouse/civil partner, 2 = children, 3 = grandchildren, etc.
; 6 = brothers and sisters, 12 = aunts and uncles
(assert (= (entitlement-order spouse-rel) 1))
(assert (= (entitlement-order child-rel) 2))
(assert (= (entitlement-order sibling-rel) 6))

; The deceased was a widower (no surviving spouse)
(assert (is-widower deceased))

; User is the child of the deceased
(assert (is-child user deceased))

; Paternal uncle is the brother of the deceased
(assert (is-brother paternal-uncle deceased))

; No surviving spouse (widower means spouse died before)
(assert (not (is-spouse user deceased)))
(assert (not (is-spouse paternal-uncle deceased)))

; Rule: Most entitled inheritor can apply for probate
; Lower entitlement-order number = higher priority
(assert (forall ((p1 Person) (p2 Person) (r1 Relationship) (r2 Relationship))
  (=> (and (is-child p1 deceased)
           (is-brother p2 deceased)
           (= r1 child-rel)
           (= r2 sibling-rel))
      (< (entitlement-order r1) (entitlement-order r2)))))

; 5. Test: Does the user (child) have greater right than the uncle (sibling)?
; Greater right means lower entitlement-order number
(assert (and (is-child user deceased)
             (is-brother paternal-uncle deceased)
             (< (entitlement-order child-rel)
                (entitlement-order sibling-rel))))

; 6. Check satisfiability
(check-sat)
(get-model)