; Declare sorts
(declare-sort Location 0)
(declare-sort ReligiousSymbol 0)
(declare-sort Religion 0)

; Declare functions
(declare-fun city-in-country (Location Location) Bool)
(declare-fun dominant-religion (Location) Religion)
(declare-fun symbol-associated-religion (ReligiousSymbol) Religion)
(declare-fun commonly-found (ReligiousSymbol Location) Bool)

; Declare constants
(declare-const karachi Location)
(declare-const pakistan Location)
(declare-const crucifix ReligiousSymbol)
(declare-const christianity Religion)
(declare-const islam Religion)

; Knowledge Base Facts

; Karachi is in Pakistan
(assert (city-in-country karachi pakistan))

; Pakistan's dominant religion is Islam
(assert (= (dominant-religion pakistan) islam))

; A crucifix is a Christian symbol
(assert (= (symbol-associated-religion crucifix) christianity))

; Christianity and Islam are different religions
(assert (not (= christianity islam)))

; Rule: A religious symbol is commonly found in a location only if
; the associated religion is dominant in that location's country
(assert (forall ((sym ReligiousSymbol) (loc Location) (country Location) (rel Religion))
  (=> (and (city-in-country loc country)
           (commonly-found sym loc)
           (= (symbol-associated-religion sym) rel))
      (= (dominant-religion country) rel))))

; Test: Is a crucifix commonly found in Karachi?
; (This tests if you are "likely to find" a crucifix there)
(assert (commonly-found crucifix karachi))

; Check satisfiability
(check-sat)
(get-model)