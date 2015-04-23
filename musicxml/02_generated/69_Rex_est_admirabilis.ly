
\version "2.14.2"
% automatically converted from 69_Rex_est_admirabilis.xml

\header {
    encodingsoftware = "Sibelius 6.2"
    tagline = "Sibelius 6.2"
    encodingdate = "2015-04-22"
    copyright = "Copyright © "
    title = "69) Rex est admirabilis"
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
    \clef "treble_8" \key c \major \time 21/4 \pageBreak | % 1
    d4 ^"297r" ^"69) Rex est admirabilis" -"Analecta Hymnica, vol. 54,
    no. 253, pp. 397-398." d4 c4 d4 e4 f4 g4 e4 d4 e4 c4 f4 e4 d4 f4 g4
    a4 g4 f4 ( e4 ) d4 | % 2
    d4 d4 c4 d4 e4 f4 g4 f4 d4 e4 c4 f4 e4 d4 f4 g4 a4 g4 f4 ( e4 ) d4
    \break | % 3
    \time 20/4  a'4 g4 f4 e4 g4 g4 a4 a4 g4 f4 d4 e4 d4 c4 e4 f4 d4 e4 c4
    d4 | % 4
    a'4 g4 f4 e4 g4 g4 a4 a4 g4 f4 d4 e4 d4 c4 e4 f4 d4 e4 c4 d4 \break
    | % 5
    \time 27/4  a'4 g4 a4 b4 c4 \slurDotted b4 ( \slurSolid a4 g4 ) a4 a4
    a4 ( c4 ) g4 f4 ( e4 ) e4 f4 \slurDotted e4 ( \slurSolid d4 c4 ) f4
    g4 a4 g4 f4 ( e4 ) d4 | % 6
    \time 28/4  a'4 g4 a4 b4 c4 \slurDotted b4 ( \slurSolid a4 g4 ) a4 a4
    a4 ( c4 ) g4 \slurDotted f4 ( \slurSolid e4 d4 ) e4 f4 \slurDotted e4
    ( \slurSolid d4 c4 ) f4 g4 a4 g4 f4 ( e4 ) d4 \break | % 7
    \time 21/4  a'4 a4 g4 c4 b4 g4 a4 b4 c4 d4 a4 c4 b4 ( a4 ) g4 b4 c4
    a4 b4 g4 a4 | % 8
    a4 a4 g4 c4 b4 g4 a4 b4 c4 d4 a4 c4 b4 ( a4 ) g4 b4 c4 a4 b4 g4 a4
    \break | % 9
    \time 23/4  d,4 e4 f4 g4 g4 f4 e4 e4 g4 a4 d,4 e4 f4 \slurDotted e4
    ( \slurSolid d4 c4 ) e4 g4 a4 g4 f4 ( e4 ) d4 | \barNumberCheck #10
    d4 e4 f4 g4 g4 f4 e4 e4 g4 a4 d,4 e4 f4 \slurDotted e4 ( \slurSolid
    d4 c4 ) e4 g4 a4 g4 f4 ( e4 ) d4 \bar "|."
    }

PartPOneVoiceOneLyricsOne =  \lyricmode { Res est ad -- mi -- ra -- bi
    -- lis uir -- go ue -- ne -- ra -- bi -- lis pa -- rit sed in --
    "tac " -- ta. O -- pe -- ran -- te "spi " -- ri -- tu si -- ne ui --
    ri co -- i -- tu ge -- ni -- trix est "fac " -- ta. Car -- di -- ne
    de su -- pe -- ro ro -- re sa -- lu -- ti -- fe -- ro uen -- ter fe
    -- con -- da -- tur. Pe -- pe -- rit fe -- con -- di -- tas et sa --
    cra uir -- gi -- ni -- tas in -- te -- gra ser -- ua -- tur. Si --
    cut ros in gra -- "mi " -- ne des -- "cen " -- dit "in " __ uir --
    gi -- "ne " __ uer -- bum sum -- mi "pa " -- tris. Pa -- trem non de
    -- se -- "ru " -- it et "mor " -- ta -- "lem " __ in -- du -- "it "
    __ for -- mam al -- uo "ma " -- tris. Si -- cut ter -- ram plu -- ui
    -- a sic di -- ui -- na gra -- "ti " -- a uir -- gi -- nem fe -- con
    -- dat. Sanc -- tus e -- am "spi " -- ri -- tus a pec -- ca -- to pe
    -- "ni " -- tus ab -- lu -- it et mun -- dat. Non est o -- pus ho --
    mi -- nis sed est o -- pus nu -- mi -- "nis " __ et mag -- ne uir --
    "tu " -- tis. Que u -- num non no -- ue -- rat con -- ci -- pit et
    ge -- ne -- "rat " __ auc -- to -- rem sa -- "lu " -- tis. }

% The score definition
\new Staff <<
    \set Staff.instrumentName = "[Tenor]"
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsOne
        >>
    >>

