
\version "2.14.2"
% automatically converted from 71_Inuiolata_intacta.xml

\header {
    encodingsoftware = "Sibelius 6.2"
    tagline = "Sibelius 6.2"
    encodingdate = "2015-04-22"
    copyright = "Copyright © "
    title = "71) Inuiolata intacta"
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
    \clef "treble_8" \key c \major \time 18/4 \pageBreak | % 1
    g4 ^"298r" ^"71) Inuiolata intacta" -"Hymnii Latini Medii Aevi, no.
    614, p. 435." ( f4 ) f4 ( c4 ) e4 f4 g4 a4 b4 a4 g4 a4 g4 f4 g4 f4 g4
    a4 | % 2
    \time 12/4  d,4 a'4 b4 a4 g4 a4 g4 f4 g4 f4 g4 a4 \break | % 3
    \time 11/4  a4 g4 f4 g4 f4 g4 a4 c4 bes4 g4 a4 | % 4
    a4 g4 f4 g4 f4 g4 a4 c4 bes4 g4 a4 \break | % 5
    \time 13/4  f4 f4 a4 bes4 -\markup { \flat } a4 a4 g4 f4 g4 g4 a4 g4
    f4 | % 6
    f4 f4 a4 bes4 -\markup { \flat } a4 a4 g4 f4 g4 g4 a4 g4 f4 \break | % 7
    \time 10/4  f4 f4 a4 bes4 a4 g4 a4 c4 bes4 a4 | % 8
    \time 12/4  f4 f4 a4 bes4 a4 a4 g4 f4 a4 c4 bes4 a4 \break | % 9
    \time 26/4  a4 g4 g4 f4 f4 g4 a4 a4 bes4 -\markup { \flat } a4 g4 f4
    ( e4 ) g4 ( a4 ) g4 ( a4 g4 ) f4 ( g4 ) \slurDotted a4 ( \slurSolid
    g4 f4 ) g4 g4 ( f4 ) \bar "|."
    }

PartPOneVoiceOneLyricsOne =  \lyricmode { "In " -- "ui " -- o -- la --
    ta in -- tac -- "ta " __ \skip4 et ca -- sta es Ma -- ri -- a. Que
    es ef -- fec -- ta ful -- gi -- da ce -- li por -- ta. O ma -- ter
    al -- ma Chri -- sti ca -- ris -- si -- ma. Sus -- ci -- pe pi -- a
    lau -- dum pre -- co -- ni -- a. "No " -- stra ut pu -- ra pec -- to
    -- ra sint et cor -- po -- ra. Que nunc fla -- gi -- tant de -- uo
    -- ta cor -- da et o -- ra. Tu da per pre -- ca -- ta dul -- cis --
    so -- na. No -- bis con -- ce -- das ue -- ni -- am per "se " -- cu
    -- la. O be -- nig -- na que so -- la in -- ui -- o -- la -- "ta "
    __ "per " -- "man " -- "si " -- \skip4 \skip4 "sti. " __ }

% The score definition
\new Staff <<
    \set Staff.instrumentName = "[Tenor]"
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsOne
        >>
    >>

