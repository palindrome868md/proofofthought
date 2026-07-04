; Reasoning about whether Antarctica is a good location for Groundhog Day

; 1. Declare sorts
(declare-sort Location 0)
(declare-sort Animal 0)

; 2. Declare functions
(declare-fun has-groundhogs (Location) Bool)
(declare-fun has-suitable-weather (Location) Bool)
(declare-fun has-cultural-tradition (Location) Bool)
(declare-fun good-for-groundhog-day (Location) Bool)
(declare-fun native-to (Animal Location) Bool)

; 3. Declare constants
(declare-const antarctica Location)
(declare-const north-america Location)
(declare-const groundhog Animal)

; 4. Knowledge base (facts about Groundhog Day requirements)

; Groundhog Day requires groundhogs to be present at the location
(assert (forall ((l Location))
  (=> (good-for-groundhog-day l)
      (has-groundhogs l))))

; Groundhogs are native to North America, not Antarctica
(assert (native-to groundhog north-america))
(assert (not (native-to groundhog antarctica)))

; If groundhogs aren't native to a location, they don't naturally exist there
(assert (forall ((a Animal) (l Location))
  (=> (and (not (native-to a l)) (not (has-groundhogs l)))
      (not (has-groundhogs l)))))

; Groundhogs only exist where they are native (simplified rule)
(assert (forall ((l Location))
  (=> (has-groundhogs l)
      (native-to groundhog l))))

; Antarctica has no cultural tradition of Groundhog Day
(assert (not (has-cultural-tradition antarctica)))

; Good Groundhog Day locations should have cultural tradition
(assert (forall ((l Location))
  (=> (good-for-groundhog-day l)
      (has-cultural-tradition l))))

; 5. Test: Is Antarctica a good location for Groundhog Day?
(assert (good-for-groundhog-day antarctica))

; 6. Check satisfiability
(check-sat)
; Expected: unsat (Antarctica is NOT a good location for Groundhog Day)
; Reason: No groundhogs native there, no cultural tradition

(get-model)