%Marching Song

\version "2.6.5"
\include "english.ly"

tempotext = \markup { \right-align \italic {Moderato.} }

chorustext = \markup { \italic {Chorus, 2d time \dynamic pp} }

global = {
  \key af \major
  \override Staff.TimeSignature #'style = #'()
  \time 4/4 %typo in original: 3/4 corrected to 4/4
}

soprano = \relative c' {
 \autoBeamOff
 \partial 4
 \override TextScript #'padding = #2
 ef4^\tempotext | c' c c c | df2( c) | bf8 bf bf bf c4 bf | af2. ef4 | c' c c c | df2( c) \break
 bf8 bf bf bf c4 bf | af2. bf4\rest \bar "|:" f^\chorustext af df f, | ef af c2 | c4 bf g ef \break
 bf' af ef2 | f4 af df f, | ef af c c8 c | c4 bf g ef | af1 \bar ":|"
}

alto = \relative c' {
 \autoBeamOff \partial 4
 ef4 | ef ef ef ef | f2( ef) | df8 df df df ef4 df | c2. ef4 | ef ef ef ef | f2( ef) |
 df8 df df df ef4 df | c2. s4 \bar "|:" df f f df | c c ef2 | df4 df df df |
 c c c2 | df4 f f df | c c ef ef8 ef | df4 df df df | c1 \bar ":|"
}

bass = \relative c {
 \autoBeamOff \partial 4
 ef4 | af, af af af | af1 | ef'8 ef ef ef ef4 ef | af,2. ef'4 | af, af af af | af1 |
 ef'8 ef ef ef ef4 ef | af,2. r4 \bar "|:" df df df df | af af af2 | ef'4 ef ef ef |
 af, af af2 | df4 df df df | af af af af8 af | ef'4 ef ef ef | af,1 \bar ":|"
}

\score {
 \new ChoirStaff <<
  \new Staff << \clef treble \global \soprano \\ \alto >>
  \new Staff { \clef bass \global \bass }
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
