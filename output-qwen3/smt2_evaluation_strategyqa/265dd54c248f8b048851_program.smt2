; Question: Do the anchors on Rede Globo speak Chinese?
; This is a factual question - we test if the claim is consistent with known facts

; 1. Declare sorts
(declare-sort Person 0)
(declare-sort Network 0)
(declare-sort Language 0)

; 2. Declare functions
(declare-fun is-anchor (Person) Bool)
(declare-fun works-on (Person Network) Bool)
(declare-fun speaks (Person Language) Bool)
(declare-fun is-brazilian-network (Network) Bool)
(declare-fun country-of-network (Network) String)

; 3. Declare constants
(declare-const rede-globo Network)
(declare-const brazil String)
(declare-const china String)
(declare-const portuguese Language)
(declare-const chinese Language)
(declare-const test-anchor Person)

; 4. Knowledge base - Facts about Rede Globo
(assert (is-brazilian-network rede-globo))
(assert (= (country-of-network rede-globo) brazil))

; Rule: Brazilian networks have Portuguese as their primary broadcast language
(assert (forall ((p Person) (n Network))
  (=> (and (is-anchor p) 
           (works-on p n) 
           (is-brazilian-network n))
      (speaks p portuguese))))

; Rule: Anchors primarily speak the language of their country's network
; (This doesn't preclude other languages, but Chinese is not typical for Brazilian anchors)
(assert (forall ((p Person) (n Network) (lang Language))
  (=> (and (is-anchor p)
           (works-on p n)
           (is-brazilian-network n)
           (= (country-of-network n) brazil)
           (speaks p lang))
      (= lang portuguese))))

; 5. Test scenario - Assume an anchor on Rede Globo speaks Chinese
(assert (is-anchor test-anchor))
(assert (works-on test-anchor rede-globo))
(assert (speaks test-anchor chinese))

; 6. Check satisfiability
; If unsat: The claim contradicts our knowledge (anchors do NOT speak Chinese)
; If sat: The claim is possible (anchors COULD speak Chinese)
(check-sat)
(get-model)