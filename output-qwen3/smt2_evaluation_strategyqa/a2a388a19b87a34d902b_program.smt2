; Question: Did land owners elect their rulers in the Kingdom of Hungary?
; Historical Answer: Yes - the Hungarian nobility (land owners) participated in electing kings

; 1. Declare sorts
(declare-sort Person 0)
(declare-sort Kingdom 0)

; 2. Declare functions
(declare-fun is-land-owner (Person) Bool)
(declare-fun is-ruler (Person Kingdom) Bool)
(declare-fun elects (Person Person Kingdom) Bool)
(declare-fun belongs-to (Person Kingdom) Bool)
(declare-fun has-elective-monarchy (Kingdom) Bool)

; 3. Declare constants
(declare-const hungary Kingdom)
(declare-const hungarian-noble Person)
(declare-const hungarian-king Person)

; 4. Assert knowledge base (historical facts)
(assert (is-land-owner hungarian-noble))
(assert (is-ruler hungarian-king hungary))
(assert (belongs-to hungarian-noble hungary))
(assert (has-elective-monarchy hungary))

; Rule: In kingdoms with elective monarchy, land owners elect rulers
(assert (forall ((n Person) (r Person) (k Kingdom))
  (=> (and (has-elective-monarchy k)
           (is-land-owner n)
           (is-ruler r k)
           (belongs-to n k))
      (elects n r k))))

; 5. Test: Did land owners elect their rulers in Kingdom of Hungary?
(assert (elects hungarian-noble hungarian-king hungary))

; 6. Check satisfiability
(check-sat)
(get-model)