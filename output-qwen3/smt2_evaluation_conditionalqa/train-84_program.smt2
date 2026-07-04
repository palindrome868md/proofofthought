; 1. Declare sorts
(declare-sort Person 0)
(declare-sort Marriage 0)

; 2. Declare functions
(declare-fun ApplyForGRC (Person) Bool)
(declare-fun IsMarried (Person Marriage) Bool)
(declare-fun CanStayMarried (Person Marriage) Bool)
(declare-fun MarriageStatusChanges (Person Marriage) Bool)

; 3. Declare constants
(declare-const applicant Person)
(declare-const my-marriage Marriage)

; 4. Assert knowledge base (facts and rules from document)

; Fact: Applicant is applying for GRC
(assert (ApplyForGRC applicant))

; Fact: Applicant is married
(assert (IsMarried applicant my-marriage))

; Rule: "You can stay married if you apply for a Gender Recognition Certificate."
; This implies that applying does not force the marriage status to change (end).
; We model "CanStayMarried" as true if applying and married.
(assert (forall ((p Person) (m Marriage))
  (=> (and (ApplyForGRC p) (IsMarried p m))
      (CanStayMarried p m))))

; Rule: If one can stay married, the marriage status does not necessarily change (end).
; "MarriageStatusChanges" here represents an involuntary or mandatory change (dissolution).
; If CanStayMarried is true, then mandatory change is false.
(assert (forall ((p Person) (m Marriage))
  (=> (CanStayMarried p m)
      (not (MarriageStatusChanges p m)))))

; 5. Verification
; Question: "Will my marriage's legal status change?"
; Interpretation: "Is a change in marriage status (dissolution) mandatory/inevitable?"
; To verify "No", we assert that it DOES change (is mandatory) and check for contradiction.
; If unsat, it means it is NOT mandatory (Answer: No).

(assert (MarriageStatusChanges applicant my-marriage))

; 6. Check satisfiability
(check-sat)
; Expected: unsat (False, the marriage status does not have to change)
(get-model)