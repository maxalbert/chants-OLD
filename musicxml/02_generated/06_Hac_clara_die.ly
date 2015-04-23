
\version "2.14.2"
% automatically converted from 06_Hac_clara_die.xml

\header {
    encodingsoftware = "Sibelius 6.2"
    tagline = "Sibelius 6.2"
    encodingdate = "2015-04-22"
    copyright = "Copyright © "
    title = "6) Hac clara die"
    }

#(set-global-staff-size 11.9501574803)
\paper {
    paper-width = 21.59\cm
    paper-height = 27.94\cm
    top-margin = 2.0\cm
    bottom-margin = 1.5\cm
    left-margin = 1.5\cm
    right-margin = 1.5\cm
    between-system-space = 2.1\cm
    page-top-space = 1.28\cm
    }
\layout {
    \context { \Score
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative e {
    \clef "treble_8" \key c \major \time 15/4 \pageBreak | % 1
    e4 -"Analecta Hymnica, vol. 8, no. 215, p. 165." g4 a4 g4 f4 e4 d4 e4
    ^"261r" g4 e4 d4 f4 d4 c4 e4 | % 2
    e4 g4 a4 g4 f4 e4 d4 e4 g4 e4 ^"6) Hac clara die" d4 f4 d4 c4 e4
    \break | % 3
    \time 19/4  c4 d4 e4 e4 d4 e4 g4 e4 d4 f4 d4 c4 e4 f4 g4 e4 f4 d4 e4
    | % 4
    c4 d4 e4 e4 d4 f4 g4 e4 d4 f4 d4 c4 e4 f4 g4 e4 f4 d4 e4 \break | % 5
    \time 16/4  e4 g4 g4 a4 g4 a4 g4 e4 f4 g4 e4 d4 f4 d4 c4 e4 | % 6
    e4 g4 g4 g4 a4 a4 g4 e4 f4 g4 e4 d4 f4 d4 c4 e4 \break | % 7
    \time 17/4  e4 d4 f4 e4 d4 c4 d4 d4 e4 e4 d4 f4 a4 g4 f4 d4 e4 | % 8
    e4 d4 f4 e4 d4 c4 c4 d4 e4 e4 d4 f4 a4 g4 f4 d4 e4 \break | % 9
    \time 13/4  e4 g4 g4 g4 a4 a4 g4 a4 b4 g4 a4 f4 g4 | \barNumberCheck
    #10
    e4 g4 g4 g4 a4 a4 g4 a4 b4 g4 a4 f4 g4 \break | % 11
    \time 12/4  g4 e4 f4 d4 e4 ( d4 ) c4 f4 a4 g4 f4 g4 | % 12
    \time 11/4  g4 e4 f4 d4 e4 c4 f4 a4 g4 f4 g4 \break | % 13
    c4 a4 c4 g4 a4 f4 a4 a4 a4 b4 g4 | % 14
    c4 a4 c4 g4 a4 f4 a4 a4 a4 b4 g4 \break | % 15
    \time 20/4  a4 c4 ( b4 ) c4 d4 d4 d4 c4 a4 c4 g4 a4 f4 a4 c4 b4 g4 a4
    g4 g4 | % 16
    a4 c4 ( b4 ) c4 d4 d4 c4 a4 c4 g4 a4 f4 a4 c4 b4 ( a4 ) g4 a4 a4 g4
    \break | % 17
    \time 13/4  g4 f4 ( e4 ) d4 g4 a4 c4 b4 g4 a4 f4 g4 g4 \bar "|."
    }

PartPOneVoiceOneLyricsOne =  \lyricmode { Hac cla -- ra di -- e tur --
    ma fe -- sti -- ua dat pre -- co -- ni -- a. Ma -- ri -- am con --
    cre -- pan -- do sym -- pho -- ni -- a nec -- ta -- re -- a. Mun --
    di do -- mi -- na que est so -- la ca -- stis -- si -- ma. uir -- gi
    -- num re -- gi -- na. Sa -- lu -- tis cau -- sa ui -- te por -- ta
    "at " -- que ce -- li re -- fer -- ra gra -- ti -- a. Nam ad il --
    lam sic nun -- ci a o -- lim fac -- ta an -- ge -- li -- ca. A -- ue
    ma -- ri -- a gra -- ti -- a de -- i ple -- na per se -- cu -- la.
    Mu -- li -- e -- rum pi -- a ag -- mi -- na in -- tra sem -- per be
    -- ne -- dic -- ta. Uir -- go et gra -- ui -- da ma -- ter in -- tac
    -- ta pro -- le glo -- ri -- o -- sa. Cu -- i con -- tra ma -- ri --
    a hec red -- dit fa -- mi -- na. In me quo -- mo -- do tu -- a iam
    fi -- ent nun -- ci -- a. Ui ri no -- ui "nul " -- lam cer -- te co
    -- pu -- lam. Ex quo "at " -- que na -- ta sum in -- cor -- ru --
    pta. Di -- ua mis -- sus i -- ta red -- dit af -- fa -- ta. Fla --
    tu sa -- cro ple -- na fi -- es ma -- ri -- a. No -- "ua " __ ef --
    fe -- rens gau -- di -- a ce -- lo ter -- re na -- ti per e -- xor
    -- di -- a. "In " -- "tra " __ tu -- i u -- "te " -- ri clau -- stra
    por -- tas qui gu -- "ber " -- nat e -- ter -- na. Om -- "ni " -- a
    qui dat tem -- po -- ra pa -- ci -- fi -- ca. }

% The score definition
\new Staff <<
    \set Staff.instrumentName = "[Tenor]"
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsOne
        >>
    >>

