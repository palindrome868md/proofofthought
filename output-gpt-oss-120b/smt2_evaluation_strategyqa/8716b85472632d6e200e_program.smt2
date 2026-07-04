;--- Declarations -------------------------------------------------
(declare-sort Resort 0)

(declare-fun size (Resort) Int)
(declare-fun largest (Resort) Bool)

(declare-const disneyland-paris Resort)
(declare-const walt-disney-world Resort)
(declare-const hong-kong-disney Resort)

;--- Knowledge base -----------------------------------------------
; Sizes (arbitrary units reflecting real‑world ordering)
(assert (= (size disneyland-paris) 22))
(assert (= (size walt-disney-world) 110))
(assert (= (size hong-kong-disney) 12))

; Sizes are non‑negative
(assert (forall ((r Resort)) (>= (size r) 0)))

; Definition of “largest”: its size is at least the size of every resort
(assert (forall ((r Resort))
  (=> (largest r)
      (forall ((s Resort)) (>= (size r) (size s))))))

;--- Test the statement -------------------------------------------
; Claim: Disneyland Paris is the largest Disney resort
(assert (largest disneyland-paris))

;--- Solve ---------------------------------------------------------
(check-sat)
(get-model)