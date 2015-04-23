
\version "2.14.2"
% automatically converted from 38_Mirabilis_Deus_in_Sanctis.xml

\header {
    encodingsoftware = "Sibelius 6.2"
    tagline = "Sibelius 6.2"
    encodingdate = "2015-04-22"
    copyright = "Copyright © "
    title = "38) Mirabilis Deus in Sanctis"
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
    \clef "treble_8" \key c \major \time 19/4 \pageBreak | % 1
    a4 ^"278r" ^"38) Mirabilis Deus in Sanctis" -"Analecta Hymnica, vol.
    53, no. 231, pp. 372-373." g4 bes4 a4 g4 f4 e4 g4 a4 a4 g4 f4 e4 d4
    e4 d4 c4 d4 d4 | % 2
    a'4 g4 bes4 a4 g4 f4 e4 g4 a4 a4 g4 f4 e4 d4 e4 d4 c4 d4 d4 \break | % 3
    \time 13/4  c4 d4 e4 e4 d4 f4 e4 d4 e4 d4 c4 d4 d4 | % 4
    \time 21/4  e4 g4 g4 a4 a4 g4 f4 e4 f4 d4 g4 g4 g4 f4 e4 d4 e4 d4 c4
    d4 d4 \break | % 5
    \time 34/4  c4 d4 e4 e4 d4 f4 e4 d4 e4 d4 c4 d4 d4 \[ e4 g4 \] g4 g4
    a4 g4 f4 e4 f4 d4 g4 g4 f4 e4 d4 d4 e4 d4 c4 d4 d4 \break | % 6
    \time 26/4  a'4 f4 a4 a4 g4 e4 g4 d4 c4 g'4 g4 f4 e4 f4 d4 g4 g4 g4
    f4 e4 d4 e4 d4 c4 d4 d4 \break | % 7
    a'4 f4 a4 a4 g4 e4 g4 d4 c4 g'4 g4 f4 e4 f4 d4 g4 g4 g4 f4 e4 d4 e4
    d4 c4 d4 d4 \break | % 8
    \time 9/4  d4 e4 c4 d4 ( f4 ) g4 f4 ( e4 ) d4 \break | % 9
    \time 5/4  d4 ( e4 d4 ) c4 ( d4 ) \bar "|."
    }

PartPOneVoiceOneLyricsOne =  \lyricmode { Mi -- ra -- bi -- lis De -- us
    in sanc -- tis mi -- ra -- bi -- li -- a. dans mag -- ni -- fi --
    ca. Qui fi -- de pre -- cla -- ra ui -- ce -- runt mun -- di gra --
    uis -- si -- ma "pe " -- ri -- cu -- la. Ju -- di -- cum mi -- nas
    uer -- be -- ra et blan -- di -- ci -- as. Con -- tem -- pnen -- tes
    men -- te ro -- bu -- sta ue -- ris -- si -- mo fu -- de -- runt re
    -- gi a -- ni -- mas. Er -- go tri -- um -- phant lau -- re -- a
    comp -- ti ca -- pi -- ta "se " -- cu -- ti rec -- te ue -- sti --
    gi -- a ag -- ni sin -- gu -- la -- ris iam "Chris " -- ti sa -- cra
    -- ta. Cu -- i as -- si -- du -- e mel -- li -- flu -- a dant can --
    ti -- ca e -- ius pre -- dul -- cis -- si -- ma ple -- ni glo -- ri
    -- a. "Quo " -- rum ce -- le -- bran -- tes sol -- lem -- pni -- a
    con -- sor -- ti -- o iun -- gi quo me -- re -- a -- mur "Chri " --
    stus "an " -- nu -- et Qui no -- stra "est " __ glo -- "ri " -- a.
    "A " -- men. }

% The score definition
\new Staff <<
    \set Staff.instrumentName = "[Tenor]"
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsOne
        >>
    >>

