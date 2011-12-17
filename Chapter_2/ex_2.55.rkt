#lang planet neil/sicp

;Why does the interpreter interpret (car ''abracadabra) as 'quote'?

(display (car ''abracadabra))
(display (cdr ''abracadabra))

;The quote tells the intrepreter, "treat whatever comes after me literally." And so if you put a quote after a quote, the interpreter treats the quote
;literally. And when you do this, the interpreter for some reason automatically assumes that you want a list with two elements: (quote abracadabra). 