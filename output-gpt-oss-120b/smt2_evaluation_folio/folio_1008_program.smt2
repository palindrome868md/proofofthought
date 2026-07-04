;--- Sorts ---------------------------------------------------------
(declare-sort Person 0)

;--- Predicate functions (all return Bool) ------------------------
(declare-fun attend-wedding (Person) Bool)
(declare-fun getting-married (Person) Bool)
(declare-fun knows-people-getting-married (Person) Bool)
(declare-fun enjoy-celebrating (Person) Bool)
(declare-fun fond-large-group (Person) Bool)
(declare-fun outgoing (Person) Bool)
(declare-fun spirited (Person) Bool)
(declare-fun preteen-or-youngchild (Person) Bool)

;--- Individual ----------------------------------------------------
(declare-const carol Person)

;--- Premise 1: attendees are getting married or know the people ----
(assert (forall ((p Person))
  (=> (attend-wedding p)
      (or (getting-married p)
          (knows-people-getting-married p)))))

;--- Premise 2: no pre‑teens/young children are married or know -----
(assert (forall ((p Person))
  (=> (preteen-or-youngchild p)
      (and (not (getting-married p))
           (not (knows-people-getting-married p))))))

;--- Premise 3: celebrating ⇒ attending weddings --------------------
(assert (forall ((p Person))
  (=> (enjoy-celebrating p)
      (attend-wedding p))))

;--- Premise 4: fond of large groups ⇒ celebrating -----------------
(assert (forall ((p Person))
  (=> (fond-large-group p)
      (enjoy-celebrating p))))

;--- Premise 5: outgoing ∧ spirited ⇒ fond of large groups ---------
(assert (forall ((p Person))
  (=> (and (outgoing p) (spirited p))
      (fond-large-group p))))

;--- Premise 6: conditional about Carol ----------------------------
; If Carol is NOT (pre‑teen‑or‑young‑child AND attends a wedding),
; then Carol is NOT getting married OR she knows the people getting married.
(assert (=> (not (and (preteen-or-youngchild carol)
                      (attend-wedding carol)))
            (or (not (getting-married carol))
                (knows-people-getting-married carol))))

;--- Test the negation of the statement:
; “Carol is outgoing and very spirited.”  (We ask if its negation can hold)
(assert (not (and (outgoing carol) (spirited carol))))

;--- Check whether the premises together with the negation are consistent
(check-sat)
(get-model)