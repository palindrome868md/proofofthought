; Declare sorts
(declare-sort Place 0)

; Declare predicates
(declare-fun is-groundhog-present (Place) Bool)
(declare-fun has-seasonal-change (Place) Bool)
(declare-fun is-good-location (Place) Bool)

; Declare constants
(declare-const antarctica Place)

; Knowledge base
; 1) Antarctica has no groundhog
(assert (not (is-groundhog-present antarctica)))
; 2) Antarctica has no significant seasonal change
(assert (not (has-seasonal-change antarctica)))

; Rule: A location is good for Groundhog Day if it has a groundhog and seasonal change
(assert (forall ((p Place))
  (=> (and (is-groundhog-present p) (has-seasonal-change p))
      (is-good-location p))))

; Rule: If not both conditions, then it is not a good location
(assert (forall ((p Place))
  (=> (or (not (is-groundhog-present p)) (not (has-seasonal-change p)))
      (not (is-good-location p)))))

; Test: Is Antarctica a good location for Groundhog Day?
(assert (is-good-location antarctica))

; Check satisfiability
(check-sat)
(get-model)