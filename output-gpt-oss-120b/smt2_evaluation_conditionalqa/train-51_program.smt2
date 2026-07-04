;--- Sort declarations -------------------------------------------------
(declare-sort Person 0)
(declare-sort Org 0)

;--- Function / predicate declarations ---------------------------------
; ex_employee(p, o)  –  p was employed by organisation o
(declare-fun ex_employee (Person Org) Bool)

; eligible_fuel(p)   –  p is entitled to a fuel payment under NCFS
(declare-fun eligible_fuel (Person) Bool)

;--- Constant declarations ---------------------------------------------
; The person speaking (the retiree)
(declare-const me Person)

; Relevant organisations
(declare-const ncb Org)   ; National Coal Board
(declare-const bcc Org)   ; British Coal Corporation

;--- Knowledge base ----------------------------------------------------
; The retiree worked for the National Coal Board
(assert (ex_employee me ncb))

; Rule: any ex‑employee of NCB or BCC is eligible for the fuel scheme
(assert (forall ((p Person) (o Org))
  (=> (and (ex_employee p o)
           (or (= o ncb) (= o bcc)))
      (eligible_fuel p))))

;--- Test the query ----------------------------------------------------
; Ask: Is the retiree eligible for a fuel payment?
(assert (eligible_fuel me))

;--- Solving -----------------------------------------------------------
(check-sat)