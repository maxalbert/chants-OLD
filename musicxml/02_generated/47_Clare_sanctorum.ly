
\version "2.14.2"
% automatically converted from 47_Clare_sanctorum.xml

\header {
    encodingsoftware = "Sibelius 6.2"
    tagline = "Sibelius 6.2"
    encodingdate = "2015-04-22"
    copyright = "Copyright © "
    title = "47) Clare sanctorum"
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
PartPOneVoiceOne =  \relative f {
    \clef "treble_8" \key c \major \time 28/4 \pageBreak | % 1
    f4 ^"283v" ^"47) Clare sanctorum" -"Analecta Hymnica, vol. 53, no.
    228, pp.367-369." g4 a4 a4 g4 a4 c4 c4 c4 b4 a4 c4 a4 c4 d4 c4 b4 a4
    c4 a4 c4 d4 c4 ( b4 ) a4 ( g4 ) a4 g4 \break | % 2
    \time 14/4  b4 d4 e4 b4 g4 a4 c4 b4 a4 g4 b4 g4 a4 g4 | % 3
    b4 d4 e4 b4 g4 a4 c4 b4 a4 g4 b4 g4 a4 g4 \break | % 4
    \time 19/4  g4 g4 g4 a4 b4 b4 a4 c4 e4 d4 d4 b4 d4 b4 c4 a4 g4 b4 b4
    | % 5
    g4 g4 g4 a4 b4 b4 a4 c4 e4 d4 d4 b4 d4 b4 c4 a4 g4 b4 b4 \break | % 6
    \time 17/4  a4 ( e'4 ) f4 e4 d4 e4 d4 b4 c4 b4 a4 g4 a4 b4 c4 a4 b4
    | % 7
    a4 ( e'4 ) f4 e4 d4 e4 d4 b4 c4 b4 a4 g4 a4 b4 c4 a4 b4 \break | % 8
    \time 15/4  g4 a4 c4 a4 a4 g4 b4 c4 d4 b4 a4 c4 a4 g4 b4 | % 9
    \time 22/4  g4 a4 c4 a4 a4 g4 b4 c4 d4 b4 a4 c4 a4 g4 b4 g4 a4 c4 a4
    a4 g4 b4 \break | \barNumberCheck #10
    \time 33/4  b4 d4 d4 d4 e4 d4 e4 d4 b4 b4 d4 d4 e4 e4 d4 e4 d4 b4 c4
    e4 d4 c4 e4 d4 d4 b4 d4 b4 c4 a4 g4 b4 b4 \break | % 11
    \time 26/4  c4 e4 d4 c4 e4 d4 d4 b4 d4 b4 c4 a4 c4 d4 e4 c4 d4 b4 c4
    a4 g4 a4 b4 a4 a4 g4 \bar "|."
    }

PartPOneVoiceOneLyricsOne =  \lyricmode { Cla -- re sanc -- to -- rum se
    -- na -- tus a -- po -- sto -- lo -- rum prin -- ceps or -- bis ter
    -- ra -- rum rec -- tor "que " __ "reg " -- no -- rum. Ec -- cle --
    si -- a -- rum mo -- res et ui -- tam mo -- de -- ra -- re. Que per
    doc -- tri -- nam tu -- am fi -- de -- les sunt u -- bi -- que. An
    -- ti -- o -- chus et re -- mus con -- ce -- dunt ti -- bi pe -- tre
    reg -- ni so -- li -- um. Ty -- ran -- ni -- dem tu pau -- le a --
    le -- xan -- dri -- nam in -- ua -- si -- sti gre -- ci -- am. "E "
    -- thy -- o -- pes hor -- ri -- dos ma -- the -- e ag -- nel -- li
    uel -- le -- re. "Qui " __ ma -- cu -- las nes -- ci -- at a -- li
    -- quas ue -- sti -- ti can -- di -- do. Tho -- ma bar -- tho -- lo
    -- me -- e. io -- han -- nes phi -- lip -- pe sy -- mon. Ja -- co --
    bi que pa -- ri -- les an -- dre -- a tha -- de -- e de -- i bel --
    la -- to -- res in -- cli -- ta. Et nos o -- ri -- ens et oc -- ci
    -- dens "im " -- mo te -- res mun -- di cir -- cu -- lus se pa --
    tres ha -- be -- re gau -- dent et ex -- pec -- tant iu -- di --
    ces. Et id -- cir -- co mun -- dus om -- nis lau -- des uo -- bis et
    ho -- no -- rem sanc -- tis de -- bi -- tum sup -- plex im -- pen --
    dit. }

% The score definition
\new Staff <<
    \set Staff.instrumentName = "[Tenor]"
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsOne
        >>
    >>

