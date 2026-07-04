;-------------------------------------------------
;  Sort declarations
;-------------------------------------------------
(declare-sort Person 0)
(declare-sort Institution 0)
(declare-sort Country 0)
(declare-sort Party 0)

;-------------------------------------------------
;  Function / predicate declarations
;-------------------------------------------------
; Basic facts
(declare-fun attended (Person Institution) Bool)           ; X attended institution I
(declare-fun isUniversity (Institution) Bool)              ; I is a university
(declare-fun located (Institution Country) Bool)           ; I is located in country C
(declare-fun supported (Person Party) Bool)                ; X supports party P
(declare-fun gotSeat (Person) Bool)                        ; X got a seat in Parliament
(declare-fun isPolitician (Person) Bool)                   ; X is a politician
(declare-fun satInHouse (Person) Bool)                     ; X sat in the House of Commons

; Derived predicate we want to test
(declare-fun AttendedUniversityInCountry (Person Country) Bool)

;-------------------------------------------------
;  Constant declarations (the individuals)
;-------------------------------------------------
(declare-const william-dickinson Person)
(declare-const university-of-edinburgh Institution)
(declare-const united-kingdom Country)
(declare-const westminster-school Institution)   ; just for completeness
(declare-const portland-whigs Party)

;-------------------------------------------------
;  Knowledge base (the premises)
;-------------------------------------------------
; William Dickinson was a British politician who sat in the House of Commons
(assert (isPolitician william-dickinson))
(assert (satInHouse william-dickinson))

; Educational background
(assert (attended william-dickinson university-of-edinburgh))
(assert (isUniversity university-of-edinburgh))
(assert (located university-of-edinburgh united-kingdom))

; Political affiliation
(assert (supported william-dickinson portland-whigs))

; Rule: People who supported the Portland Whigs did not get a seat in Parliament
(assert (forall ((p Person))
  (=> (supported p portland-whigs)
      (not (gotSeat p)))))

; Rule connecting attendance, university status and location to the derived predicate
(assert (forall ((p Person) (i Institution) (c Country))
  (=> (and (attended p i) (isUniversity i) (located i c))
      (AttendedUniversityInCountry p c))))

;-------------------------------------------------
;  Test the statement:
;  "William Dickinson attended university in the United Kingdom."
;-------------------------------------------------
(assert (AttendedUniversityInCountry william-dickinson united-kingdom))

;-------------------------------------------------
;  Query
;-------------------------------------------------
(check-sat)   ; Expected: sat  (the statement is true)
(get-model)