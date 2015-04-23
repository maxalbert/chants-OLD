
\version "2.14.2"
% automatically converted from 01_Salus_eterna.xml

\header {
    encodingsoftware = "Sibelius 6.2"
    tagline = "Sibelius 6.2"
    encodingdate = "2015-04-22"
    copyright = "Copyright © "
    title = "1) Salus eterna"
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
PartPOneVoiceOne =  \relative b {
    \clef "treble_8" \key c \major \time 15/4 | % 1
    b4 -"Analecta Hymnica, vol. 7, no. 4, pp. 28-29." d4 e4 b4 ( g4 ) g4
    a4 c4 b4 a4 g4 b4 g4 a4 ^"259v" g4 ^"1) Salus eterna" | % 2
    b4 d4 e4 b4 ( a4 ) g4 a4 c4 b4 a4 g4 b4 g4 a4 g4 \break | % 3
    \time 18/4  g4 g4 a4 b4 b4 a4 c4 e4 d4 d4 b4 d4 b4 c4 a4 g4 b4 b4 | % 4
    g4 g4 a4 b4 b4 a4 c4 e4 d4 d4 b4 d4 b4 c4 a4 g4 b4 b4 \break | % 5
    \time 17/4  a4 ( e'4 ) f4 e4 d4 e4 d4 b4 c4 b4 a4 g4 a4 b4 c4 a4 b4
    | % 6
    a4 ( e'4 ) f4 e4 d4 e4 d4 b4 c4 b4 a4 g4 a4 b4 c4 a4 b4 \break | % 7
    \time 15/4  g4 a4 c4 a4 a4 g4 b4 c4 d4 b4 a4 c4 a4 g4 b4 | % 8
    \time 22/4  g4 a4 c4 a4 a4 g4 b4 c4 d4 b4 a4 c4 a4 g4 b4 g4 a4 c4 a4
    a4 g4 b4 \break | % 9
    \time 9/4  b4 d4 d4 d4 e4 d4 e4 d4 b4 | \barNumberCheck #10
    \time 8/4  b4 d4 d4 e4 d4 e4 d4 b4 \break | % 11
    \time 15/4  e4 d4 d4 c4 e4 d4 d4 b4 d4 b4 c4 a4 g4 b4 b4 | % 12
    \time 27/4  e4 d4 d4 c4 e4 d4 d4 b4 d4 b4 c4 a4 g4 a4 ( b4 ) b4 b4 d4
    b4 c4 a4 g4 a4 b4 a4 a4 g4 \bar "|."
    }

PartPOneVoiceOneLyricsOne =  \lyricmode { Sa -- lus e -- "ter " -- na in
    -- de -- fi -- ci -- ens mun -- di ui -- ta. Lux sem -- pi -- "ter "
    -- na et re -- demp -- ti -- o ue -- re no -- stra. Con -- do --
    lens hu -- ma -- na pe -- ri -- re se -- cla per temp -- tan -- tis
    nu -- mi -- na. Non lin -- quens ex -- cel -- sa a -- di -- sti i --
    ma pro -- pri -- a cle -- men -- ti -- a. "Mox " __ tu -- a spon --
    ta -- ne -- a gra -- ti -- a as -- su -- mens hu -- ma -- na. "Que "
    __ fu -- e -- rant per -- di -- ta om -- ni -- a sal -- ua -- sti
    ter -- re -- a. Fe -- rens mun -- do grau -- di -- a. tu a -- ni --
    mas et cor -- po -- ra. Nos -- tra Chri -- ste ex -- pi -- a ut pos
    -- si -- de -- as lu -- ci -- da nos -- met ha -- bi -- ta -- cu --
    la. Ad -- ven -- tu pri -- mo iu -- sti -- fi -- ca. in se -- cun --
    do nos li -- be -- ra. Ut cum fac -- ta lu -- ce mag -- na iu -- di
    -- ca -- bis om -- ni -- a. Comp -- ti sto -- la in -- cor -- ru --
    pta nos -- met tu -- a sub -- "se " -- qua -- mur mox ue -- sti --
    gi -- a quo -- cun -- que ui -- sa. }

% The score definition
\new Staff <<
    \set Staff.instrumentName = "[Tenor]"
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsOne
        >>
    >>

