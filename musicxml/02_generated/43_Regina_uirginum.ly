
\version "2.14.2"
% automatically converted from 43_Regina_uirginum.xml

\header {
    encodingsoftware = "Sibelius 6.2"
    tagline = "Sibelius 6.2"
    encodingdate = "2015-04-22"
    copyright = "Copyright © "
    title = "43) Regina uirginum"
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
PartPOneVoiceOne =  \relative d' {
    \clef "treble_8" \key c \major \time 25/4 \break | % 1
    d4 ^"281v" ^"43) Regina uirginum"
    -"http://media.musicasacra.com/sjfm/Saints/Saints-Nov-1-All-Saints.pdf
    From Sequence: Christo inclyto candida nostra canant melodia agmina"
    f4 e4 f4 g4 g4 g4 g4 f4 d4 f4 f4 f4 e4 f4 g4 g4 e4 g4 f4 ( e4 ) d4 c4
    d4 d4 | % 2
    \time 24/4  d4 f4 e4 f4 g4 g4 g4 g4 f4 d4 f4 f4 f4 e4 f4 g4 e4 g4 f4
    ( e4 ) d4 c4 d4 d4 \break | % 3
    \time 14/4  f4 e4 g4 d4 f4 e4 g4 e4 ( f4 ) e4 ( d4 ) c4 d4 d4 | % 4
    \time 13/4  f4 e4 g4 d4 c4 e4 g4 f4 e4 ( d4 ) c4 d4 d4 \break | % 5
    \time 16/4  g4 f4 e4 d4 g4 f4 e4 c4 d4 e4 f4 e4 d4 c4 d4 d4 | % 6
    \time 17/4  g4 f4 e4 d4 g4 f4 e4 ( d4 ) c4 d4 e4 f4 e4 d4 c4 d4 d4
    \break | % 7
    \time 13/4  d4 e4 c4 d4 e4 f4 e4 d4 c4 d4 e4 e4 d4 \bar "|."
    }

PartPOneVoiceOneLyricsOne =  \lyricmode { Re -- gi -- na uir -- gi --
    num pre -- ma -- xi -- ma tu ma -- ter es in -- cor -- rup -- ta uir
    -- "go " __ et gra -- ui -- da. Sa -- cra -- ta do -- mi -- no et ca
    -- sti -- tas "no " -- stras ser -- ua a -- ni -- mas mun -- "da "
    __ que cor -- po -- ra. Mo -- na -- cho -- rum ue -- ne -- ran --
    "da " __ "suf " -- fra -- gi -- a. Om -- ni -- um que sanc -- to --
    rum con -- "tu " -- "ber " -- ni -- a. Per pre -- ca -- ta as -- si
    -- du -- a "no " -- stra gu -- ber -- nent tem -- po -- ra. Nos que
    du -- cant ad su -- "per " -- na po -- lo -- rum ue -- ra gau -- di
    -- a. Sub iun -- gant pi -- um ag -- mi -- na a -- men re -- dem --
    pta. }

% The score definition
\new Staff <<
    \set Staff.instrumentName = "[Tenor]"
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsOne
        >>
    >>

