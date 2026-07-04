;--- Declarations -------------------------------------------------
(declare-sort Person 0)

;--- Predicates ----------------------------------------------------
(declare-fun knowsBFS (Person) Bool)
(declare-fun knowsQueue (Person) Bool)
(declare-fun seasonedInterviewerGoogle (Person) Bool)
(declare-fun humanRights (Person) Bool)
(declare-fun entitledLifeLiberty (Person) Bool)
(declare-fun knowsFIFO (Person) Bool)
(declare-fun cannotBeDeprivedWithoutDueProcess (Person) Bool)

;--- Constants ------------------------------------------------------
(declare-const Jack Person)
(declare-const Witness Person)   ; for the existential premise

;--- Knowledge base ------------------------------------------------
; 1. Everyone that knows about BFS knows how to use a queue.
(assert (forall ((p Person))
  (=> (knowsBFS p) (knowsQueue p))))

; 2. Seasoned Google interviewers know what BFS is.
(assert (forall ((p Person))
  (=> (seasonedInterviewerGoogle p) (knowsBFS p))))

; 3. Existential: there is a person who is either seasoned Google interviewer
;    or has human rights (or both).
(assert (or (seasonedInterviewerGoogle Witness)
            (humanRights Witness)))

; 4. Every person who has human rights is entitled to life and liberty.
(assert (forall ((p Person))
  (=> (humanRights p) (entitledLifeLiberty p))))

; 5. Everyone that knows how to use a queue knows about FIFO.
(assert (forall ((p Person))
  (=> (knowsQueue p) (knowsFIFO p))))

; 6. Everyone entitled to life and liberty cannot be deprived without due process.
(assert (forall ((p Person))
  (=> (entitledLifeLiberty p) (cannotBeDeprivedWithoutDueProcess p))))

; 7. Jack's premise: entitled to life/liberty OR has human rights OR knows FIFO.
(assert (or (entitledLifeLiberty Jack)
            (humanRights Jack)
            (knowsFIFO Jack)))

;--- Test the statement --------------------------------------------
; Statement to verify: (cannotBeDeprivedWithoutDueProcess Jack)
; We assert its negation and check whether this leads to a contradiction.
(assert (not (cannotBeDeprivedWithoutDueProcess Jack)))

;--- Solve ---------------------------------------------------------
(check-sat)
(get-model)