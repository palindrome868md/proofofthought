;--- Sorts -------------------------------------------------
(declare-sort Person 0)

;--- Functions --------------------------------------------
(declare-fun age (Person) Int)                 ; age of a person
(declare-fun is_parent (Person) Bool)          ; is a parent
(declare-fun is_main_carer (Person) Bool)      ; main carer for child
(declare-fun lives_in_england (Person) Bool)   ; residence
(declare-fun is_british_citizen (Person) Bool) ; citizenship
(declare-fun has_legal_right (Person) Bool)    ; right to live/study
(declare-fun is_university_course (Person) Bool) ; studying at university
(declare-fun is_apprentice_salary (Person) Bool) ; apprentice with salary
(declare-fun eligible_care_to_learn (Person) Bool) ; eligibility predicate

;--- Constants --------------------------------------------
(declare-const niece Person)

;--- Knowledge base ----------------------------------------
; Age under 20
(assert (= (age niece) 19))

; Parent and main carer
(assert (is_parent niece))
(assert (is_main_carer niece))

; Lives in England and is British
(assert (lives_in_england niece))
(assert (is_british_citizen niece))

; No special legal‑right needed (already British)
(assert (not (has_legal_right niece)))

; She is studying at a university → disqualifying condition
(assert (is_university_course niece))

; Not an apprentice with a salary
(assert (not (is_apprentice_salary niece)))

;--- Eligibility rule (derived from the document) ---------
; To be eligible, *all* the following must hold:
; - age < 20
; - parent and main carer
; - lives in England
; - British or has legal right
; - NOT a university course
; - NOT an apprentice with salary
(assert (forall ((p Person))
  (=> (eligible_care_to_learn p)
      (and (< (age p) 20)
           (is_parent p)
           (is_main_carer p)
           (lives_in_england p)
           (or (is_british_citizen p) (has_legal_right p))
           (not (is_university_course p))
           (not (is_apprentice_salary p))))))

;--- Test the question --------------------------------------
; Can she qualify?  (i.e., is she eligible?)
(assert (eligible_care_to_learn niece))

;--- Decision ------------------------------------------------
(check-sat)   ; Expected result: unsat (she cannot qualify)
(get-model)