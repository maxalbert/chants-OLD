
\version "2.14.2"
% automatically converted from 04_Iubilemus_omnes.xml

\header {
    encodingsoftware = "Sibelius 6.2"
    tagline = "Sibelius 6.2"
    encodingdate = "2015-04-22"
    copyright = "Copyright © "
    title = "4) Iubilemus omnes"
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
    \clef "treble_8" \key c \major \time 13/4 \pageBreak | % 1
    e4 -"Analecta Hymnica, vol. 7, no. 12, pp. 33-34." ( f4 ) e4 d4 ( g4
    ) a4 ( c4 ) b4 ( g4 ) g4 a4 ( c4 ) b4 | % 2
    \time 11/4  g4 a4 c4 a4 ^"4) Iubilemus omnes" ^"260r" c4 c4 c4 b4 a4
    a4 g4 | % 3
    g4 a4 c4 a4 c4 c4 c4 b4 a4 a4 g4 \break | % 4
    \time 18/4  g4 b4 g4 a4 a4 e4 a4 c4 g4 a4 e4 e4 f4 g4 f4 g4 f4 e4 | % 5
    \time 19/4  a4 c4 g4 a4 e4 f4 g4 a4 c4 g4 a4 e4 e4 f4 g4 f4 g4 f4 e4
    \break | % 6
    \time 15/4  c4 d4 f4 f4 e4 f4 g4 e4 g4 f4 e4 d4 c4 e4 e4 | % 7
    \time 21/4  c4 c4 d4 f4 f4 e4 f4 g4 e4 g4 f4 e4 g4 f4 e4 d4 e4 d4 c4
    e4 e4 \break | % 8
    \time 17/4  d4 ( g4 ) g4 a4 c4 c4 b4 c4 d4 b4 d4 c4 b4 a4 g4 b4 b4 | % 9
    \time 23/4  d,4 ( g4 ) g4 a4 c4 c4 b4 c4 d4 b4 d4 d4 c4 b4 d4 c4 b4
    a4 b4 a4 g4 b4 b4 \break | \barNumberCheck #10
    \time 12/4  d4 g4 d4 e4 b4 c4 d4 e4 c4 d4 c4 b4 | % 11
    \time 19/4  d4 g4 d4 e4 b4 c4 d4 e4 g4 d4 e4 b4 b4 c4 d4 c4 d4 c4 b4
    \break | % 12
    \time 38/4  g4 g4 a4 c4 c4 c4 b4 c4 d4 c4 d4 c4 b4 c4 a4 g4 ( b4 ) b4
    g4 a4 f4 e4 f4 d4 c4 g'4 a4 c4 g4 a4 g4 f4 ( d4 ) e4 ( g4 ) f4 ( e4
    ) e4 \bar "|."
    }

PartPOneVoiceOneLyricsOne =  \lyricmode { "Iu " -- bi -- "le " -- "mus "
    __ "om " -- nes "u " -- na. De -- o "no " -- stro qui cre -- a --
    uit om -- ni -- a. Per quem cunc -- ta con -- di -- ta sunt se -- cu
    -- la. Ce -- lum quod plu -- ri -- ma lu -- ce cho -- rus -- cat et
    di -- uer -- sa sy -- de -- ra. Sol mun -- di sce -- ma noc -- ti --
    um de -- cus lu -- na ce -- te -- ra splen -- den -- ti -- a. Ma --
    re. sol -- um. al -- ta pla -- na et pro -- fun -- da flu -- mi --
    na. A -- e -- ris am -- pla spa -- ci -- a que dis -- cur -- runt a
    -- ues uen -- ti at -- que plu -- ui -- a. "Hec " __ si -- mul cunc
    -- ta ti -- bi so -- li de -- o pa -- tri mi -- li -- tant. "Nunc "
    __ et in "e " -- uum si -- ne fi -- ne per se -- cu -- la laus e --
    o -- rum tu -- a glo -- ri -- a Qui pro sa -- lu -- te "no " -- stra
    pro -- lem u -- ni -- cam. Pa -- ti in "ter " -- ra mi -- si -- sti
    si -- ne cul -- pa sed ob "no " -- stra de -- lic -- ta. Te sanc --
    ta tri -- ni -- tas pre -- ca -- mur ut cor -- po -- ra no -- stra
    "et " __ cor -- da re -- gas et pro -- te -- gas et do -- nes pec --
    ca -- to -- "rum " __ "ue " -- "ni " -- am. }

% The score definition
\new Staff <<
    \set Staff.instrumentName = "[Tenor]"
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsOne
        >>
    >>

