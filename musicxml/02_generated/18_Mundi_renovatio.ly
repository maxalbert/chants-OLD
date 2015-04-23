
\version "2.14.2"
% automatically converted from 18_Mundi_renovatio.xml

\header {
    encodingsoftware = "Sibelius 6.2"
    tagline = "Sibelius 6.2"
    encodingdate = "2015-04-22"
    copyright = "Copyright © "
    title = "18) Mundi renovatio"
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
    \clef "treble_8" \key c \major \time 15/4 \pageBreak | % 1
    d4 -"Adam of St. Victor, vol. 1, no. XIII, pp. 76-79." ( c4 ) d4
    ^"267v" ^"18) Mundi renovatio" f4 g4 f4 e4 d4 a'4 g4 f4 g4 f4 e4 d4
    | % 2
    d4 ( c4 ) d4 f4 g4 f4 e4 d4 a'4 g4 f4 g4 f4 e4 d4 \break | % 3
    \time 21/4  a'4 c4 d4 a4 g4 a4 a4 a4 g4 a4 g4 f4 e4 d4 e4 f4 d4 e4 c4
    d4 d4 | % 4
    \time 28/4  a'4 c4 d4 a4 g4 a4 a4 a4 g4 a4 g4 f4 e4 d4 f4 g4 d4 f4 e4
    d4 c4 e4 f4 d4 e4 c4 d4 d4 \break | % 5
    \time 21/4  a'4 c4 d4 a4 g4 a4 a4 a4 g4 a4 g4 f4 e4 d4 e4 f4 d4 e4 c4
    d4 d4 \break | % 6
    \time 31/4  a4 c4 d4 f4 g4 f4 ( e4 ) d4 c4 f4 e4 d4 e4 c4 d4 f4 a4 g4
    a4 f4 ( g4 ) f4 ( e4 ) d4 g4 f4 g4 a4 f4 e4 d4 | % 7
    \time 22/4  a4 c4 d4 f4 g4 ( f4 ) e4 d4 c4 f4 e4 d4 e4 c4 d4 g4 f4 g4
    a4 f4 e4 d4 \break | % 8
    \time 31/4  a4 c4 d4 f4 g4 ( f4 ) e4 d4 c4 f4 e4 d4 e4 c4 d4 f4 a4 g4
    a4 f4 ( g4 ) f4 ( e4 ) d4 g4 f4 g4 a4 f4 e4 d4 \break | % 9
    \time 22/4  a'4 c4 d4 a4 g4 a4 a4 a4 c4 -"C outline" g4 f4 e4 d4 c4
    g'4 f4 g4 a4 ( g4 ) f4 e4 d4 \break | \barNumberCheck #10
    \time 28/4  a'4 c4 d4 a4 g4 a4 a4 a4 a4 c4 g4 f4 e4 d4 c4 e4 d4 e4 g4
    g4 a4 a4 g4 f4 g4 f4 e4 d4 | % 11
    \time 22/4  a'4 c4 d4 a4 g4 a4 a4 a4 c4 -"D outline" a4 g4 f4 e4 d4
    f4 e4 g4 a4 ( g4 ) f4 e4 d4 \break | % 12
    \time 5/4  d4 ( e4 d4 ) c4 ( d4 ) \bar "|."
    }

PartPOneVoiceOneLyricsOne =  \lyricmode { "Mun " -- di re -- no -- ua --
    ti -- o no -- ua pa -- rit gau -- di -- a. "Re " -- sur -- gen -- ti
    do -- mi -- no con re -- sur -- gunt om -- ni -- a. E -- le -- men
    -- ta ser -- ui -- unt et auc -- to -- ris sen -- ti -- unt quan --
    ta sit po -- ten -- ti -- a. "Ce " -- lum fit se -- re -- ni -- us
    et ma -- re tran -- quil -- li -- us spi -- rat au -- ra mi -- te --
    is ual -- lis no -- stra flo -- ru -- it. Re -- ui -- res -- cunt a
    -- ri -- da re -- ca -- les -- cunt fri -- gi -- da post -- quam uer
    in -- te -- pu -- it. Ge -- lu mor -- tis sol -- "ui " -- tur prin
    -- ceps mun -- di fal -- li -- tur et e -- ius de -- "stru " -- "i "
    -- tur in no -- bis im -- pe -- ri -- um. Dum te -- ne -- re "uo "
    -- lu -- it in quo ni -- chil ha -- bu -- it ius a -- mi -- sit pro
    -- pri -- um. Ui -- ta mor -- tem "su " -- pe -- rat ho -- mo iam re
    -- cu -- pe -- rat quod pri -- us a -- "mi " -- "se " -- rat pa --
    ra -- di -- si gau -- di -- um. Ui -- tam pre -- bet fa -- ci -- lem
    che -- ru -- byn uer -- sa -- ti -- lem a -- mo -- uen -- "do " __
    gla -- di -- um. Chri -- stus ce -- los re -- fe -- rat et cap -- ti
    -- uos li -- be -- rat quos cul -- pa -- li -- ga -- ue -- rat sub
    mor -- tis in -- te -- ri -- tu. Pro tan -- ta uic -- to -- ri -- a
    pa -- tri pro -- li glo -- ri -- a sit cum "sanc " -- "to " __ spi
    -- ri -- tu. "A " -- "men. " __ }

% The score definition
\new Staff <<
    \set Staff.instrumentName = "[Tenor]"
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsOne
        >>
    >>

