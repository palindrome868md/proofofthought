; Declare sorts
(declare-sort Vessel 0)
(declare-sort Location 0)

; Declare constants
(declare-const titanic Vessel)
(declare-const gulf_of_finland_bottom Location)

; Declare predicates / functions
(declare-fun at (Vessel Location) Bool)
(declare-fun well_preserved (Vessel Location) Bool)
(declare-fun suitable_for_wreck_preservation (Location) Bool)

; Knowledge base
(assert (at titanic gulf_of_finland_bottom))
(assert (not (suitable_for_wreck_preservation gulf_of_finland_bottom)))

; Rule: If a wreck is at a location not suitable for wreck preservation, then it is not well-preserved there
(assert (forall ((v Vessel) (l Location))
  (=> (and (at v l)
           (not (suitable_for_wreck_preservation l)))
      (not (well_preserved v l)))))

; Test scenario: Would the Titanic be well preserved at the bottom of the Gulf of Finland?
(assert (well_preserved titanic gulf_of_finland_bottom))

; Check satisfiability
(check-sat)