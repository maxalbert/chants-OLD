
\version "2.14.2"
% automatically converted from 02_Regnantem.xml

\header {
    encodingsoftware = "Sibelius 6.2"
    tagline = "Sibelius 6.2"
    encodingdate = "2015-04-22"
    copyright = "Copyright © "
    title = "2) Regnantem"
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
    \clef "treble_8" \key c \major \time 23/4 \pageBreak | % 1
    a4 -"Analecta Hymnica, vol. 7, no. 7, p. 30." a4 g4 a4 g4 g4 f4 a4 a4
    g4 a4 g4 ^"2) Regnantem" ^"260r" g4 f4 e4 f4 g4 e4 g4 f4 e4 c4 d4 | % 2
    \time 9/4  e4 f4 g4 e4 g4 f4 e4 c4 d4 \break | % 3
    \time 19/4  d4 d4 a'4 a4 c4 b4 g4 g4 f4 d4 e4 f4 d4 c4 f4 e4 g4 e4 d4
    | % 4
    d4 d4 a'4 a4 c4 b4 g4 g4 f4 d4 e4 f4 d4 c4 f4 e4 g4 e4 d4 \break | % 5
    \time 8/4  d4 f4 e4 f4 e4 c4 d4 d4 \bar "dashed"
    d4 f4 e4 f4 e4 c4 d4 d4 \break | % 6
    \time 20/4  a'4 g4 a4 d4 a4 c4 b4 a4 g4 f4 ( e4 ) d4 e4 f4 d4 e4 d4
    c4 d4 d4 | % 7
    a'4 g4 a4 d4 a4 c4 b4 g4 g4 f4 ( e4 ) d4 e4 f4 d4 e4 d4 c4 d4 d4
    \break | % 8
    \time 17/4  d4 c4 ( b4 ) a4 c4 ( b4 ) c4 d4 d4 c4 ( f4 ) e4 d4 d4 c4
    d4 d4 | % 9
    d4 c4 ( b4 ) a4 c4 ( b4 ) c4 d4 d4 c4 ( f4 ) e4 d4 d4 c4 d4 d4
    \break | \barNumberCheck #10
    \time 12/4  a'4 d,4 e4 c4 e4 g4 f4 e4 d4 c4 d4 d4 | % 11
    a'4 d,4 e4 c4 e4 g4 f4 e4 d4 c4 d4 d4 \break | % 12
    \time 11/4  d4 e4 c4 d4 c4 d4 d4 e4 f4 e4 d4 | % 13
    \time 5/4  d4 ( e4 d4 ) c4 ( d4 ) \bar "|."
    }

PartPOneVoiceOneLyricsOne =  \lyricmode { Reg -- nan -- tem sem -- pi --
    ter -- na per sec -- la sus -- cep -- tu -- ra con -- ci -- o de --
    uo -- te con -- cre -- pa. Fac -- to -- ri red -- den -- do de -- bi
    -- ta. Quem iu -- bi -- lant ag -- mi -- na ce -- li -- ca e -- ius
    uul -- tu ex -- hi -- la -- ra -- ta. Quem ex -- pec -- tant om --
    ni -- a ter -- re -- a e -- ius nu -- tu e -- xa -- mi -- nan -- da.
    Di -- stric -- tum ad iu -- di -- ci -- a cle -- men -- tem in po --
    ten -- ti -- a. Tu -- a nos sal -- ua Chri -- ste cle -- men -- "ti
    " -- a prop -- ter quos pas -- sus es di -- ra. Ad po -- li a --
    stra sub -- le -- ua ni -- "ti " -- da qua sor -- de ter -- gis se
    -- cu -- la. In -- flu -- ris "sa " -- lus ue -- ra "ef " -- fu --
    ga pe -- ri -- cu -- la. Om -- ni a "ut " __ sint mun -- da "tri "
    -- bu -- e pa -- ci -- fi -- ca. Ut hic tu -- a sal -- ui mi -- se
    -- ri -- cor -- di -- a. Le -- ti reg -- na post a -- de -- "a " --
    mus su -- pe -- ra. Quo reg -- nas se -- cu -- la per in -- fi -- ni
    -- ta. "A " -- "men. " __ }

% The score definition
\new Staff <<
    \set Staff.instrumentName = "[Tenor]"
    \context Staff << 
        \context Voice = "PartPOneVoiceOne" { \PartPOneVoiceOne }
        \new Lyrics \lyricsto "PartPOneVoiceOne" \PartPOneVoiceOneLyricsOne
        >>
    >>

