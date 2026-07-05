(declare-sort Person 0)

(declare-const you Person)
(declare-const current-year Int)
(declare-const injury-year-you Int)
(declare-const illness-start-year-you Int)
(declare-const member-you Bool)

(assert (= current-year 2026))
(assert (= injury-year-you 2016))        ; injured 10 years ago
(assert (= illness-start-year-you 2023))  ; illness started after injury (late onset)
(assert member-you)                        ; you are a current or former member of the armed forces

; AFCS eligibility: either injury-after-2005 within 7 years, or late-onset illness within 7 years of its start
(assert
  (and member-you
       (or
         (and (> injury-year-you 2005)
              (<= (- current-year injury-year-you) 7))
         (and (> illness-start-year-you injury-year-you)
              (<= (- current-year illness-start-year-you) 7))
       )
  )
)

(check-sat)
(get-model)