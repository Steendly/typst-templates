# Typst templates

Some of my personal [Typst](https://github.com/typst/typst) templates. Hope you will fin interesting things here ;)

---

### Algo.typ :
Library for writing algorithms :
```typst
#algo(
  title: "Fib",
  parameters: ("n",)
)[
  if $n < 0$:#i\        // use #i to indent the following lines
    return null#d\      // use #d to dedent the following lines
  if $n = 0$ or $n = 1$:#i #comment[you can also]\
    return $n$#d #comment[add comments!]\
  return #smallcaps("Fib")$(n-1) +$ #smallcaps("Fib")$(n-2)$
]
```
<img src="https://user-images.githubusercontent.com/40146328/235323240-e59ed7e2-ebb6-4b80-8742-eb171dd3721e.png" width="400px" />

It's a modified version of [platformer/typst-algorithms](https://github.com/platformer/typst-algorithms) with in addition a shell template. 

---

### Paper_formatting.typ :
Simple template for formatting university report : <br>
_|exemple coming soon..._

It' a modified version of [aurghya-0/Project-Report-Typst](https://github.com/aurghya-0/Project-Report-Typst).
