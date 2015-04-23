
\version "2.14.2"
% automatically converted from 20_Agnus_redemit.xml

\header {
    encodingsoftware = "Sibelius 6.2"
    tagline = "Sibelius 6.2"
    encodingdate = "2015-04-22"
    copyright = "Copyright © "
    title = "20) Agnus redemit"
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
    \clef "treble_8" \key c \major \time 15/4 \pageBreak d4 ( c4 ) d4
    ^"268r" ( f4 ^"20) Agnus redemit" ) \slurDotted g4 -"G-D outline on
    the way to an A-D outline!" ( \slurSolid f4 e4 d4 ) \slurDotted a'4
    ( \slurSolid g4 f4 ) g4 ( \mark \markup { \musicglyph
        #"scripts.coda" } d4 ) e4 ( d4 ) \break | % 2
    \time 24/4  | % 2
    a'4 -"Victimae paschali laudes" c4 d4 a4 g4 a4 a4 a4 g4 a4 g4 f4 e4
    d4 e4 g4 d4 e4 d4 c4 e4 f4 e4 d4 | % 3
    a'4 c4 d4 a4 g4 a4 a4 a4 g4 a4 g4 f4 e4 d4 e4 g4 d4 e4 d4 c4 e4 f4 e4
    d4 \break | % 4
    \time 15/4  a4 c4 d4 f4 g4 ( f4 ) e4 ( d4 ) c4 f4 e4 d4 e4 c4 d4 | % 5
    \time 23/4  f4 a4 g4 a4 f4 g4 f4 ( e4 \mark \markup { \musicglyph
        #"scripts.coda" } d4 ) d4 -"Highly unusual notation" c4 g'4 f4 g4
    a4 g4 f4 g4 ( e4 ) f4 ( e4 \mark \markup { \musicglyph
        #"scripts.coda" } d4 ) d4 \break | % 6
    \time 16/4  a4 c4 d4 ( b4 ) f'4 g4 ( f4 ) e4 ( d4 ) c4 f4 e4 d4 e4 c4
    d4 | % 7
    \time 20/4  f4 a4 g4 a4 f4 g4 f4 ( e4 ) d4 c4 g'4 f4 g4 a4 a4 f4 g4
    f4 ( e4 ) d4 \breathe \break | % 8
    \time 24/4  a'4 c4 d4 a4 g4 a4 a4 a4 a4 c4 g4 f4 e4 d4 c4 e4 d4 g4 a4
    a4 g4 f4 e4 d4 | % 9
    a'4 c4 d4 a4 a4 g4 a4 a4 a4 c4 g4 f4 e4 d4 c4 e4 d4 g4 a4 a4 g4 f4 e4
    d4 \bar "|."
    }

PartPOneVoiceOneLyricsOne =  \lyricmode { "Al " -- "le " -- \skip4 "lu "
    -- \skip4 "ya. " __ Ag -- nus re -- de -- mit o -- ues "Chri " --
    stus in -- no -- cens pa -- tri re -- con -- ci -- li -- a -- uit
    pec -- ca -- to -- res. Mors et ui -- ta du -- el -- lo con fli --
    xe -- re mi -- ran -- do dux ui -- te mor -- tu -- us reg -- nat ui
    -- uus. Dic no -- bis ma -- "ri " -- "a " __ quid ui -- di -- sti in
    ui -- a. Se -- pul -- chrum Chri -- sti ui -- "uen " -- tis et glo
    -- ri -- am ui -- di re -- "sur " -- "gen " -- tis. An ge "li " --
    cos "tes " -- "tes " __ su -- da -- ri -- um et ue -- stes. Sur --
    rex -- it Chri -- stus spes "no " -- stra pre -- ce -- det su -- os
    "in in" ga -- li -- "le " -- am. Cre -- den -- dum est ma -- gis so
    -- li ma -- ri -- e ue -- ra -- ri quem iu -- de -- o -- rum tur --
    be fal -- la -- ci. Sci -- mus Chri -- stum sur -- re -- xis -- se a
    mor -- tu -- is ue -- re tu no -- bis uic -- tor rex mi -- se -- re
    -- re. }

% The score definition
\new Staff <<
    \set Staff.instrumentName = "[Tenor]"
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsOne
        >>
    >>

