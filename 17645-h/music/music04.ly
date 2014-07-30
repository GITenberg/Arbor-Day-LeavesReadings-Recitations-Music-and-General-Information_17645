%Planting the Tree

\version "2.6.5"
\include "english.ly"

tempotext = \markup { \italic {Steady Time.} }

segno = \markup { \musicglyph #"scripts.segno" }

dalsegno = \markup { \italic {D.S.} }

fine = \markup { \italic {Fine.} }

cue = { \once \set fontSize = #-2 }

global = {
 \time 2/4
 \key a \major
 \override Staff.Rest #'staff-position = #0
}

soprano = \relative c' {
 \autoBeamOff
 \override TextScript #'padding = #2
 e4^\tempotext a8. a16 | a4. r8 | e4 b'8. gs16 | a4. r8 |
 e4 a8. d16 | d4 cs8. b16 | a4 gs8. a16 | b4. r8 \bar "||"

 e,4^\segno a8. a16 | a4. r8 | e4 b'8. gs16 | a4. r8 |
 e4 a8. cs16 | e4 cs8. a16 | fs4 b8. cs16 | a4. r8^\fine \bar "||"

 d4 cs8 b8 | fs4 fs4 | gs4 a8. b16 | b4. r8 |
 d4 cs8 b8 | fs4 fs4 | gs4 a8. b16 | b4. r8^\dalsegno \bar "|."
}

alto = \relative c' {
 \autoBeamOff
 e4 e8. e16 | e4. s8 | e4 e8. e16 | e4. s8 |
 cs4 cs8. fs16 | fs4 e8. e16 | e4 ds8. ds16 | e4. \cue e8 \bar "||"

 e4 e8. e16 | e4. \cue e8 | e4 e8. e16 | e4. s8 |
 cs4 e8. a16 | gs4 fs8. fs16 | fs4 e8. d16 | cs4. s8 \bar "||"

 fs4 e8 d8 | d4 d4 | e4 e8. e16 | e4. s8 |
 fs4 e8 d8 | d4 d4 | e4 e8. e16 | e4. s8 \bar "|."
}

tenor = \relative c' {
 \autoBeamOff
 cs4 cs8. cs16 | cs4. r8 | cs4 d8. b16 | cs4. r8 |
 a4 a8. a16 | a4 a8. d16 | cs4 a8. a16 | gs4. r8 \bar "||"

 cs4 cs8. cs16 | cs4. r8 | cs4 d8. b16 | cs4. r8 |
 a4 cs8. cs16 | cs4 a8. cs16 | b4 gs8. gs16 | a4. r8 \bar "||"

 a4 gs8 fs8 | b4 b4 | b4 cs8. gs16 | gs4. r8 |
 a4 gs8 fs8 | b4 b4 | b4 cs8. gs16 | gs4. r8 \bar "|."
}

bass = \relative c' {
 \autoBeamOff
 a4 a8. a16 | a4. s8 | a4 e8. e16 | a4. s8 |
 a4 a8. a16 | d,4 a'8. a16 | a4 fs8. fs16 | e4. s8 \bar "||"

 a4 a8. a16 | a4. s8 | a4 e8. e16 | a4. s8 |
 a4 a8. a16 | cs,4 fs8. fs16 | d4 e8. e16 | a,4. s8 \bar "||"

 R2*2 | e'4 e8. e16 | e4. s8 |
 R2*2 | e4 e8. e16 | e4. s8 \bar "|."
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
