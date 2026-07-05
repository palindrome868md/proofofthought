; Care to Learn eligibility reasoning (one verification per question)

; Sorts
(declare-sort Person 0)
(declare-sort Course 0)
(declare-sort Child 0)
(declare-sort Provider 0)

; Predicates / functions
(declare-fun start-age (Person) Int)
(declare-fun main-carer (Person Child) Bool)
(declare-fun live-in-england (Person) Bool)
(declare-fun has-right-to-live (Person) Bool)
(declare-fun course-qualifies (Course) Bool)
(declare-fun provider-qualifies (Provider) Bool)
(declare-fun he-course (Course) Bool)

; Constants
(declare-const niece Person)
(declare-const baby Child)
(declare-const bath-pharmacy Course)
(declare-const bath-provider Provider)

; Knowledge base (scenario setup)
(assert (= (start-age niece) 19))
(assert (main-carer niece baby))
(assert (live-in-england niece))
(assert (has-right-to-live niece))
(assert (course-qualifies bath-pharmacy))
(assert (provider-qualifies bath-provider))
(assert (he-course bath-pharmacy))

; Eligibility predicate
(declare-fun care-to-learn-eligible (Person Child Course) Bool)

; Rules: under 20 at start, main carer, England, right to live, course qualifies, provider qualifies
; -> care-to-learn-eligible
(assert (forall ((p Person) (c Course))
  (=> (and (= p niece)
           (= c bath-pharmacy)
           (< (start-age p) 20)
           (main-carer p baby)
           (live-in-england p)
           (has-right-to-live p)
           (course-qualifies c)
           (provider-qualifies bath-provider))
      (care-to-learn-eligible p baby c))))

; Not eligible if HE course
(assert (=> (and (< (start-age niece) 20)
             (main-carer niece baby)
             (live-in-england niece)
             (has-right-to-live niece)
             (course-qualifies bath-pharmacy)
             (provider-qualifies bath-provider)
             (he-course bath-pharmacy))
            (not (care-to-learn-eligible niece baby bath-pharmacy))))

; Test: Can she qualify? (assert the scenario that she would qualify)
(assert (care-to-learn-eligible niece baby bath-pharmacy))

; Verification: answer the question with a single check
(check-sat)