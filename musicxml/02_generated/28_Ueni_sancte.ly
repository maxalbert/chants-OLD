
\version "2.14.2"
% automatically converted from 28_Ueni_sancte.xml

\header {
    encodingsoftware = "Sibelius 6.2"
    tagline = "Sibelius 6.2"
    encodingdate = "2015-04-22"
    copyright = "Copyright © "
    title = "28) Ueni sancte"
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
    d4 -"Analecta Hymnica, vol. 54, no. 153, pp. 234-239." d4 c4 d4 e4 f4
    g4 f4 d4 e4 c4 f4 e4 ^"272v" ^"28) Ueni sancte" d4 f4 g4 a4 g4 f4 e4
    d4 | % 2
    d4 d4 c4 d4 e4 f4 g4 f4 d4 e4 c4 f4 e4 d4 f4 g4 a4 g4 f4 e4 d4
    \break | % 3
    a'4 g4 f4 e4 g4 g4 a4 a4 g4 f4 d4 e4 d4 c4 e4 f4 d4 e4 c4 d4 d4 | % 4
    a'4 g4 f4 e4 g4 g4 a4 a4 g4 f4 d4 e4 d4 c4 e4 f4 d4 e4 c4 d4 d4
    \break | % 5
    \time 27/4  a'4 g4 a4 b4 c4 \slurDotted b4 ( \slurSolid a4 g4 ) a4 a4
    c4 g4 \slurDotted f4 ( \slurSolid e4 d4 ) e4 f4 \slurDotted e4 (
    \slurSolid d4 c4 ) f4 g4 a4 g4 f4 e4 d4 | % 6
    \time 25/4  a'4 g4 a4 b4 c4 \slurDotted b4 ( \slurSolid a4 g4 ) a4 a4
    c4 g4 d4 e4 f4 \slurDotted e4 ( \slurSolid d4 c4 ) f4 g4 a4 g4 f4 e4
    d4 \break | % 7
    \time 23/4  a'4 a4 g4 c4 b4 g4 a4 b4 c4 d4 a4 b4 c4 \slurDotted b4 (
    \slurSolid a4 g4 ) b4 c4 a4 b4 g4 a4 a4 | % 8
    a4 a4 g4 c4 b4 g4 a4 b4 c4 d4 a4 b4 c4 \slurDotted b4 ( \slurSolid a4
    g4 ) b4 c4 a4 b4 g4 a4 a4 \break | % 9
    \time 25/4  e4 f4 g4 g4 g4 f4 e4 e4 g4 a4 d,4 e4 f4 \slurDotted e4 (
    \slurSolid d4 c4 ) e4 g4 a4 g4 f4 e4 ( d4 e4 ) d4 | \barNumberCheck
    #10
    e4 f4 g4 g4 g4 f4 e4 e4 g4 a4 d,4 e4 f4 \slurDotted e4 ( \slurSolid
    d4 c4 ) e4 g4 a4 g4 f4 e4 ( d4 e4 ) d4 \break | % 11
    \time 5/4  d4 ( e4 d4 ) c4 ( d4 ) \bar "|."
    }

PartPOneVoiceOneLyricsOne =  \lyricmode { Ue -- ni sanc -- te spi -- ri
    -- tus et e -- mit -- te ce -- li -- tus lu -- cis tu -- e ra -- di
    -- um. Ue -- ni pa -- ter pau -- pe -- rum ue -- ni da -- tor mu --
    ne -- rum ue -- ni lu -- men cor -- di -- um. Con -- so -- la -- tor
    op -- ti -- me dul -- cis hos -- pes a -- ni -- me dul -- ce re --
    fri -- ge -- ri -- um. In la -- bo -- re re -- qui -- es in es -- tu
    tem -- pe -- ri -- es. in fle -- tu so -- la -- ti -- um. O lux be
    -- a -- tis -- "si " -- ma re -- ple cor -- "dis " __ in -- ti --
    "ma " __ tu -- o -- rum fi -- de -- li -- um. Si -- ne tu -- o nu --
    "mi " -- ne ni -- chil est in lu -- mi -- "ne " __ ni -- chil est in
    -- no -- xi -- um. La -- ua quod est sor -- di -- dum ri -- ga quod
    est a -- ri -- "dum " __ sa -- na quod est sau -- ci -- um. Flec --
    te quod est ri -- gi -- dum. fo -- ue quod est fri -- gi -- "dum "
    __ re -- ge quod est de -- ui -- um. Da -- tu -- is fi -- de -- "li
    " -- bus in te con -- fi -- den -- "ti " -- "bus " __ sa -- crum se
    -- pte -- na -- "ri " -- um. Da uir -- tu -- tis me -- ri -- tum da
    sa -- lu -- tis e -- xi -- "tum " __ da per -- hem -- pne gau -- "di
    " -- um. "A " -- "men. " __ }

% The score definition
\new Staff <<
    \set Staff.instrumentName = "[Tenor]"
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsOne
        >>
    >>

