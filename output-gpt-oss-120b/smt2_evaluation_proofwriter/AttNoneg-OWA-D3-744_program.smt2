;--- 1. Declare the sort for all individuals
(declare-sort Entity 0)

;--- 2. Declare unary predicates (properties)
(declare-fun furry (Entity) Bool)
(declare-fun rough (Entity) Bool)
(declare-fun white (Entity) Bool)
(declare-fun young (Entity) Bool)
(declare-fun nice (Entity) Bool)
(declare-fun red (Entity) Bool)
(declare-fun round (Entity) Bool)

;--- 3. Declare the constant symbols
(declare-const charlie Entity)
(declare-const fiona Entity)
(declare-const harry Entity)

;--- 4. Assert the given facts
(assert (furry charlie))
(assert (rough charlie))
(assert (white charlie))
(assert (young charlie))

(assert (nice fiona))
(assert (red fiona))
(assert (round fiona))
(assert (white fiona))
(assert (young fiona))

(assert (nice harry))
(assert (red harry))
(assert (round harry))

;--- 5. Universal rules
; All young and white things are rough
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

;--- 6. Test the query: "Harry is young."
(assert (young harry))

;--- 7. Check satisfiability (sat ⇒ true, unsat ⇒ false)
(check-sat)
(get-model)