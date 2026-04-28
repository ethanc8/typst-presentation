#import "styling.typ": *

#show: template

#title-slide[
  #set par(leading: -12pt)
  #set text(26pt)
  #smallcaps[a glimpse of]\
  #set text(140pt)
  *typst*
]

#slide[
  #subtitle[Plan]

  #set text(23pt)

  #outline(title: none)

  #v(1fr)
]

#subsection(columns: 2)[
  #hidden-heading[Introduction to Typst]

  Typst is a\ *typesetting*\ _system_
]

#slide[

  #subtitle[The project in numbers #text(0.7em)[(as of April 2026)]]

  Started by 2 students at TU Berlin,  currently a team of 5.

  #v(1em)

  #columns(2)[
    *Command-line compiler*

    - Open source release in 2023

    - 414 contributors

      - 20 in last month

    #v(1em)

    *Community and ecosystem*

    - 2934 users on the forum

    - 1269 packages

    #colbreak()

    *Webapp*

    - 200K users

    - 600K projects

    #v(1em)

    *Funding*

    - WebApp (Pro plan and On-Premises)

    - One engineer funded by Posit (Quarto)

    - Initial #sym.euro;225k angel + EU grants
  ]
]

#slide[
  #subtitle[Local installation]
  #let ext = box.with(inset: 15pt, fill: luma(90%), radius: 10pt)

  #set text(22pt)
  #link(
      "https://typst.app/open-source/#download",
      `typst.app/open-source/#download`)

  #set text(24pt)
  #v(-1cm)

  #let compile = text(1.2em, `typst compile file.typ`)
  #let watch = text(1.2em, `typst watch file.typ`)
  $
    #ext(baseline: 0.5em)[`*.typ`]
    stretch(->, size: #9cm)^compile_watch
    cases(
      #ext(`*.pdf`),
      #ext(`*.png`),
      #ext(`*.svg`),
      #ext(fill: none, stroke: luma(90%)+2pt)[`*.html`],
    )
  $
]

#slide[
  #subtitle[Webapp]

  #v(-0.5em)

  Try it at #link("https://typst.app/play/", `typst.app/play/`)

  #v(0.5em)

  #set list(marker: sym.checkmark)

  *Free plan*

  - Live preview

  - Real-time collaboration

  #v(0.5em)

  *Pro plan*

  - Comments

  - GitHub/GitLab sync

  - Zotero/Mendeley sync

  - Presentation mode (pointer, pen, speaker mode...)

  #place(top+right, dy: -2cm, dx: 1cm, image("resources/webapp.png", height: 75%))
]

#subsection(columns: 2)[
  #colbreak()
  #v(0.4fr)
  Typst is a\ *markup*\ _language_
]

#title-slide[
  #text(150pt)[*3*] modes:\
  #set text(30pt)
  markup, _math_, `code`
]

#slide[
  #subtitle[A source file starts in Markup mode]

  #v(-1fr)

  #set heading(numbering: "1.", outlined: false)

  // Undo previous increment, will be redone
  // below by = Introduction
  #counter(heading).update(0)

  #code-and-result(
    ```
    = Introduction
    Some things are *important* and
    must be _emphasized_.

    == First approach <part1>
    Some more text.

    == Second approach
    Something different from @part1.
    
    ```,

    ```
    Enumerations:
    + Lemon
    + Banana
    ```,

    ```
    + Lemon

    + Banana
    ```,

    raw(
      block: true,
      (
        "A code block:",
        "```py",
        "x = 3",
        "print(x + 5)",
        "```",
      ).join("\n"),
    ),
  )
]

#slide[
  #subtitle[Switch to math mode:  `$ ... $`]
  #v(-1fr)
  #code-and-result(
    ```
    Euler's formula:
    $ 
      e^(i theta) 
      = sum_(n=0)^oo (i theta)^n / n! 
      = cos(theta) + i sin(theta). 
    $
    ```,

    ```
    Using $theta = pi$ the formula
    gives $e^(i pi) = -1$.
    ```,

    ```
    $
      A inter B = emptyset => 
      A without B = A
    $
    ```,

    ```
    $ 
      Q = 2 pi E_"start" /
        E_"dissipated"
    $
    ```,

    ```
    $ W = arrow(F) dot arrow(d) $
    ```,

    ```
    $ QQ = { p/q : p in ZZ, q in NN } $
    ```,

    ```
    $
      vec(3,9,15) = 
      mat(1,2,3; 4,5,6; 7,8,9) 
      vec(1,1,0)   
    $
    ```,
    
    ```
    $
      f(x) &= (x+1)^2 &&= x^2 + 2x + 1 \
      g(x) &= 10(x-1) &&= 10x - 10
    $
    ```,
  )
]

#slide[
  #subtitle[Switch to code mode: ` #...`]

  #v(-1em)
  #code-and-result(
    ```
    Example: bold text

    - With *markup*

    - With #strong[function call]
    ```
  )

  Here `[]` goes back to markup mode. Compare:

  #show regex("[\[\]()]"): set text(weight: "bold", red.darken(10%))

  #code-and-result(
    ```
    - #strong[Some _markup_ value]
    - #strong("Some _string_ value")
    ```
  )
]

#slide[
  #set table(inset: 0.5em)
  #code-and-result(
    ``` 
    #let n = 3

    Powers of 2 up to $n = #n$:

    #for i in range(n+1) {
      let value = calc.pow(2, i)
      $ 2^#i = #value $
    }
    ```,
  )
]

#subsection[
  #set align(left)
  `set` & `show`
]

#slide[
  #set text(size: 36pt)
  #set align(center)
  #show "text": it => box({
    it
    set text(1em/0.8, black)
    place(bottom+center, math.overbrace(hide("link"), "element"))
  })
  #show "size:": it => box({
    it
    set text(1em/0.8, black)
    place(
      top+center,
      dx: 1.2em,
      math.underbrace(hide(" size: 30pt "), "new defaults"),
    )
  })
  ```typ #set text(size: 30pt)```
]

#slide[
  #code-and-result(
    ```
    #set text(
      font: "New Computer Modern",
      size: 24pt,
    )

    This is the familiar LaTeX font.
    ```,

    ```
    #set enum(numbering: "a1)")
    + Element A 
      + Element A1
      + Element A2
    + Element B 
    ```,
  )
]

#slide[
  #set text(size: 36pt)
  #set align(center)
  #block({
    set align(left)
    {
      show "link": it => box({
        it
        set text(1em/0.8, black)
        place(bottom+center, math.overbrace(hide("link"), "selector"))
      })
      ```typ #show link: set text(blue)```
    }
    v(0.5em)
    {
      show "underline": it => box({
        it
        set text(1em/0.8, black)
        place(top+center, math.underbrace(hide("underline"), "transformation"))
      })
      ```typ #show link: underline```
    }
  })
]

#slide[
  #code-and-result(
    ```
    #show link: set text(red)
    #show link: underline
    Go to https://www.example.com.
    ```,

    ```
    // Anonymous transformation function
    #show link: it => [🔗] + it
    Go to https://www.example.com.
    ```,
  )
]

#slide[
  #code-and-result(
    ```
    #set text(font: "Pennstander")

    #show math.equation: set text(
      font: "Pennstander Math",
    )

    The definite integral of $f$
    on $[a, b]$ is defined as

    $
      integral_a^b = lim_(n->oo)
        (b-a)/n sum_(i=1)^n f(xi_i)
    $
    ```,
  )
]

#subsection[
  // The preview shows more spacing due to https://github.com/typst/typst/issues/8072
  #block(width: 70%)[
    #set align(left)
    #text(size: 80pt, baseline: 10pt)[📦] Packages

    #set align(right)
    #set text(24pt)
    #show link: set text(main-gradient)
    from the #link("https://typst.app/universe/", underline[*Typst Universe*])
  ]
]

#slide[
  #subtitle[Diagrams with fletcher]
  #code-and-result(
    columns: (67%, auto),
    ```
    #import "@preview/fletcher:0.5.8": *

    #diagram(cell-size: 15mm, $
    	G edge(f, ->) edge("d", pi, ->>) & im(f) \
    	G slash ker(f) edge("ur", tilde(f), "hook-->")
    $)
    ```
  )
]

#slide[
  #subtitle[Plotting from CSV with Lilaq]
  #code-and-result(
    ```
    #import "@preview/lilaq:0.6.0"

    #let data = lilaq.load-txt(
      read("data.csv"), header: true)

    #lilaq.diagram(
      lilaq.plot(data.t, data.U),
      width: 100% - 1cm,
      height: 60%,
    )
    ```
  )
]

#slide[
  #subtitle[Electronic circuits with Zap]
  #code-and-result(
    ```
    #import "@preview/zap:0.5.0"

    #zap.circuit({
      import zap: *

      vsource("v1", (0, 0), (0, 4),
        u: $U$)
      resistor("r1", "v1.out", (8, 4),
        label: $R$, i: $I$)
      wire((8, 4), (8, 0))
      wire((8, 0), (0, 0))
    })
    ```,
  )
]

#slide[
  #subtitle[General-purpose drawing with CeTZ]
  #show raw.where(block: true): set block(breakable: true)
  #set text(0.7em)
  #code-and-result(
    columns: (100%, 40%),
    code-template: columns.with(2, gutter: 0pt),
    result-template: place.with(bottom, dx: -9cm, dy: 1cm),
    ```
    #import "@preview/cetz:0.4.2": canvas, draw, angle
    #canvas(length: 3.5cm, {
      import draw: *
      let my-alpha = 50deg
      let arrow = (end: ">", fill: black)
      let node = content.with(padding: 5pt)
      let P = (my-alpha, 1)
      let Px = (P, "|-", (0, 0))
      let Py = (P, "-|", (0, 0))
      line((-1.2, 0), (1.3, 0), mark: arrow)
      node((), anchor: "west", $x$)
      line((0, -1.2), (0, 1.3), mark: arrow)
      node((), anchor: "south", $y$)
      circle((0, 0), radius: 1)
      circle(P, radius: 1.5pt, fill: black)
      line((0, 0), P)
      line(Py, P, Px, stroke: (dash: "dotted"))
      node(Px, anchor: "north", $cos(alpha)$)  
      node(Py, anchor: "east", $sin(alpha)$)
      node((my-alpha, 0.55), anchor: "south-east", $1$)
      angle.angle(
        (0, 0), (1, 0), P,
        label: $alpha$,
        radius: 0.3,
        label-radius: 160%,
        mark: arrow)
      })
    ```
  )
]

#let neural-net = {
  show raw.where(block: true): set text(5pt)
  show raw.where(block: true): pad.with(left: 70mm)
  v(8mm)
  code-and-result(
    columns: 1,
    rows: (auto, auto),
    row-gutter: -10mm,
    align: center,
    result-template: scale.with(70%),
    raw(block: true, read("resources/neural-net.typ").trim()),
  )
}

#slide(background: neural-net)[
  #let grad = gradient.linear(
    (white.transparentize(100%), 0%),
    (white.transparentize(5%),  20%),
    (white.transparentize(5%),  80%),
    (white.transparentize(100%), 100%),
    dir: ttb,
  )
  #subtitle(fill: grad, outset: 20pt)[
    Neural network architectures with neural-netz
  ]
]

#slide[
  #subtitle(text(50pt)[Templates])
  
  #set text(size: 36pt)
  #set align(center)
  #show "show": it => box({
    it
    set text(1em/0.8, black)
    place(bottom+center, math.overbrace(hide("show:"), "select all content below"))
  })
  #show "template": it => box({
    it
    set text(1em/0.8, black)
    place(
      top+center,
      math.underbrace(hide("template"), "transformation"),
    )
  })
  ```typ #show: template```
]

#slide[
  #set text(0.8em)
  #raw(block: true, lang: "typ", read("resources/ams-template.typ").trim())

  #place(
    horizon+right,
    image("resources/ams-template.png", height: 85%),
  )
]

#section(toc-title: "In practice: comparison with LaTeX")[
  #set align(left)
  In practice\
  #text(0.6em, font: "New Computer Modern")[Comparison with LaTeX]
]

#slide[
  #subtitle[Installation]
  #set text(1.1em)

  #grid(
    columns: (50%, 50%),
    column-gutter: 1em,
    [
      *Typst*

      - 1 file

      - 50MB

      - Packages downloaded as necessary

    ],
    [
      *TeX Live*

      - 200K files

      - 7GB

      - Packages preinstalled

        // Note: MiKTeX can download on-demand
    ],
  )
  
]

#slide[
  #subtitle[Output quality]
  #set text(0.9em)

  #place(
    top+left,
    dy: -2.5cm,
    grid(
      columns: (50%, 50%),
      align: (left+horizon, right+horizon),
      [
        You know LaTeX.

        Typst sample from a #link("https://splines.me/blog/2026/bachelor-thesis-typst")[bachelor thesis]:
      ],
      {
        set block(inset: (bottom: -15mm), clip: true)
        image("resources/thesis-screenshot.png")
      },
    ),
  )

  #show: place.with(bottom)
  *Paragraph building and microtypography*

  #set list(marker: sym.checkmark)

  #grid(
    columns: (50%, 50%),
    column-gutter: 1em,
    align: top,
    [
      Typst
    
      - Knuth-Plass line breaking
      - Ligatures
      - Protrusions (basic)
      - Character-level justification
    ],
    [
      LaTeX

      - Knuth-Plass line breaking
      - Ligatures
      - Protrusions
      - Font expansion
      - Manual kerning adjustments (I never used it...)
    ],
  )
]

#slide[
  #subtitle[Reproducibility #text(0.7em)[(does it still compile?)]]
  #set text(1.1em)
  #set block(spacing: 2em)

  #grid(
    columns: (50%, 50%),
    [
      *Typst*

      - Not stable (still in 0.x phase)

    ],
    [
      *LaTeX*

      - Core: extremely stable

        Packages: not stable
    ],
  )
  #grid(
    columns: (50%, 50%),
    [
      // Space after first emoji is different in preview!
      // see 
      - Package use is versioned:

        ```typ #import "@preview/zap:0.5.0" ```

    ],
    [
      - No versioning of packages:

        ```tex \usepackage{circuitikz} ```
    ],
  )
  #grid(
    columns: (50%, 50%),
    [
      - Easy to co-install older version

    ],
    [
      - Difficult to install older version
    ],
  )
]

#slide[
  #v(-1fr)
  #v(1em)

  *Case in point:* compiling a very nice #link("https://liantze.penguinattack.org/latextypesetting.html")[LaTeX presentation from 2011]

  #v(1em)
  #set text(0.9em)

  #show raw.where(lang: "error"): set text(red.darken(30%))
  #set enum(spacing: 2em)

  + ```error
    ! LaTeX Error: File `dtklogos.sty' not found.
    ```

     In TeX Live 2016, the package was renamed to `dtk-logos.sty`

  + ```error
    Package `texshade', Version 1.28 of 2024/01/10

    ! LaTeX Error: Command \charge already defined.
                   Or name \end... illegal, see p.192 of the manual.
    ```

    No clue from Google, I comment out `\usepackage{texshade}` for now.

  + ```error
    ! Undefined control sequence.
    <argument> \MakeIndex
    ```

    I comment out all uses of `\MakeIndex`.

  + ```error
    [18] (./talk.vrb
    ! Missing number, treated as zero.
    <to be read again>
                       \kern
    l.10 \documentclass[
                        a4paper,11pt]{article}
    ```

    Apparently a breaking change in `listings`, the fix is to replace

    ```tex
    postbreak=\mbox{{\smaller\color{gray}$\hookrightarrow$}}
    ```

    with

    ```tex
    \newsavebox\postbreakbox
    \savebox\postbreakbox{\raisebox{0ex}[0ex][0ex]{\smaller\color{gray}$\hookrightarrow$}}
    ...
    postbreak=\usebox\postbreakbox
    ```

  + ```error
    ! Undefined control sequence.
    <recently read> \MikTeX
    ```

    Probably a breaking change in `dtk-logos`. I remove all occurrences of `\MikTeX`.


  + ```error
    ! Undefined control sequence.
    <argument> \tikz [remember picture,overlay]\node
                                                     [single arrow,fill=DarkSeaG...
    l.47 ...1em] at (current page.center) {pdflatex};}

    ?
    ```

    Probably a change in the interaction between TikZ overlays and Beamer uncover. \  I comment out.
    #v(1cm) // for new page for next item


  + ```error
    ! Package bytefield Error: Macros \wordgroupr, \wordgroupl, \endwordgroupr,
    (bytefield)                and \endwordgroupl no longer exist.

    See the bytefield package documentation for explanation.
    ```

    A breaking change in `bytefield`. Adapting the code.

  + ```error
    ! Missing } inserted.
    <inserted text>
                    }
    l.189 \end{frame}

    ?
    ```

    No idea even which file is the problem... I give up.
]


#slide[
  #subtitle[Error messages]

  #grid(
    columns: (50%, 50%),
    column-gutter: 1em,
    [
      *Typst*

      #image("resources/typst-error.png", width: 80%)
    ],
    [
      *LaTeX*

      ```error
      ! Missing } inserted.
      <inserted text>
                      }
      l.189 \end{frame}

      ?
      ```
    ],
  )
]

#slide[
  #subtitle[Security]

  Compiling that LaTeX presentation required `-shell-escape` !

  #v(1em)

  #grid(
    columns: (50%, 50%),
    column-gutter: 1em,
    [
      *Typst*

      - No execution of external programs

      - No reading outside project directory
    ],
    [
      *LaTeX*

      - Can run external programs when compiling with `-shell-escape`

      - Allows reading any file
    ],
  )
]

#slide[
  LaTeX can read _any file_...

  #v(1em)

  ```tex
  \documentclass{article}
  \usepackage{verbatim}
  \usepackage{xcolor}
  \begin{document}
  % Include public key as invisible text in PDF
  % (would work the same with private key!)
  \textcolor{white}{\verbatiminput{\string~/.ssh/id_ed25519.pub}}
  \end{document}

  ```
]

#slide[
  Typst: no `-shell-escape` but WebAssembly plugins!

  Example: the `neoplot` package *embeds Gnuplot*

  #code-and-result(columns: (60%, 40%),
    ````
    #import "@preview/neoplot:0.0.4" as gp
    #show raw.where(lang: "gnuplot"): gp.exec

    ```gnuplot
    set termoption font "DejaVu Sans,28"
    set key outside top center horizontal
    plot sin(x) lw 3, cos(x) lw 3
    ```
    ````
  )
  
  #v(-4em)
  - Fairly secure

  - Zero installation required

  - Works on Windows, macOS, Linux
]

#slide[
  #subtitle[Syntax]

  #grid(
    columns: (50%, 50%),
    ```
    #slide[Installation][
      #set text(1.1em)
      #grid(
        columns: (50%, 50%),
        column-gutter: 1em,
        [
          *Typst*
          - 1 file
          - 50MB
        ],
        ...
      )
    ]
    ```,
    ```tex
    \begin{frame}{Installation}
    \fontsize{11pt}{13pt}\selectfont
    \begin{columns}
        \begin{column}{0.48\textwidth}
            \textbf{Typst}
            \begin{itemize}
                \item 1 file
                \item 50MB
            \end{itemize}
        \end{column}
        ...
    \end{columns}
    \end{frame}
    ```,
  )
]

#slide[
  *Typst*

  ```
  $ QQ = { p/q : p in ZZ, q in NN } $
  ```

  $ QQ = { p/q : p in ZZ, q in NN } $

  #v(1em)

  *LaTeX*

  ```tex
  \documentclass{article}
  \usepackage{amssymb}
  \begin{document}
  \[ \mathbb{Q} = \left\{\frac{p}{q}: p\in\mathbb{Z},q\in\mathbb{N}\right\} \]
  \end{document}
  ```
  #v(0pt, weak: true)
  #align(center, image("resources/latex-eq.png", width: 7.4cm))
]

#slide[
  #subtitle[Performance]

  #grid(
    columns: (50%, 50%),
    [
      *Typst*

      - Incremental compiler
    ],
    [
      *LaTeX*

      - Multipass compiler
    ],
  )
  
  #v(1em)
  With my linear algebra lecture notes (140 pages):
  #v(1em)

  #grid(
    columns: (50%, 50%),
    [
      Typst

      - 6s
      - 1 output file
      - on change: *instant preview*
    ],
    [
      LaTeX

      - 17s
      - 21 output files
      - on change: full recompile (6s if lucky)
    ],
  )
]

#slide[
  #subtitle[Programming]

  Let's print all prime numbers under 50, comma-separated:
  #[
    #show sym.comma: sym.comma + sym.space.med
    $ 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47 $
  ]

  #v(1em)
  Compare implementations for the *sieve of Eratosthenes* in

  + Plain LaTeX

  + LaTeX3

  + LuaLaTeX

  + Typst

  #v(1em)

]

#let code-sample(title, file, columns: 2, lang: "tex") = slide({
  v(-0.5em)
  title
  show raw.where(block: true): set text(0.7em)
  show raw.where(block: true): set block(breakable: true)
  std.columns(
    columns,
    raw(block: true, lang: lang, read(file).trim()),
  )
})

#code-sample("Plain LaTeX", "resources/eratosthenes/latex.tex")
#code-sample("LaTeX3", "resources/eratosthenes/latex3.tex")
#code-sample("LuaLateX", "resources/eratosthenes/luatex.tex")
#code-sample("Typst", "resources/eratosthenes/typst.typ", lang: "typ")

#slide[
  #v(-2em)
  Another Typst example: building a point table on the exam's first page

  #v(0.5em)

  ```
  #context {
    let n = query(heading).len()
    table(
      inset: 1em,
      align: center,
      columns: (auto,) + (1.5cm,) * n + (auto,),
      [Exercise], ..range(n).map(i => str(i + 1)), [Total],
      [Points],
    ),
  }
  = Ex 1
  = Ex 2
  = Ex 3
  ```

  // Add supplement to avoid interference from slide headings
  #set heading(numbering: none, outlined: false, supplement: [exercise])
  #set text(0.8em)
  #context {
    let n = query(heading.where(supplement: [exercise])).len()
    v(-5em)
    place(
      bottom+right,
      dx: -8em,
      table(
        inset: 1em,
        align: center,
        columns: (auto,) + (1.5cm,) * n + (auto,),
        [Exercise], ..range(n).map(i => str(i + 1)), [Total],
        [Points],
      ),
    )
  }
  #show heading: none
  = Ex 1
  = Ex 2
  = Ex 3
]

#section(toc-title: "Callisto, a package for literate programming")[
  #set align(left)
  *Callisto*\
  #text(0.6em)[a package for literate programming]
]

#slide[
  #subtitle[Render notebooks with style]

  #set heading(outlined: false)
  #counter(heading).update(0)

  #code-and-result(
    columns: (60%, 40%),
    result-template: text.with(16pt),
    ```typ
    #import "@preview/callisto:0.3.0"

    #set text(font: "DejaVu Sans")
    #set heading(numbering: "I.")

    #callisto.render(
      nb: path("notebook.ipynb"),
      (0, 1), // first two cells
    )
    ```
  )

  // Restore counter value
  #counter(heading).update(3)
]

#slide[
  #subtitle[Include notebooks as chapters/sections]
  #set heading(outlined: false)
  #counter(heading).update(0)

  #code-and-result(
    columns: (60%, 40%),
    result-template: text.with(16pt),
    ```typ
    #import "@preview/callisto:0.3.0"
    #set heading(numbering: "1.")

    = Introduction
    Some text.
    
    #callisto.render(
      nb: path("notebook.ipynb"),
      theme: "neat",
      cmarker: (h1-level: 2), // subsection
      (0, 1), // first two cells
    )
    ```
  )

  // Restore counter value
  #counter(heading).update(3)
]

#slide[
  #subtitle[Extract cell code and outputs]
  #set heading(outlined: false, numbering: none)
  #set text(0.8em)
  #show: pad.with(bottom: -2cm)
  #code-and-result(
    columns: (50%, 50%),
    ```typ
    #import "@preview/callisto:0.3.0"
    #let (source, output) = callisto.config(
      nb: path("notebook.ipynb"),
    )

    The source of the "plot1" cell:
    #source("plot1", keep-cell-header: true)

    And its output:
    #output("plot1")
    ```
  )
]

#slide[
  #subtitle[Execute code written in Typst source]
  #set heading(outlined: false, numbering: none)
  #set text(0.8em)
  #show: pad.with(bottom: -1cm)
  #code-and-result(
    columns: (60%, 30%),
    column-gutter: 20mm,
    ``````
    #import "@preview/callisto:0.3.0"
    #let (execute, stage-notebook) = callisto.config(
      nb: path("export.ipynb"),
      kernel: "python3",
    )
    #show raw.where(lang: "py-x"): it => {
      set text(1em/0.8)
      execute(it)
    }
    #stage-notebook()

    Let's expand $(a+b)^2$ :

    ```py-x
    import sympy as sp
    a, b = sp.symbols('a b')
    sp.expand((a+b)**2)
    ```
    ``````,
  )
]

#slide[
  This last example requires running commands for *export* and *execution*.

  Recommendation: use a Makefile/justfile:

  #set text(0.8em)
  #raw(block: true, lang: "just", read("justfile").trim())
]

#title-slide[
  Questions?
]

#slide[
  #subtitle[Colophon]

  #set text(1.2em)

  Slides made in plain Typst (no package needed). Find the source at

  #h(3em) #link(
    "https://github.com/sijow/typst-presentation/",
    [github.com/sijow/typst-presentation/])

  #v(1em)
  Design and some content adapted from

  #h(3em) #link(
    "https://github.com/ZaninDavide/typst-intro/",
    [github.com/ZaninDavide/typst-intro/])
]
