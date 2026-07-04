;--- Sort declarations -------------------------------------------------
(declare-sort Person 0)
(declare-sort Metal 0)
(declare-sort Color 0)

;--- Function declarations ---------------------------------------------
; Did a person get exposed to a metal?
(declare-fun exposed-to (Person Metal) Bool)
; What is the current skin colour of a person?
(declare-fun skin-color (Person) Color)

;--- Constant declarations ---------------------------------------------
(declare-const john Person)          ; a concrete person to test
(declare-const nickel Metal)        ; the metal nickel
(declare-const zombie Color)        ; the "zombie" skin colour

;--- Knowledge base ----------------------------------------------------
; Rule: Nickel exposure never results in zombie‑coloured skin
(assert (forall ((p Person))
  (=> (exposed-to p nickel)
      (not (= (skin-color p) zombie)))))

; Fact: John has been exposed to nickel
(assert (exposed-to john nickel))

;--- Test scenario ------------------------------------------------------
; Suppose John’s skin is the zombie colour
(assert (= (skin-color john) zombie))

;--- Verification -------------------------------------------------------
(check-sat)   ; Expected result: unsat (cannot be because of nickel)
(get-model)