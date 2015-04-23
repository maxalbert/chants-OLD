
\version "2.14.2"
% automatically converted from 27_Alma_chorus.xml

\header {
    encodingsoftware = "Sibelius 6.2"
    tagline = "Sibelius 6.2"
    encodingdate = "2015-04-22"
    copyright = "Copyright © "
    title = "27) Alma chorus"
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
    \clef "treble_8" \key c \major \time 15/4 \pageBreak | % 1
    g4 -"Analecta Hymnica, vol. 53, no. 87, pp. 152-154." g4 g4 a4 g4 f4
    ^"272r" ^"27) Alma chorus" a4 b4 c4 a4 b4 a4 g4 f4 g4 \break | % 2
    \time 16/4  c4 a4 c4 b4 g4 a4 g4 f4 a4 a4 g4 c4 a4 g4 f4 g4 | % 3
    \time 17/4  c4 a4 c4 b4 g4 a4 g4 f4 a4 a4 \[ g4 -"(written in
    margin)" c4 a4 \] g4 f4 g4 g4 \break | % 4
    \time 16/4  g4 f4 e4 f4 d4 g4 f4 a4 c4 b4 g4 a4 g4 f4 a4 g4 | % 5
    g4 f4 e4 f4 d4 g4 f4 a4 c4 b4 g4 a4 g4 f4 a4 g4 \break | % 6
    c4 b4 c4 d4 c4 a4 c4 b4 c4 a4 g4 a4 g4 f4 a4 g4 | % 7
    c4 b4 c4 d4 c4 a4 c4 b4 c4 a4 g4 a4 g4 f4 a4 g4 \break | % 8
    \time 14/4  d'4 d4 e4 d4 c4 c4 e4 d4 b4 c4 a4 f4 g4 g4 | % 9
    d'4 d4 e4 d4 c4 c4 e4 d4 b4 c4 a4 f4 g4 g4 \break | \barNumberCheck
    #10
    \time 15/4  g4 f4 a4 c4 a4 c4 b4 c4 a4 g4 a4 g4 f4 a4 g4 | % 11
    \time 14/4  g4 f4 a4 c4 a4 c4 a4 c4 b4 c4 a4 f4 g4 g4 \break | % 12
    \time 16/4  g4 g4 g4 a4 g4 a4 g4 a4 g4 f4 a4 c4 b4 g4 a4 g4 \break | % 13
    \time 5/4  g4 ( a4 g4 ) f4 ( g4 ) \bar "|."
    }

PartPOneVoiceOneLyricsOne =  \lyricmode { Al -- ma cho -- rus do -- mi
    -- ni nunc pan -- gat no -- mi -- na sum -- mi. Mes -- sy -- as so
    -- ther em -- ma -- nu -- el sa -- ba -- oth a -- do -- na -- y. Est
    u -- ni -- ge -- ni -- tus ui -- a ui -- ta ma -- nus ho -- mo -- u
    -- sy -- on. Prin -- ci -- pi -- um pri -- mo -- ge -- ni -- tus sa
    -- pi -- en -- ti -- a uir -- tus. Al -- pha ca -- put fi -- nis --
    que si -- mul uo -- ci -- ta -- tur et est w. Fons et o -- ri -- go
    bo -- ni pa -- ra -- cly -- tus ac me -- di -- a -- tor. Ag -- nus o
    -- uis ui -- tu -- lus ser -- pens a -- ri -- es le -- o uer -- mis.
    Os uer -- bum splen -- dor sol glo -- ri -- a lux et y -- ma -- go.
    Pa -- nis flos ui -- tis mons ia -- nu -- a pe -- tra la -- pis --
    que. An -- ge -- lus et spon -- sus pas -- tor -- que pro -- phe --
    ta sa -- cer -- dos. At -- ha -- na -- thos kyr -- ros the -- os pan
    -- thon -- cra -- tor y -- sus. Sal -- ui -- fi -- cet nos sit cu --
    i se -- cla per om -- ni -- a do -- xa. "A " -- men. }

% The score definition
\new Staff <<
    \set Staff.instrumentName = "[Tenor]"
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsOne
        >>
    >>

