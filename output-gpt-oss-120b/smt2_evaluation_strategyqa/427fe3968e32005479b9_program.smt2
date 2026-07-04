;--- Sort declarations ----------------------------------------------------
(declare-sort Person 0)
(declare-sort Bone   0)
(declare-sort Team   0)
(declare-sort Cup    0)

;--- Function declarations ------------------------------------------------
; Does a person have a given bone?
(declare-fun has-bone (Person Bone) Bool)

; Is a person a member of a team?
(declare-fun member-of (Person Team) Bool)

; Does a team win a particular cup?
(declare-fun wins (Team Cup) Bool)

;--- Constant declarations ------------------------------------------------
; The specific bone and trophy we care about
(declare-const tibia       Bone)
(declare-const stanley-cup Cup)

; Witnesses for the counter‑example
(declare-const p1 Person)   ; a person who may lack a tibia
(declare-const t1 Team)     ; a team that wins the Cup

;--- Knowledge base -------------------------------------------------------
; (No facts linking bones to winning; the world is otherwise unrestricted.)

;--- Formalisation of the necessity claim ---------------------------------
; "If a team wins the Stanley Cup, then every member of that team has a tibia."
(assert (forall ((t Team) (p Person))
        (=> (and (wins t stanley-cup) (member-of p t))
            (has-bone p tibia))))

;--- Counter‑example: a winning team with a member that lacks a tibia -----
(assert (wins t1 stanley-cup))               ; the team does win
(assert (member-of p1 t1))                  ; p1 is on that team
(assert (not (has-bone p1 tibia)))          ; p1 does NOT have a tibia

;--- Check the consistency of the above assertions ------------------------
(check-sat)
(get-model)