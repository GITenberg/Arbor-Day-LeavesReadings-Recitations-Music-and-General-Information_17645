%Planting of the Tree

\version "2.6.5"
\include "english.ly"

global = {
  \time 2/4
  \autoBeamOff
}

sopMusic = \relative c' {
  e4 f4 | g4 f8[ e8] | a4 g4 | f2 | d4 e4 | f4 e8[ d8] | g4 f4 | e2 \break
  c'4 b4 | a4 g4 | g4. f8 | e2 | f4 e4 | a4 g8[ f8] | e4. d8 | c2 \bar "||"
}

altoMusic = \relative c' {
  c4 c4 | c4 c4 | c4 cs4 | d2 | b4 c4 | d4 c8[ b8] | c4 c8[ b8] | c2 |
  e4 e4 | c4 c4 | d4( b8) d8 | c2 | c4 c4 | c8[ b8] c8[ d8] | c4( b8) b8 | c2
}

bassMusic = \relative c {
  c4 d4 | e4 d8[ c8] | f4 e8[ a8] | d,2 | g4 g4 | g4 g8[ f8] | e4 d8[ g8] | c,2
  a'4 g4 | f4 e4 | b8( g8) g'4 | c,2 | a'4 g4 | f4 e8[ f8] | g4 g,8 g8 | c2
}

verseone = \lyricmode {
\set stanza = "1. "
Long this lit -- tle stem has grown In a qui -- et spot, un -- known:
Now we plant it here, to be Ev -- er hon -- ored as our tree.
}

versetwo = \lyricmode {
\set stanza = "2. "
May the kind earth give it food, And warm sun -- light o'er it brood,
Shower make bright, and storm make hard, And no harm its growth re -- tard.
}

versethree = \lyricmode {
\set stanza = "3. "
May it give to men de -- light, Rich in shade, and fair to sight;
And while un -- told years roll by, Speak of us to mem -- o -- ry.
}

versefour = \lyricmode {
\set stanza = "4. "
Lit -- tle tree, our own! we pray, Be our tea -- cher eve -- ry day;
On us strength and grace im -- press, That we, too, the world may bless.
}

\score {
  \context ChoirStaff <<
  \context Staff = women <<
  \context Voice =
    sopranos { \voiceOne << \global \sopMusic >> }
  \context Voice =
    altos { \voiceTwo << \global \altoMusic >> }

  \context Lyrics = altos \lyricsto altos \verseone
  \new Lyrics \lyricsto altos \versetwo
  \new Lyrics \lyricsto altos \versethree
  \new Lyrics \lyricsto altos \versefour
  >>

  \context Staff = men <<
    \clef bass
    \context Voice =
      basses { << \global \bassMusic >> }
  >>
>>

\layout {
   indent = 0.0\cm
    \context {
      \Score
       \remove Bar_number_engraver
    }
 }
\midi { \tempo 4 = 100 }
}

%Note: fixed very odd and clearly incorrect lyrics alignment in original
