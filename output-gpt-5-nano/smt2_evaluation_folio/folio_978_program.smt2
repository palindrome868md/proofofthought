; Sorts
(declare-sort Person 0)

; Predicates
(declare-fun WentToClaySchool (Person) Bool)
(declare-fun LiveInCalifornia (Person) Bool)
(declare-fun AttendsYoga (Person) Bool)
(declare-fun MakesMatcha (Person) Bool)
(declare-fun PrefersWorkAtHome (Person) Bool)
(declare-fun HasRegularNineToFiveJob (Person) Bool)
(declare-fun EntertainmentCelebrity (Person) Bool)
(declare-fun WakeUpLate (Person) Bool)
(declare-fun StartPastNoon (Person) Bool)

; Constants
(declare-const bunny Person)

; Premises
(assert (forall ((p Person))
  (=> (and (WentToClaySchool p) (MakesMatcha p))
      (and (not (WakeUpLate p)) (StartPastNoon p)))))

(assert (forall ((p Person))
  (=> (and (WentToClaySchool p) (LiveInCalifornia p) (AttendsYoga p))
      (MakesMatcha p))))

(assert (forall ((p Person))
  (=> (and (WentToClaySchool p) (EntertainmentCelebrity p))
      (and (WakeUpLate p) (StartPastNoon p)))))

(assert (forall ((p Person))
  (=> (and (WentToClaySchool p) (not (HasRegularNineToFiveJob p)))
      (EntertainmentCelebrity p))))

(assert (forall ((p Person))
  (=> (and (WentToClaySchool p) (PrefersWorkAtHome p))
      (not (HasRegularNineToFiveJob p)))))

; Bunny's given condition
(assert (WentToClaySchool bunny))
(assert (or (and (PrefersWorkAtHome bunny) (MakesMatcha bunny))
            (and (not (PrefersWorkAtHome bunny)) (not (MakesMatcha bunny)))))

; Verification target S:
; S = "Bunny went to Clay's school and she neither prefers working at home over going to the office nor lives in California and attends yoga classes regularly."
; Test: is S entailed? Check by asserting not S and solving.

(assert (not (and (WentToClaySchool bunny)
                  (not (PrefersWorkAtHome bunny))
                  (not (and (LiveInCalifornia bunny) (AttendsYoga bunny))))))

; Check satisfiability
(check-sat)
(get-model)