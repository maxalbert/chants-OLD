
\version "2.14.2"
% automatically converted from 50_Mundi_etate.xml

\header {
    encodingsoftware = "Sibelius 6.2"
    tagline = "Sibelius 6.2"
    encodingdate = "2015-04-22"
    copyright = "Copyright © "
    title = "50) Mundi etate"
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
PartPOneVoiceOne =  \relative g {
    \clef "treble_8" \key c \major \time 25/4 \break | % 1
    g4 ^"285v" ^"50) Mundi etate" -"Analecta Hymnica, vol. 8, no. 113,
    p. 93." g4 a4 g4 f4 a4 ( g4 c4 ) c4 g4 c4 a4 c4 b4 g4 a4 g4 f4 a4 g4
    c4 b4 a4 a4 g4 | % 2
    \time 15/4  c4 a4 c4 b4 g4 a4 g4 f4 a4 g4 c4 b4 a4 a4 g4 \break | % 3
    \time 20/4  d4 g4 g4 b4 g4 b4 a4 c4 b4 g4 a4 g4 f4 a4 g4 c4 b4 a4 a4
    g4 | % 4
    d4 g4 g4 a4 g4 b4 a4 c4 b4 g4 a4 g4 f4 a4 g4 c4 b4 a4 a4 g4 \break | % 5
    d'4 d4 c4 b4 a4 b4 c4 a4 g4 c4 b4 g4 a4 b4 c4 d4 c4 b4 c4 a4 | % 6
    \time 27/4  d4 d4 c4 b4 a4 b4 c4 a4 g4 c4 b4 g4 a4 b4 c4 d4 c4 b4 c4
    a4 c4 b4 g4 a4 ( a4 f4 ) g4 \bar "|."
    }

PartPOneVoiceOneLyricsOne =  \lyricmode { Mun -- di e -- ta -- te "oc "
    -- ta -- ua flo -- re -- bunt du -- pli -- ci pal -- ma be -- a --
    to -- rum ag -- mi -- na. Cor -- po -- re glo -- ri -- fi -- ca --
    to con reg -- nan -- te a -- ni -- ma. In -- du -- en -- tur bi --
    nas sto -- las qui -- cun -- que pri -- us me -- ru -- e -- runt sin
    -- gu -- las. Ful -- ge -- bunt iu -- sti tan -- quam sol et ue --
    lut cla -- ra ce -- li lu -- mi -- na -- ri -- a. Om -- nes om -- ni
    -- a sci -- ent uer -- ba ces -- sa -- bunt lo -- quen -- tur mu --
    tu -- o cor -- da. U -- na om -- ni -- um al -- le -- lu -- ya uox
    est quam sig -- nat se -- quen -- ti -- a pu -- ra uo -- ce ca --
    "nen " -- da. }

% The score definition
\new Staff <<
    \set Staff.instrumentName = "[Tenor]"
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsOne
        >>
    >>

