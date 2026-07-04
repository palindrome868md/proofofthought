; ==============================================================================
; REASONING STEPS:
; ==============================================================================
; 1. Analyze Premises:
;    - P1: Sam is doing a project.
;    - P2: Project language is C++ or Python. (Modeled as Enum Sort)
;    - P3: If Python -> Not Mac.
;    - P4: Sam uses Mac. (True)
;    - P5: If Mac -> Play Song.
;    - P6: If Not Perfect -> Not Play Song.
;
; 2. Logical Deduction:
;    - From P4, Sam uses Mac.
;    - From P3, if Language were Python, Sam would NOT use Mac.
;    - Since Sam DOES use Mac, Language CANNOT be Python (Modus Tollens).
;    - From P2, Language must be C++ or Python.
;    - Since not Python, Language MUST be C++.
;    - (P5 and P6 imply Song Title is Perfect, which is consistent).
;
; 3. Verification Strategy:
;    - Question: "Is the statement 'The project is written in C++' true?"
;    - Action: Assert Knowledge Base + Assert Statement (Language == C++).
;    - Check: (check-sat).
;    - Expectation: sat (True), because the premises entail C++.
;
; ==============================================================================

; 1. Declare Sorts
; Language Enum: CPP (representing C++) and Python
(declare-datatypes () ((Language (CPP) (Python))))
; SongTitle Enum: Perfect and Other
(declare-datatypes () ((SongTitle (Perfect) (Other))))

; 2. Declare Constants
(declare-const sam-language Language)
(declare-const sam-uses-mac Bool)
(declare-const sam-plays-song Bool)
(declare-const song-title SongTitle)

; 3. Assert Knowledge Base (Premises)

; Premise 2: A project is written either in C++ or Python.
; (Enforced by the Language datatype definition; sam-language must be CPP or Python)

; Premise 3: If Sam does a project written in Python, he will not use a Mac.
(assert (=> (= sam-language Python) (not sam-uses-mac)))

; Premise 4: Sam is using a Mac.
(assert sam-uses-mac)

; Premise 5: If Sam uses a Mac, he will play a song.
(assert (=> sam-uses-mac sam-plays-song))

; Premise 6: If a song is not titled "Perfect," Sam will never play it.
; Logic: (not Perfect) => (not Play)  ==  Play => Perfect
(assert (=> (not (= song-title Perfect)) (not sam-plays-song)))

; 4. Assert Statement to Verify
; Statement: The project Sam is doing is written in C++.
(assert (= sam-language CPP))

; 5. Check Satisfiability
; If sat -> Statement is True (Consistent and Entailed by KB in this context)
; If unsat -> Statement is False (Contradicts KB)
(check-sat)

; 6. Get Model (Optional, to see the valid assignment)
(get-model)