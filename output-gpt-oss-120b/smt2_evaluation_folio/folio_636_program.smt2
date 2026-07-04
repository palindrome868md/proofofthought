; -------------------------------------------------
; 1. Declare sorts
; -------------------------------------------------
(declare-sort Person 0)
(declare-sort Institution 0)
(declare-sort Country 0)
(declare-sort Party 0)

; -------------------------------------------------
; 2. Declare predicates / functions
; -------------------------------------------------
(declare-fun politician (Person) Bool)
(declare-fun attended (Person Institution) Bool)
(declare-fun isUniversity (Institution) Bool)
(declare-fun located (Institution Country) Bool)
(declare-fun supported (Person Party) Bool)
(declare-fun gotSeat (Person) Bool)

; -------------------------------------------------
; 3. Declare constants (the concrete individuals)
; -------------------------------------------------
(declare-const william Person)
(declare-const westminster Institution)
(declare-const edinburgh Institution)
(declare-const uk Country)
(declare-const portlandWhigs Party)

; -------------------------------------------------
; 4. Assert the premises (knowledge base)
; -------------------------------------------------
; William Dickinson was a British politician (we only need the politician fact)
(assert (politician william))

; Education facts
(assert (attended william westminster))          ; high school
(assert (attended william edinburgh))            ; university
(assert (isUniversity edinburgh))
(assert (located edinburgh uk))

; Political support
(assert (supported william portlandWhigs))

; General rule: supporters of the Portland Whigs did NOT get a seat
(assert (forall ((p Person))
          (=> (supported p portlandWhigs)
              (not (gotSeat p)))))

; -------------------------------------------------
; 5. Test the target statement:
;    "William Dickinson did not get a seat in Parliament."
; -------------------------------------------------
(assert (not (gotSeat william)))   ; i.e., he did NOT get a seat

; -------------------------------------------------
; 6. Check satisfiability
; -------------------------------------------------
(check-sat)        ; Expected: sat  → the statement is true
(get-model)