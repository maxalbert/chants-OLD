
\version "2.14.2"
% automatically converted from 64_Uergente_mundi.xml

\header {
    encodingsoftware = "Sibelius 6.2"
    tagline = "Sibelius 6.2"
    encodingdate = "2015-04-22"
    copyright = "Copyright © "
    title = "64) Uergente mundi"
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
PartPOneVoiceOne =  \relative d {
    \clef "treble_8" \key c \major \time 27/4 \pageBreak | % 1
    d4 ^"64) Uergente mundi" -"Analecta Hymnica, vol. 9, no. 75, p. 61."
    d4 ^"294r" c4 d4 e4 f4 e4 d4 e4 g4 a4 g4 ( f4 ) e4 d4 ( c4 ) d4 ( e4
    ) e4 f4 e4 c4 d4 e4 f4 d4 d4 | % 2
    d4 d4 c4 d4 e4 f4 e4 d4 e4 g4 a4 g4 f4 ( e4 ) d4 ( c4 ) d4 ( e4 ) e4
    f4 e4 c4 d4 e4 f4 d4 d4 \break | % 3
    \time 29/4  d4 a'4 a4 a4 ( bes4 ) a4 g4 ( f4 ) e4 d4 e4 g4 g4 ( a4 )
    g4 f4 e4 ( d4 ) e4 c4 a4 c4 d4 e4 f4 e4 ( d4 ) e4 d4 | % 4
    \time 28/4  d4 a'4 a4 a4 ( bes4 ) a4 g4 ( f4 ) e4 d4 e4 g4 a4 g4 f4
    e4 ( d4 ) e4 c4 a4 c4 d4 e4 f4 e4 ( d4 ) e4 d4 \break | % 5
    \time 30/4  f4 ( f4 e4 ) d4 ( c4 ) d4 e4 f4 g4 f4 ( e4 ) d4 e4 f4 g4
    g4 g4 f4 g4 ( g4 ) f4 f4 g4 a4 c4 a4 b4 -\markup { \natural } a4 ( g4
    ) a4 | % 6
    \time 29/4  f4 ( f4 e4 ) d4 ( c4 ) d4 e4 f4 g4 f4 ( e4 ) d4 e4 f4 g4
    g4 g4 f4 g4 f4 f4 g4 a4 c4 a4 bes4 ( a4 ) g4 a4 \break | % 7
    \time 25/4  bes4 a4 g4 f4 e4 c4 d4 ( e4 ) d4 f4 e4 f4 g4 e4 c4 d4 c4
    d4 c4 d4 e4 f4 f4 d4 d4 | % 8
    \time 26/4  f4 g4 g4 f4 e4 c4 d4 ( e4 ) d4 f4 e4 f4 g4 e4 c4 d4 ( d4
    ) c4 d4 d4 c4 d4 e4 f4 d4 d4 \break | % 9
    \time 5/4  d4 ( e4 d4 ) c4 ( d4 ) \bar "|."
    }

PartPOneVoiceOneLyricsOne =  \lyricmode { Uer -- gen -- te mun -- di ue
    -- spe -- re se -- re -- no "fu " -- sus "sy " -- "de " -- re ce --
    li pro -- ce -- dit ra -- di -- us. In -- du -- to car -- nis o --
    ne -- re "sa " -- cro de -- pen -- "det " __ "u " -- "be " -- re pa
    -- tris e -- ter -- ni fi -- li -- us. In "ge " -- de -- "o " -- nis
    "uel " -- le -- re et in "ru " -- bi ca -- "rac " -- te -- re pre --
    fi -- gu -- ra -- tus "cer " -- ni -- tur. Cu -- ius "a " -- "per "
    -- to "la " -- te -- re ce -- dit ue -- la -- men "lit " -- te -- re
    et lex ue -- tus ex -- "po " -- ni -- tur. "Sa " -- "cra " -- men --
    ta no -- ue "le " -- gis in pres -- su -- ra Chri -- sti "re " --
    gis et in cru -- cis lu -- di -- "bri " -- o. "Planc " -- "tum " __
    do -- cet ihe -- re -- "mi " -- e et lan -- guo -- res y sa -- i --
    e re -- gis al -- ti sus -- "pen " -- di -- o. Uir -- go sy -- dus
    sin -- gu -- "la " -- re uir -- go mun -- di lu -- mi -- na re Chri
    -- sti pro -- fu -- sa ge -- ni -- bus. Il -- li re -- fer la -- tus
    "lo " -- ra spi -- nas cla -- uos et pe -- "ro " -- ra i -- stis in
    -- ter -- ces -- so -- ri -- bus. "A " -- "men. " __ }

% The score definition
\new Staff <<
    \set Staff.instrumentName = "[Tenor]"
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsOne
        >>
    >>

