%Star Spangled Banner

\version "2.6.5"
\include "english.ly"

global = {
  \time 3/4
  \key bf \major
  \autoBeamOff
}

sopMusic = \relative c' {
\partial 2
\once \override NoteHead #'font-size = #-4 bf8 bf4 \once \override NoteHead #'font-size = #-4 bf8 |
        bf4 d f |
        bf2 d8( c) |
        bf4 d, e |
        f2 f8~ f |
        d'4. c8 bf4 |

        a4. g8 a4 |
        bf4 bf f |
        \cadenzaOn d bf \bar "|" bf8 bf \cadenzaOff \bar "|"
        bf4 d f |
        bf2 d8( c) |

        bf4 d, e |
        f2 f8~ f |
        d'4. c8 bf4 |
        a4. g8 a4 |
        bf4 bf f |
        d bf d'8~ d |

        d4 d ef |
        f2 ef8( d) |
        c4 c d |
        ef2 ef8~ ef |
        d4. c8 bf4 |

        a4. g8 a4 |
        bf d, e |
        \cadenzaOn f2 \bar "|" f8( f8) \cadenzaOff \bar "|"
        bf4 bf bf8[ a] |
        g4 g g |

        c ef8[ d] c[ bf] |
        bf4( a) f8 f |
        bf4. c8 d[ ef] |
        f2\fermata bf,8 c |
        d4. ef8 c4 |
        bf2 \bar "|."
}

altoMusic = \relative c' {
\partial 2
\once \override NoteHead #'font-size = #-4 bf8 \melisma bf4 \once \override NoteHead #'font-size = #-4 bf8 \melismaEnd |
        bf4 d f |
        bf2 f8( ef) |
        d4 d c |
        c2 f8~ f |
        f4. ef8 d4 |

        f4. f8 f4 |
        f d f |
        \cadenzaOn d bf \bar "|" bf8 bf \cadenzaOff \bar "|"
        bf4 d f |
        bf2 f8( ef) |

        d4 d c |
        c2 f8~ f |
        f4. ef8 d4 |
        f4. f8 f4 |
        f d f |
        d bf f'8~ f |

        f4 f f |
        f2 f8( f) |
        a4 a bf |
        c2 f,8~ f |
        f4. ef8 d4 |

        f4. f8 f4 |
        f d c |
        \cadenzaOn c2 \bar "|" f8( ef) \cadenzaOff \bar "|"
        d4 d f |
        ef ef ef |

        ef ef g |
        d( c) f8 f |
        f4. a8 bf[ c] |
        d2 f,8 g | %corrected typo in original: c2 should be d2
        f4. f8 ef4 |
        d2 \bar "|."
}

bassMusic = \relative c {
\partial 2
\once \override NoteHead #'font-size = #-4 bf8 bf4 \once \override NoteHead #'font-size = #-4 bf8 |
        bf4 d f |
        bf2 f8( f) |
        bf4 bf, c |
        f2 f8~ f |
        bf,4. c8 d4 |

        f4. f8 ef4 |
        d bf f' |
        \cadenzaOn d bf \bar "|" bf8( bf) \cadenzaOff \bar "|"
        bf4 d f |
        bf2 f8( f) |

        bf4 bf, c |
        f2 f8~ f |
        bf,4. c8 d4 |
        f4. f8 ef4 |
        d bf f' |
        d bf bf'8~ bf |

        bf4 bf c |
        d2 c8( bf) |
        f4 f f |
        f2 a8~ a |
        bf4. bf8 bf4 |

        f4. f8 ef4 |
        d bf c |
        \cadenzaOn f2 \bar "|" f8( f) \cadenzaOff \bar "|"
        bf,4 bf d |
        ef ef ef8[ d] |

        c4 c8[ d] ef[ e] |
        f2 f8 ef |
        d4. f8 bf4 |
        bf2\fermata d,8 ef |
        f4. f8 f4 |
        bf,2 \bar "|."
}

verseone = \lyricmode {
\set stanza = "1. "
Oh, say can you see, by_the dawn's ear -- ly light, What_so proud -- ly we
hail'd at the twi -- light's last gleam -- ing? Whose broad stripes and bright stars thro'_the
per -- il -- ous fight, O'er_the ram -- parts we watched were so gal -- lant -- ly stream -- ing,
And_the rock -- et's red glare, the_bombs burst -- ing in air Gave proof thro' the
night that our flag was still there; Oh, say, does the star -- span -- gled
ban -- ner still wave O'er the land of the free, and the home of the brave?
}

versetwo = \lyricmode {
\set stanza = "2. "
On_the shore dim -- ly seen thro'_the mists of the deep, Where_the foe's haugh -- ty
host in dread si -- lence re -- pos -- es, What is that, which the breeze o'er_the
tow -- er -- ing steep, As_it fit -- ful -- ly blows, half con -- ceals, half dis -- clo -- ses!
Now_it catch -- es the gleam of_the morn -- ing's first beam, In_full glo -- ry re --
flect -- ed now shines on the stream; 'Tis_the star -- span -- gled ban -- ner, Oh,
long may it wave O'er the land of the free, and the home of the brave!
}

versethree = \lyricmode {
\set stanza = "3. "
Oh, thus be it ev -- er_when free -- men shall stand Be -- tween their loved
homes and the war's des -- o -- la -- tion. Blest with vic -- tory and peace, may_the
heav'n -- res -- cued land Praise_the pow'r that has made and pre -- served us a na -- tion.
Then con -- quer we must, when_our cause it is just, And this be our
mot -- "to--" ''In God is our trust,'' And_the star -- span -- gled ban -- ner in
tri -- umph shall wave O'er the land of the free, and the home of the brave! 
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

%Note: Original has two eighth notes in small font (in addition to quarter note in normal font) to indicate two syllables in first bar of second verse. Midi plays all three notes.

%Note: Did not transcribe quarter note in bar 10 - not necessary because same number of syllables in that bar for all verses