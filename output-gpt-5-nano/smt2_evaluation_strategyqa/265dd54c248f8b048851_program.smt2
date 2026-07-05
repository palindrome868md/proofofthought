; 1) Sorts
(declare-sort Person 0)
(declare-sort Network 0)

; 2) Language datatype
(declare-datatypes () ((Language chinese portuguese)))

; 3) Predicates
(declare-fun is-anchor (Person Network) Bool)
(declare-fun speaks (Person Language) Bool)

; 4) Constants
(declare-const rede-globo Network)
(declare-const anchor-chinese Person)

; 5) Knowledge base (KB)
; Rule: No anchor of Rede Globo speaks Chinese
(assert (forall ((p Person))
  (=> (is-anchor p rede-globo)
      (not (speaks p chinese)))))

; 6) Test scenario: assert existence of an anchor of Rede Globo who speaks Chinese
(assert (is-anchor anchor-chinese rede-globo))
(assert (speaks anchor-chinese chinese))

; 7) Question: Do the anchors on Rede Globo speak Chinese?
(check-sat)
(get-model)