; 1. Declare sorts
(declare-sort Entity 0)

; 2. Declare functions (predicates)
(declare-fun furry (Entity) Bool)
(declare-fun rough (Entity) Bool)
(declare-fun white (Entity) Bool)
(declare-fun young (Entity) Bool)
(declare-fun nice (Entity) Bool)
(declare-fun red (Entity) Bool)
(declare-fun round (Entity) Bool)

; 3. Declare constants
(declare-const charlie Entity)
(declare-const fiona Entity)
(declare-const harry Entity)

; 4. Assert knowledge base (facts)
; Charlie's properties
(assert (furry charlie))
(assert (rough charlie))
(assert (white charlie))
(assert (young charlie))

; Fiona's properties
(assert (nice fiona))
(assert (red fiona))
(assert (round fiona))
(assert (white fiona))
(assert (young fiona))

; Harry's properties
(assert (nice harry))
(assert (red harry))
(assert (round harry))

; Rules
; All young, white things are rough
(assert (forall ((x Entity))
  (=> (and (young x) (white x))
      (rough x))))

; All round things are white
(assert (forall ((x Entity))
  (=> (round x)
      (white x))))

; All white things are young
(assert (forall ((x Entity))
  (=> (white x)
      (young x))))

; 5. Verification: Harry is young
; Assert the claim to test its consistency/entailment
(assert (young harry))

; 6. Check satisfiability
(check-sat)
(get-model)