; ------------------------------------------------------------
;  Question: Is "double duty" an incorrect phrase for the host of
;  Dancing With The Stars (DWTS)?
; ------------------------------------------------------------

; 1. Declare uninterpreted sorts
(declare-sort Person 0)
(declare-sort Show   0)
(declare-sort Duty   0)
(declare-sort Phrase 0)

; 2. Declare constants for the entities involved
(declare-const host Person)            ; the host of DWTS
(declare-const dwts Show)              ; the show Dancing With The Stars
(declare-const double-duty Phrase)     ; the phrase "double duty"

; 3. Declare the predicate that records which duties a person performs
(declare-fun performs (Person Duty) Bool)

; 4. Declare two concrete duties (we only need two to express “two distinct duties”)
(declare-const hosting-duty Duty)      ; e.g. “hosting”
(declare-const judging-duty Duty)      ; e.g. “judging”

; 5. Knowledge base about the host
;    The host performs the hosting duty and does NOT perform a second, distinct duty.
(assert (performs host hosting-duty))
(assert (not (performs host judging-duty)))

; 6. Define when the phrase "double duty" is a *correct* description:
;    It is correct for a person on a show iff the person performs two
;    *different* duties.
(declare-fun correct_phrase (Phrase Person Show) Bool)

(assert (forall ((p Person) (ph Phrase) (s Show) (d1 Duty) (d2 Duty))
  (=> (and (= ph double-duty)
           (distinct d1 d2)
           (performs p d1)
           (performs p d2))
      (correct_phrase ph p s))))

; 7. Test the statement:
;    “double duty” is *incorrect* for the host of DWTS.
;    This is equivalent to asserting that the phrase is NOT a correct
;    description of that person/show pair.
(assert (not (correct_phrase double-duty host dwts)))

; 8. Query the solver
(check-sat)
(get-model)