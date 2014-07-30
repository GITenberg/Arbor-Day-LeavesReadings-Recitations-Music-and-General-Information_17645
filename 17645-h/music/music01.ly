%Tribute to Nature

\version "2.6.5"
\include "english.ly"

global = {
 \time 3/4
 \key g \major
}

soprano = \relative c'' {
 g4 g a | fs4. g8 a4 \bar "||"  b b c | b4. a8 g4 \bar "||"
  a g fs | g2. \bar "||"
 d'4 d d | d4. c8 b4 \bar "||"  c c c | c4. b8 a4 \bar "||"
 b c8[ b] a[ g] | b4. c8 d4 \bar "||" e8[ c] b4 a | g2. \bar "||"
}

alto = \relative c' {
 d4 d e | d4. e8 fs4 | g g a | g4. fs8 g4 | e d d | d2. |
 b'4 b b | b4. a8 g4 | a a a | a4. g8 fs4 |
 g g fs8[ g] | g4. fs8 g4 | g g fs | g2. |
}

tenor = \relative c' {
 b4 b c | a4. d8 d4 | d e e | d4. c8 b4 | c b a | b2. |
 d4 d d | d4. d8 d4 | d d d | d4. d8 d4 |
 d e8[ d] c[ b] | d4. d8 d4 | c8[ e] d4 c | b2. |
}

bass = \relative c' {
 g4 g c, | d4. d8 d4 | g e c | d4. d8 e4 | c d d | g2. |
 g4 b d | g,4. g8 g4 | d fs a | d,4. d8 d4 |
 g g g | g4. a8 b4 | c d d, | g2. |
}

\score {
 \new ChoirStaff <<
  \new Staff << \clef treble \global \soprano \\ \alto >>
  \new Staff << \clef bass \global \tenor \\ \bass >>
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
