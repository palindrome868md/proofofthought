; Declare sorts
(declare-sort Building 0)
(declare-sort Person 0)

; Declare predicates / functions
(declare-fun isFiveStory (Building) Bool)
(declare-fun builtYear (Building) Int)
(declare-fun nrhpYear (Building) Int)
(declare-fun inPortland (Building) Bool)
(declare-fun worksAt (Person Building) Bool)

; Declare constants
(declare-const emmet Building)
(declare-const blake Building)
(declare-const john Person)

; Knowledge base (premises)
; Emmet Building is the same as Blake McFall Building
(assert (= emmet blake))

; Emmet Building facts
(assert (isFiveStory emmet))
(assert (inPortland emmet))
(assert (= (builtYear emmet) 1915))

; Blake Building NRHP facts (Note: NRHP year, not built year)
(assert (= (nrhpYear blake) 1990))

; John works at Emmet Building
(assert (worksAt john emmet))

; Question to verify: "A five-story building is built in 1915."
(assert (exists ((b Building))
  (and (isFiveStory b) (= (builtYear b) 1915))))

; Check satisfiability and provide a model
(check-sat)
(get-model)