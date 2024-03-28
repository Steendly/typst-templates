#let project(
  title: "",
  subtitle: "",
  abstract: [],
  authors: (),
  body
) = {
  // Set the document's basic properties
  set document(author: authors.map(a => a.name), title: title)
  set text(font: "Liberation Sans", lang: "fr")
  set heading(numbering: "1.1.")
  set par(justify: true)

  // Title page
  align(center + horizon)[
    #text(2em, weight: 700, title)
  ]

  // Subtitle page
  align(center + horizon)[
    #block(text(1.5em, weight: 500, subtitle), above: 1em, below: 3em)
  ]

  // Link configuration
  show link: set text(fill: blue)
  show link: underline

  // List configuration
  set list(indent: 1.5em)

  // Author information
  pad(
    grid(
      columns: (1fr),
      gutter: 1em,
      ..authors.map(author => align(center)[
        *#author.name* \
        #author.email
      ])
    )
  )
  pagebreak()

  // Abstract page
  align(center + horizon)[
    #text(abstract)
  ]
  pagebreak()

  // Table of contents
  align(horizon + center, outline(depth: 3, indent: true))
  pagebreak()

  // Heading configuration
  show heading.where(level: 1) : it => {
    pagebreak(weak: true)
  }
  show heading.where(level: 2): it => {
    let loc = it.location()
    let headings = query(selector(heading).before(loc), loc)
    if headings.len() == 0 or headings.at(-2).level != 1 {
      v(2em)
      it
    } else {
      it
    }
  }
  show heading.where(level: 3) : it => {
    v(1em)
    it
  }

  // Figure configuration
  show figure.caption: emph

  // Rect configuration
  set rect(stroke: none)

  // Main body
  set page(numbering: "1", number-align: center)
  counter(page).update(1)
  body
}


#let heading_1(title, subtitle: "") = {
  if subtitle == "" {
    hide(heading(title))
    pagebreak(weak: true)
    align(center)[
      #block(text(2em, weight: 700, title), above: 0.5em, stroke: black, inset: 1em, width: 100%)
    ]
  } else {
    hide(heading(title + " - " + subtitle))
    pagebreak(weak: true)
    align(center + horizon)[
      #text(2em, weight: 700, title)
      #block(text(1.5em, weight: 500, subtitle), above: 0.5em)
    ]
  }
}


#let heading_2(title, break_ordering: false) = {
  if break_ordering == false {
    hide(heading(title, level: 2))
  } else {
    hide(heading(title, level: 1))
  }
  pagebreak(weak: true)
  align(center)[
    #block(text(2em, weight: 700, title), above: 0.5em, stroke: black, inset: 1em, width: 100%)
  ]
}


#let commented_text(content) = {
  text(content, orange)
}
