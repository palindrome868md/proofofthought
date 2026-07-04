; Warm Home Discount Eligibility Verification
; Question: Are we eligible for the warm home discount even though we receive savings credit?

; 1. Declare sorts
(declare-sort Person 0)
(declare-sort Benefit 0)
(declare-sort Supplier 0)

; 2. Declare benefit constants
(declare-const guarantee-credit Benefit)
(declare-const savings-credit Benefit)

; 3. Declare functions/predicates
(declare-fun receives (Person Benefit) Bool)
(declare-fun name-on-bill (Person) Bool)
(declare-fun supplier-part-of-scheme (Supplier) Bool)
(declare-fun eligible-for-warm-home-discount (Person) Bool)

; 4. Declare scenario constants
(declare-const husband Person)
(declare-const wife Person)
(declare-const their-supplier Supplier)

; 5. Knowledge Base - Eligibility Rules from Document
; Core group eligibility: Gets Guarantee Credit element of Pension Credit
; (even if you get Savings Credit as well), name on bill, supplier in scheme
(assert (forall ((p Person) (s Supplier))
  (=> (and (receives p guarantee-credit)
           (name-on-bill p)
           (supplier-part-of-scheme s))
      (eligible-for-warm-home-discount p))))

; 6. Scenario Facts
; The couple receives both Guarantee Credit and Savings Credit
(assert (receives husband guarantee-credit))
(assert (receives husband savings-credit))
; Name is on the bill
(assert (name-on-bill husband))
; Supplier is part of the scheme
(assert (supplier-part-of-scheme their-supplier))

; 7. Verification Test
; To verify eligibility, we assert the NEGATION and check for unsat
; If unsat, it means they ARE eligible (negation creates contradiction)
(assert (not (eligible-for-warm-home-discount husband)))

; 8. Check satisfiability
(check-sat)
; Expected result: unsat (proves they ARE eligible for warm home discount)
; The document explicitly states: "you or your partner are getting the 
; Guarantee Credit element of Pension Credit (even if you get Savings Credit as well)"

(get-model)