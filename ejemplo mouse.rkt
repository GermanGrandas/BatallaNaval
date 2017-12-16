(require (lib "graphics.ss" "graphics"))
(open-graphics)

; ventanas



(define ven (open-viewport "naval" 700 600))



((draw-solid-rectangle ven) (mouse-click-posn (get-mouse-click ven)) 100 100 "blue")

(posn-x (mouse-click-posn (get-mouse-click ven)))
(posn-y (mouse-click-posn (get-mouse-click ven)))