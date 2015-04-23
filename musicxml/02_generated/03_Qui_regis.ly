
\version "2.14.2"
% automatically converted from 03_Qui_regis.xml

\header {
    encodingsoftware = "Sibelius 6.2"
    tagline = "Sibelius 6.2"
    encodingdate = "2015-04-22"
    copyright = "Copyright © "
    title = "3) Qui regis"
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
PartPOneVoiceOne =  \relative a {
    \clef "treble_8" \key c \major \time 13/4 \pageBreak | % 1
    a4 -"Analecta Hymnica, vol. 7, no. 9, p. 31." a4 g4 a4 f4 e4 g4 a4 g4
    a4 f4 g4 d4 | % 2
    \time 18/4  a'4 ^"3) Qui regis" ^"260r" a4 g4 a4 a4 f4 a4 g4 a4 f4 f4
    g4 a4 g4 a4 f4 g4 d4 \break | % 3
    \time 12/4  f4 e4 g4 d4 f4 e4 g4 f4 g4 f4 ( e4 ) d4 \break | % 4
    \time 14/4  f4 d4 e4 f4 g4 a4 a4 g4 f4 g4 f4 g4 g4 a4 \break | % 5
    \time 8/4  f4 a4 g4 f4 e4 d4 f4 g4 \break | % 6
    \time 12/4  f4 g4 a4 c4 a4 g4 f4 e4 f4 g4 f4 e4 \bar "|."
    }

PartPOneVoiceOneLyricsOne =  \lyricmode { Qui re -- gis scep -- tra for
    -- ti dex -- tra so -- lus cunc -- ta Tu ple -- bi tu -- am o --
    sten -- de mag -- nam ex -- ci -- tan -- do po -- ten -- ti -- am.
    Pre -- sta do -- na il -- li sa -- lu -- ta -- "ri " -- a. Quem pre
    -- di -- xe -- runt pro -- phe -- ti -- ca ua -- ti -- ci -- ni --
    a. A cla -- ra po -- li re -- gi -- a. In "no " -- stra Ihe -- su
    mit -- te do -- mi -- ne ar -- ua. }

% The score definition
\new Staff <<
    \set Staff.instrumentName = "[Tenor]"
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsOne
        >>
    >>

