; Question: If you were on a diet, would you have to skip lunch at McDonald's?
; This tests whether being on a diet NECESSARILY prevents eating at McDonald's

; Declare sorts
(declare-sort Person 0)
(declare-sort Food 0)
(declare-sort Restaurant 0)

; Declare functions
(declare-fun on-diet (Person) Bool)
(declare-fun eat-at (Person Restaurant Food) Bool)
(declare-fun is-diet-compatible (Food) Bool)
(declare-fun served-at (Food Restaurant) Bool)

; Declare constants
(declare-const me Person)
(declare-const mcdonalds Restaurant)
(declare-const lunch-food Food)

; Knowledge Base

; Rule 1: If you're on a diet, you can only eat diet-compatible food
(assert (forall ((p Person) (r Restaurant) (f Food))
  (=> (and (on-diet p) (eat-at p r f))
      (is-diet-compatible f))))

; Rule 2: You can only eat food that is served at the restaurant
(assert (forall ((p Person) (r Restaurant) (f Food))
  (=> (eat-at p r f)
      (served-at f r))))

; Fact 1: McDonald's serves some diet-compatible options (salads, grilled chicken, etc.)
(assert (exists ((f Food))
  (and (served-at f mcdonalds) (is-diet-compatible f))))

; Fact 2: I am on a diet
(assert (on-diet me))

; Verification Test: Can I eat at McDonald's while on a diet?
; We assert that I DO eat at McDonald's and check if this is satisfiable
; If sat = I don't HAVE to skip (answer is NO)
; If unsat = I must skip (answer is YES)

; Assert that there exists diet-compatible food at McDonald's that I can eat
(declare-const mcd-food Food)
(assert (served-at mcd-food mcdonalds))
(assert (is-diet-compatible mcd-food))
(assert (eat-at me mcdonalds mcd-food))

; Check satisfiability
(check-sat)
(get-model)

; Expected result: sat (satisfiable)
; Interpretation: Being on a diet does NOT require skipping McDonald's
; because diet-compatible options exist there