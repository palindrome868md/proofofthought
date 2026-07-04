; 1. Declare sorts
(declare-sort App 0)

; 2. Declare functions (predicates)
(declare-fun is-social-media (App) Bool)
(declare-fun has-chat (App) Bool)
(declare-fun is-software (App) Bool)
(declare-fun send-messages (App) Bool)
(declare-fun has-video (App) Bool)
(declare-fun upload-videos (App) Bool)
(declare-fun is-computer-program (App) Bool)
(declare-fun high-engagement (App) Bool)
(declare-fun is-addictive (App) Bool)
(declare-fun ideal-preteens (App) Bool)

; 3. Declare constants
(declare-const tiktok App)

; 4. Assert knowledge base (premises)

; Premise 1: All social media applications containing chat features are software.
(assert (forall ((x App))
  (=> (and (is-social-media x) (has-chat x))
      (is-software x))))

; Premise 2: All social media applications that allow users to send messages to each other have chat features.
(assert (forall ((x App))
  (=> (and (is-social-media x) (send-messages x))
      (has-chat x))))

; Premise 3: All social media applications have chat features or video features.
(assert (forall ((x App))
  (=> (is-social-media x)
      (or (has-chat x) (has-video x)))))

; Premise 4: All social media applications that have video features allow users to upload videos.
(assert (forall ((x App))
  (=> (and (is-social-media x) (has-video x))
      (upload-videos x))))

; Premise 5: All software that is social media applications are computer programs.
(assert (forall ((x App))
  (=> (and (is-software x) (is-social-media x))
      (is-computer-program x))))

; Premise 6: All social media applications that have high engagement metrics are addictive.
(assert (forall ((x App))
  (=> (and (is-social-media x) (high-engagement x))
      (is-addictive x))))

; Premise 7: If a social media application is addictive, then it is not ideal for preteens.
(assert (forall ((x App))
  (=> (and (is-social-media x) (is-addictive x))
      (not (ideal-preteens x)))))

; Premise 8: TikTok is a social media application, and it is not ideal for preteens.
(assert (is-social-media tiktok))
(assert (not (ideal-preteens tiktok)))

; 5. Test the statement
; Statement: TikTok is either ideal for preteens or a computer program.
; Logic: (or (ideal-preteens tiktok) (is-computer-program tiktok))
; Since we know (not (ideal-preteens tiktok)), this tests if (is-computer-program tiktok) is consistent.
(assert (or (ideal-preteens tiktok) (is-computer-program tiktok)))

; 6. Check satisfiability
(check-sat)
(get-model)