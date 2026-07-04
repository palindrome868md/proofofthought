;--- Sort declaration ---------------------------------------------------------
(declare-sort Entity 0)

;--- Constant symbols ---------------------------------------------------------
(declare-const baldEagle Entity)
(declare-const cow Entity)
(declare-const tiger Entity)

;--- Predicate symbols (all Boolean) -----------------------------------------
(declare-fun chases (Entity Entity) Bool)
(declare-fun needs  (Entity Entity) Bool)
(declare-fun sees   (Entity Entity) Bool)
(declare-fun kind   (Entity)       Bool)
(declare-fun red    (Entity)       Bool)
(declare-fun blue   (Entity)       Bool)
(declare-fun green  (Entity)       Bool)
(declare-fun young  (Entity)       Bool)

;--- Facts --------------------------------------------------------------------
(assert (chases baldEagle tiger))
(assert (needs  baldEagle tiger))
(assert (sees   baldEagle cow))
(assert (sees   baldEagle tiger))

(assert (chases cow tiger))
(assert (kind   cow))
(assert (red    cow))
(assert (sees   cow baldEagle))
(assert (sees   cow tiger))

(assert (chases tiger baldEagle))
(assert (chases tiger cow))
(assert (blue   tiger))
(assert (kind   tiger))
(assert (red    tiger))
(assert (needs  tiger baldEagle))

;--- Rules --------------------------------------------------------------------
; Young ∧ kind → green
(assert (forall ((x Entity))
        (=> (and (young x) (kind x)) (green x))))

; If someone needs the tiger and the tiger needs the cow then the cow is young
(assert (forall ((s Entity))
        (=> (and (needs s tiger) (needs tiger cow)) (young cow))))

; If someone sees the tiger then the tiger needs the cow
(assert (forall ((x Entity))
        (=> (sees x tiger) (needs tiger cow))))

; If someone needs the bald eagle and the bald eagle chases the tiger then the bald eagle sees the cow
(assert (forall ((s Entity))
        (=> (and (needs s baldEagle) (chases baldEagle tiger))
            (sees baldEagle cow))))

; Red ∧ needs tiger → blue
(assert (forall ((x Entity))
        (=> (and (red x) (needs x tiger)) (blue x))))

;--- Test the statement: "The cow is not young." ----------------------------
(assert (not (young cow)))

;--- Check satisfiability ----------------------------------------------------
(check-sat)
(get-model)