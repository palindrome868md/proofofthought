; Declare sorts
(declare-sort Person 0)
(declare-sort Course 0)
(declare-sort Provider 0)

; Declare constants
(declare-const me Person)
(declare-const my-course Course)
(declare-const childcare-provider Provider)

; Predicates / functions
(declare-fun age (Person) Int)
(declare-fun lives-in-england (Person) Bool)
(declare-fun main-carer (Person) Bool)

(declare-fun is-publicly-funded (Course) Bool)
(declare-fun course-qualifies (Course) Bool)
(declare-fun provider-eligible (Course Provider) Bool)
(declare-fun ofsted-registered (Provider) Bool)

; Test predicate: can the Care to Learn claim be made for this scenario?
(declare-fun care-to-learn-claim (Person Course Provider) Bool)

; Knowledge base (scenario)
; You are 19 at start of course
(assert (= (age me) 19))
; You live in England (London fits here)
(assert (lives-in-england me))
; You are the main carer
(assert (main-carer me))

; The course is publicly funded and qualifies
(assert (is-publicly-funded my-course))
(assert (course-qualifies my-course))

; Your childcare provider qualifies (Ofsted registered)
(assert (ofsted-registered childcare-provider))
; The provider is eligible for Care to Learn for this course
(assert (provider-eligible my-course childcare-provider))

; You can claim Care to Learn for this scenario
(assert (care-to-learn-claim me my-course childcare-provider))

; Check satisfiability: does the Care to Learn claim hold given the scenario?
(check-sat)
(get-model)