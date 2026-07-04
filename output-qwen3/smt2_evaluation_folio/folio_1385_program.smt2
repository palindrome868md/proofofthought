; Reasoning Steps:
; 1. Define the domain: We use a generic sort 'Entity' to represent applications, software, etc.
; 2. Define predicates for properties: is-social-media, has-chat, is-software, is-computer-program, etc.
; 3. Define constant: 'tiktok'.
; 4. Translate Premises into Assertions:
;    - P1: SM + Chat -> Software
;    - P2: SM + Messages -> Chat
;    - P3: SM -> Chat OR Video
;    - P4: SM + Video -> Upload
;    - P5: Software + SM -> Computer Program
;    - P6: SM + High Engagement -> Addictive
;    - P7: SM + Addictive -> Not Ideal for Preteens
;    - P8: TikTok is SM AND TikTok is Not Ideal for Preteens
; 5. Verification Strategy:
;    - The question asks if "TikTok is a computer program" is True.
;    - Per instructions: Assert the statement and check satisfiability.
;    - 'sat' means True (Consistent/Entailed), 'unsat' means False (Contradiction).
;    - We assert (is-computer-program tiktok).

; 1. Declare Sorts
(declare-sort Entity 0)

; 2. Declare Functions (Predicates)
(declare-fun is-social-media (Entity) Bool)
(declare-fun has-chat (Entity) Bool)
(declare-fun is-software (Entity) Bool)
(declare-fun allows-messages (Entity) Bool)
(declare-fun has-video (Entity) Bool)
(declare-fun allows-upload (Entity) Bool)
(declare-fun is-computer-program (Entity) Bool)
(declare-fun has-high-engagement (Entity) Bool)
(declare-fun is-addictive (Entity) Bool)
(declare-fun is-ideal-preteens (Entity) Bool)

; 3. Declare Constants
(declare-const tiktok Entity)

; 4. Assert Knowledge Base (Premises)

; Premise 1: All social media applications containing chat features are software.
(assert (forall ((x Entity)) 
  (=> (and (is-social-media x) (has-chat x)) 
      (is-software x))))

; Premise 2: All social media applications that allow users to send messages to each other have chat features.
(assert (forall ((x Entity)) 
  (=> (and (is-social-media x) (allows-messages x)) 
      (has-chat x))))

; Premise 3: All social media applications have chat features or video features.
(assert (forall ((x Entity)) 
  (=> (is-social-media x) 
      (or (has-chat x) (has-video x)))))

; Premise 4: All social media applications that have video features allow users to upload videos.
(assert (forall ((x Entity)) 
  (=> (and (is-social-media x) (has-video x)) 
      (allows-upload x))))

; Premise 5: All software that is social media applications are computer programs.
(assert (forall ((x Entity)) 
  (=> (and (is-software x) (is-social-media x)) 
      (is-computer-program x))))

; Premise 6: All social media applications that have high engagement metrics are addictive.
(assert (forall ((x Entity)) 
  (=> (and (is-social-media x) (has-high-engagement x)) 
      (is-addictive x))))

; Premise 7: If a social media application is addictive, then it is not ideal for preteens.
(assert (forall ((x Entity)) 
  (=> (and (is-social-media x) (is-addictive x)) 
      (not (is-ideal-preteens x)))))

; Premise 8: TikTok is a social media application, and it is not ideal for preteens.
(assert (is-social-media tiktok))
(assert (not (is-ideal-preteens tiktok)))

; 5. Verify Statement: "TikTok is a computer program."
; Assert the statement to check if it is consistent (sat = True) or contradictory (unsat = False).
(assert (is-computer-program tiktok))

; 6. Check Satisfiability
(check-sat)
(get-model)