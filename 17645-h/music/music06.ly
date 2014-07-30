%Woodman, Spare That Tree

\version "2.6.5"
\include "english.ly"

\header {
poet = \markup { \override #'(font-shape . caps) George P. Morris. }
composer = \markup { \override #'(font-shape . caps) Henry Russell. }
}

%Note: small caps did not display in image

global = {
  \time 4/4
  \key f \major %corrected typo bf major in first staff of original
  \autoBeamOff
}

sopMusic = \relative c' {
  a'4 a8.~ a16 a4. g8 | f2( c4) b'8\rest f8 | g4. g8 a8[ f8] c'8[ a8] | g2. g4 | a4. a8 a4. g8 |
  f2( g8[) f8] e8[ d8] | c4. a'8 a4 g4 | f2 b4\rest g4 | g4. g8 a8[ g8] f8[ d8] | c2( c'4) b8\rest c8 |
  b4. g8 f4. d8 | c2 b'4\rest \afterGrace c,4 {a'8} | a4. a8 a4( bf8) c8 | d4.( c8) c8[ bf8 a8 g8] | f4. c8 a'4. g8 | f2 b2\rest \bar "||"
}

altoMusic = \relative c' {
  f4 f8.~ f16 e4. e8 | f2( c4) s8 c8 | e4. e8 f4 f4 | e2. e4 | f4. f8 e4. e8 |
  d2( d4) bf4 | c4. f8 e4 e4 | f2 s4 e4 | e4. e8 d4 b4 | c2( e4) s8 e8 |
  d4. b8 b4. b8 | c2 s4 c4 | f4. f8 f4. f8 | f2 d2 | c4. c8 e4. e8 | f2 s2 |
}

tenorMusic = \relative c' {
  c4 c8.~ c16 c4. bf8 | a2. e8\rest a8 | c4. c8 c8[ a8] a8[ c8] | c2. c4 | c4. c8 c4. bf8 |
  a2( bf4) g4 | a4. c8 c4 bf4 | a2 e4\rest c'4 | c4. c8 b4 g8[ f8] | e2( g4) e8\rest g8 |
  g4. g8 d4. f8 | e2 e4\rest a4 | c4. c8 c4( bf8) a8 | bf4.( a8) g4( bf4) | a4. a8 c4. bf8 | a2 e2\rest |
}

bassMusic = \relative c {
  f4 f8.~ f16 c4. c8 | f2. s8 f8 | c4. c8 f4 f4 | c2. c4 | f4. f8 c4. c8 |
  d2( bf4) bf4 | c4. c8 c4 c4 | f2 s4 c4 | c4. c8 g'4 g,4 | c2( c4) s8 c8 |
  g4. g8 g4. g8 | c2 s4 f4 | f4. f8 f4. f8 | f2 bf,2 | c4. c8 c4. c8 | f2 s2 |
}

verseone = \lyricmode {
\set stanza = "1. "
Wood -- man, spare that tree! Touch not a sin -- gle bough; In youth it shel -- ter'd
me, And I'll pro -- tect it now; 'Twas my fore -- fa -- ther's hand, That
placed it near his cot, There, wood -- man let it stand, Thy axe shall harm it not!
}

versetwo = \lyricmode {
\set stanza = "2. "
That old,_fa -- mil -- iar tree, Its glo -- ry and re -- nown Are spread o'er land and
sea And would'st thou hew it down? Wood -- man for -- bear thy stroke! Cut
not its earth -- bound ties; Oh! spare that a -- ged oak, Now tow -- 'ring to the skies.
}

versethree = \lyricmode {
\set stanza = "3. "
When but_an i -- dle boy, I sought its friend -- ly shade; In all their gush -- ing
joy, Here, too, my sis -- ters played; My moth -- er kiss'd me here; My
fa -- ther press'd my hand, For -- give this fool -- ish tear, But let that old oak stand!
}

versefour = \lyricmode {
\set stanza = "4. "
My heart-strings 'round thee cling, Close as thy bark, old friend! Here shall the wild bird
sing, And still thy branch -- es bend. Old tree, the storm thou'lt brave, And
wood -- man leave the spot; While I've a hand to save, Thy axe shall harm it not!
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
      tenors { \voiceOne << \global \tenorMusic >> }
    \context Voice =
      basses { \voiceTwo << \global \bassMusic >> }
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

\paper { raggedbottom = ##t }
