; SMT-LIB 2.0 Program for Theorem Proving
; Problem: Verify the statement about TikTok based on given premises.

; 1. Declare Sorts
(declare-sort Entity 0)

; 2. Declare Functions (Predicates)
(declare-fun is-social-media-app (Entity) Bool)
(declare-fun has-chat-features (Entity) Bool)
(declare-fun is-software (Entity) Bool)
(declare-fun allows-send-messages (Entity) Bool)
(declare-fun has-video-features (Entity) Bool)
(declare-fun allows-upload-videos (Entity) Bool)
(declare-fun is-computer-program (Entity) Bool)
(declare-fun has-high-engagement (Entity) Bool)
(declare-fun is-addictive (Entity) Bool)
(declare-fun is-ideal-for-preteens (Entity) Bool)

; 3. Declare Constants
(declare-const tiktok Entity)

; 4. Assert Knowledge Base (Premises)

; Premise 1: All social media applications containing chat features are software.
(assert (forall ((x Entity))
  (=> (and (is-social-media-app x) (has-chat-features x))
      (is-software x))))

; Premise 2: All social media applications that allow users to send messages to each other have chat features.
(assert (forall ((x Entity))
  (=> (and (is-social-media-app x) (allows-send-messages x))
      (has-chat-features x))))

; Premise 3: All social media applications have chat features or video features.
(assert (forall ((x Entity))
  (=> (is-social-media-app x)
      (or (has-chat-features x) (has-video-features x)))))

; Premise 4: All social media applications that have video features allow users to upload videos.
(assert (forall ((x Entity))
  (=> (and (is-social-media-app x) (has-video-features x))
      (allows-upload-videos x))))

; Premise 5: All software that is social media applications are computer programs.
(assert (forall ((x Entity))
  (=> (and (is-software x) (is-social-media-app x))
      (is-computer-program x))))

; Premise 6: All social media applications that have high engagement metrics are addictive.
(assert (forall ((x Entity))
  (=> (and (is-social-media-app x) (has-high-engagement x))
      (is-addictive x))))

; Premise 7: If a social media application is addictive, then it is not ideal for preteens.
(assert (forall ((x Entity))
  (=> (and (is-social-media-app x) (is-addictive x))
      (not (is-ideal-for-preteens x)))))

; Premise 8: TikTok is a social media application.
(assert (is-social-media-app tiktok))

; Premise 9: TikTok is not ideal for preteens.
(assert (not (is-ideal-for-preteens tiktok)))

; 5. Assert the Statement to Verify
; Statement: TikTok does not have chat features or it is not a computer program.
; Logic: (or (not (has-chat-features tiktok)) (not (is-computer-program tiktok)))
(assert (or (not (has-chat-features tiktok))
            (not (is-computer-program tiktok))))

; 6. Check Satisfiability
; If 'sat', the statement is consistent with the premises (True/Possible).
; If 'unsat', the statement contradicts the premises (False).
(check-sat)
(get-model)