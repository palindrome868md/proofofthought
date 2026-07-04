; Question: Was a person sold a Creative Commons License for Botticelli's 
; The Birth of Venus ripped off?

; This requires reasoning about:
; 1. The copyright status of The Birth of Venus (public domain)
; 2. Whether Creative Commons licenses apply to public domain works
; 3. Whether selling such a license constitutes fraud

; Declare sorts
(declare-sort Artwork 0)
(declare-sort License 0)
(declare-sort Sale 0)
(declare-sort Person 0)

; Declare functions
(declare-fun is-public-domain (Artwork) Bool)
(declare-fun is-copyrighted (Artwork) Bool)
(declare-fun requires-license-for-use (Artwork) Bool)
(declare-fun can-validly-sell-license (License Artwork) Bool)
(declare-fun is-deceptive-sale (Sale) Bool)
(declare-fun sale-involves-artwork (Sale Artwork) Bool)
(declare-fun sale-involves-license (Sale License) Bool)
(declare-fun buyer-was-ripped-off (Sale) Bool)

; Declare constants
(declare-const birth-of-venus Artwork)
(declare-const cc-license License)
(declare-const the-sale Sale)
(declare-const the-buyer Person)

; Knowledge Base

; Fact 1: Botticelli's Birth of Venus was painted in the 1480s
; Works older than 70+ years after creator's death are public domain
(assert (is-public-domain birth-of-venus))

; Fact 2: Public domain works are not copyrighted
(assert (forall ((a Artwork))
  (=> (is-public-domain a)
      (not (is-copyrighted a)))))

; Fact 3: Only copyrighted works require licenses for use
(assert (forall ((a Artwork))
  (=> (not (is-copyrighted a))
      (not (requires-license-for-use a)))))

; Fact 4: You cannot validly sell a license for public domain work
(assert (forall ((l License) (a Artwork))
  (=> (is-public-domain a)
      (not (can-validly-sell-license l a)))))

; Fact 5: Selling a license that cannot be validly sold is deceptive
(assert (forall ((s Sale) (l License) (a Artwork))
  (=> (and (sale-involves-license s l)
           (sale-involves-artwork s a)
           (not (can-validly-sell-license l a)))
      (is-deceptive-sale s))))

; Fact 6: Deceptive sales mean the buyer was ripped off
(assert (forall ((s Sale))
  (=> (is-deceptive-sale s)
      (buyer-was-ripped-off s))))

; Scenario: This sale involves Birth of Venus and a CC license
(assert (sale-involves-artwork the-sale birth-of-venus))
(assert (sale-involves-license the-sale cc-license))

; Verification Test: Was the buyer ripped off?
(assert (buyer-was-ripped-off the-sale))

; Check satisfiability
(check-sat)
(get-model)