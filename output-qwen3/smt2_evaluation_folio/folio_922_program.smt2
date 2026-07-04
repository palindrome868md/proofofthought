; Reasoning Steps:
; 1. Analyze Premises:
;    - P1: AtEvent(x) & YoungAdult(x) -> LikesIndependence(x)
;    - P2: AtEvent(x) & CollegeStudent(x) -> YoungAdult(x)
;    - P3: AtEvent(x) & YaleStudent(x) -> CollegeStudent(x)
;    - P4: AtEvent(x) -> YaleStudent(x) | HarvardStudent(x)
;    - P5: AtEvent(x) & HarvardStudent(x) -> Diligent(x)
;    - P6: AtEvent(Susan)
;    - P7: HarvardStudent(Susan) -> YoungAdult(Susan)
;    - P8: YaleStudent(Susan) -> ~LikesIndependence(Susan)
;
; 2. Logical Deduction:
;    - From P6 & P4, Susan is Yale or Harvard.
;    - If Susan is Yale:
;      - P3 -> CollegeStudent
;      - P2 -> YoungAdult
;      - P1 -> LikesIndependence
;      - P8 -> ~LikesIndependence
;      - Contradiction. So Susan is NOT Yale.
;    - Therefore, Susan MUST be Harvard.
;    - If Susan is Harvard:
;      - P5 -> Diligent
;      - P7 -> YoungAdult -> P1 -> LikesIndependence
;    - Conclusion: Susan LikesIndependence AND Diligent is TRUE.
;
; 3. SMT2 Verification:
;    - Assert all premises.
;    - Assert the statement (LikesIndependence(susan) AND Diligent(susan)).
;    - Check satisfiability. Expected: sat (True).

; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare functions (predicates)
(declare-fun AtEvent (Person) Bool)
(declare-fun YoungAdult (Person) Bool)
(declare-fun LikesIndependence (Person) Bool)
(declare-fun CollegeStudent (Person) Bool)
(declare-fun YaleStudent (Person) Bool)
(declare-fun HarvardStudent (Person) Bool)
(declare-fun Diligent (Person) Bool)

; 3. Declare constants
(declare-const susan Person)

; 4. Assert knowledge base (premises)

; P1: All young adults at the event like independence.
(assert (forall ((p Person))
  (=> (and (AtEvent p) (YoungAdult p))
      (LikesIndependence p))))

; P2: All college students at the event are young adults.
(assert (forall ((p Person))
  (=> (and (AtEvent p) (CollegeStudent p))
      (YoungAdult p))))

; P3: All Yale students at the event are college students.
(assert (forall ((p Person))
  (=> (and (AtEvent p) (YaleStudent p))
      (CollegeStudent p))))

; P4: Everyone at the event is a Yale student or a Harvard student.
(assert (forall ((p Person))
  (=> (AtEvent p)
      (or (YaleStudent p) (HarvardStudent p)))))

; P5: All Harvard students at the event are diligent.
(assert (forall ((p Person))
  (=> (and (AtEvent p) (HarvardStudent p))
      (Diligent p))))

; P6: Susan is at the event.
(assert (AtEvent susan))

; P7: If Susan is a Harvard student, then she is a young adult.
(assert (=> (HarvardStudent susan)
            (YoungAdult susan)))

; P8: If Susan is a Yale student, then she does not like independence.
(assert (=> (YaleStudent susan)
            (not (LikesIndependence susan))))

; 5. Assert the statement to verify
; Statement: Susan likes independence and is diligent.
(assert (and (LikesIndependence susan)
             (Diligent susan)))

; 6. Check satisfiability
; Expected: sat (indicating the statement is True/Consistent with KB)
(check-sat)
(get-model)