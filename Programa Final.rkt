(require (lib "graphics.ss" "graphics"))
(require (lib "draw.ss" "htdp"))
(open-graphics)

; ventanas
(define ven (open-viewport "naval" 700 600))
(define ven2 (open-viewport "navalm" 600 600))
((draw-viewport ven) (make-rgb 0 0.8 0.8))
((draw-viewport ven2) (make-rgb 0 0.8 0.8))

;primer tablero
(define (dibujo x)
  (if (<= x 500)
  (begin
    ((draw-rectangle ven) (make-posn x 50) 50 50 "black")
    ((draw-rectangle ven) (make-posn x 100) 50 50 "black")
    ((draw-rectangle ven) (make-posn x 150) 50 50 "black")
    ((draw-rectangle ven) (make-posn x 200) 50 50 "black")
    ((draw-rectangle ven) (make-posn x 250) 50 50 "black")
    ((draw-rectangle ven) (make-posn x 300) 50 50 "black")
    ((draw-rectangle ven) (make-posn x 350) 50 50 "black")
    ((draw-rectangle ven) (make-posn x 400) 50 50 "black")
    ((draw-rectangle ven) (make-posn x 450) 50 50 "black")
    ((draw-rectangle ven) (make-posn x 500) 50 50 "black")
    
    (dibujo (+ 50 x))
    )
  )
  )
;funciones que imprimen los numeros en ambos tableros
(define (numtablero1 x y num)
  (if (<= y 550)
  (begin
  ((draw-string ven) (make-posn x y) (number->string num))
  ((draw-string ven2) (make-posn x y) (number->string num))
 (numtablero1 x (+ y 50) (+ 1 num))
 
  )
  )
  )
(define (numtablero2 x y num)
  (if (<= x 550)
  (begin
  ((draw-string ven) (make-posn x y) (number->string num))
  ((draw-string ven2) (make-posn x y) (number->string num))
  
 (numtablero2 (+ x 50) y (+ 1 num))
 
  )
  )
  )
;dibujo de la Segunda ventana recursivamente

(define (dibujo2 x y)
  (if (and (<= x 500)(<= y 500))
      (begin
        ((draw-rectangle ven2) (make-posn x y) 50 50 "black")
        (dibujo2 (+ x 50) y)
        (dibujo2 x (+ y 50))
        )
      )
  )


;-------------------------------puntaje--------------------
(define vec (make-vector 1 10))

(define (puntaje)
  (begin
    ((draw-line ven) (make-posn 600 0) (make-posn 600 600) "black")
    ((draw-string ven) (make-posn 610 100) "PUNTAJE")
    ((draw-string ven) (make-posn 640 150) (number->string (vector-ref vec 0)))
    )
  )



;-------------------agrupación funciones de dibujo-----------

(define (dibujar)
  (begin
    (dibujo 50)
    (puntaje)
    (dibujo2 50 50)


(numtablero1 30 80 0)
(numtablero2 70 40 0)
(sleep 1)
(barcos)
)
  )







;------------------------Barcos---------------------

(define vecb1 (make-vector 150)) 
(define (barcos)
  (begin
    (get-mouse-click ven)
  ;Acorazado 
    ((draw-solid-rectangle ven) (make-posn 60 210) 30  180 "black")
    (sleep 1)
  ;Cruceros
    ((draw-solid-rectangle ven) (make-posn 160 110) 120 30  "black") (sleep 1)
    ((draw-solid-rectangle ven) (make-posn 110 510) 120 30  "black") (sleep 1)
   ;Destructores
    ((draw-solid-rectangle ven) (make-posn 210 210) 30  80  "black") (sleep 1)
    ((draw-solid-rectangle ven) (make-posn 310 310) 80  30  "black") (sleep 1)
    ((draw-solid-rectangle ven) (make-posn 360 110) 30  80  "black") (sleep 1)
  ;Submarinos
    ((draw-solid-ellipse ven) (make-posn 310 410) 30 30 "black") (sleep 1)
    ((draw-solid-ellipse ven) (make-posn 460 210) 30 30 "black") (sleep 1)
    ((draw-solid-ellipse ven) (make-posn 460 460) 30 30 "black") (sleep 1)
    ((draw-solid-ellipse ven) (make-posn 360 510) 30 30 "black") (sleep 1)
  )
)
;cruceros
(vector-set! vecb1 12 1)
(vector-set! vecb1 13 1)
(vector-set! vecb1 14 1)

(vector-set! vecb1 91 1)
(vector-set! vecb1 92 1)
(vector-set! vecb1 93 1)

;Destructores

(vector-set! vecb1 33 1)
(vector-set! vecb1 43 1)

(vector-set! vecb1 16 1)
(vector-set! vecb1 26 1)

(vector-set! vecb1 55 1)
(vector-set! vecb1 56 1)
;submarinos
(vector-set! vecb1 75 1)
(vector-set! vecb1 40 1)
(vector-set! vecb1 88 1)
(vector-set! vecb1 96 1)
;Acorazado
(vector-set! vecb1 30 1)
(vector-set! vecb1 40 1)
(vector-set! vecb1 50 1)
(vector-set! vecb1 60 1)
;--------------------------Barcos ventana 2--------------------
(define vecb2 (make-vector 150)) 

;acorazado
(vector-set! vecb2 11 1)
(vector-set! vecb2 12 1)
(vector-set! vecb2 13 1)
(vector-set! vecb2 14 1)

;cruceros
(vector-set! vecb2 42 1)
(vector-set! vecb2 52 1)
(vector-set! vecb2 62 1)

(vector-set! vecb2 83 1)
(vector-set! vecb2 84 1)
(vector-set! vecb2 85 1)

;destructores
(vector-set! vecb2 9 1)
(vector-set! vecb2 19 1)

(vector-set! vecb2 26 1)
(vector-set! vecb2 36 1)

(vector-set! vecb2 57 1)
(vector-set! vecb2 58 1)

;submarinos
(vector-set! vecb2 2 1)
(vector-set! vecb2 81 1)
(vector-set! vecb2 78 1)
(vector-set! vecb2 97 1)

;--------------Prospecto de IA-----------

(define (jarvis x)
  (if (= (vector-ref vecb1 x) 1)
      (begin
        ((draw-solid-ellipse ven) (make-posn (+ 60(* 50(remainder x 10 ))) (+ 60(* 50 (quotient x 10))) ) 20 20 "red")
        (vector-set! vec 0 (- (vector-ref vec 0) 10))
        (vector-set! vecb1 x 2)
        
        (converclick (get-mouse-click ven2) 0)
        )
      (if (= (vector-ref vecb1 x) 2)
          (jarvis (random 100))
          (begin
            ((draw-solid-ellipse ven) (make-posn (+ 60(* 50(remainder x 10 ))) (+ 60(* 50 (quotient x 10))) ) 20 20 "white")
            (vector-set! vecb1  x 2)
            (converclick (get-mouse-click ven2) 0)
            )
          )
      )
  )

;-------------------Humano------------

(define (estupidohumano y)
  (if (= 1 (vector-ref vecb2 y))
      (begin
        ((draw-solid-ellipse ven2)(make-posn (+ 60(* 50 (quotient y 10))) (+ 60(* 50(remainder y 10 ))) ) 20 20 "red")
         (vector-set! vec 0 (+ (vector-ref vec 0) 20))
        (vector-set! vecb2 y 2)
        (puntaje)
        (jarvis (random 100))
        )
      (if (= (vector-ref vecb2 y) 2)
          (converclick (get-mouse-click ven2) 0)
          (begin
            ((draw-solid-ellipse ven2) (make-posn (+ 60(* 50 (quotient y 10))) (+ 60(* 50(remainder y 10 ))) ) 20 20 "white")
            (vector-set! vecb2 y 2)
            (centro 0)
            )
          )
      )
  )
    
  
      
            

  
  
  
;-------------- funciones auxiliares---------
  
  (define (converclick x i)
    (if ( = (vector-length vecb2) i)
            (perdio)
    (if (= (vector-ref vecb1 i) 1)
        (estupidohumano (+ (* 10(floor(/ (- (posn-x (mouse-click-posn x)) 50) 50)))(floor (/ (- (posn-y (mouse-click-posn x)) 50) 50))))
        
            (converclick x (+ 1 i))
            )
        )
     
  )
  
(define (centro i)
   (if ( = (vector-length vecb2) i)
            (gano)
            (if (= (vector-ref vecb2 i) 1)
                (jarvis (random 100))
                (centro (+ 1 i))
            )
        )
     
  )

;----------------------Perdio----------------


(define (perdio)
  (begin
    (define ven3 (open-viewport "perdió" 300 300))
   
    ((draw-string ven3) (make-posn 100 100) "        perdiste ") 
    ((draw-string ven3) (make-posn 100 130) "     tu puntaje fue de:")
    ((draw-string ven3) (make-posn 140 150) (number->string (vector-ref vec 0)))
    (sleep 5)
   (close-viewport ven3)
   (close-graphics)
    
    )
  )

;------------------Ganó---------------

(define (gano)
  (begin
    (define ven4 (open-viewport "gano" 300 300))
    
    ((draw-string ven4) (make-posn 100 100) "            Ganaste ") 
    ((draw-string ven4) (make-posn 100 130) "       tu puntaje fue de:")
    ((draw-string ven4) (make-posn 140 150) (number->string (vector-ref vec 0)))
    (sleep 5)
    (close-viewport ven4)
    (close-graphics)
    )
  )

;------------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------------


(define carga (open-viewport "carga" 960 600 ))
(((draw-pixmap-posn "1.bmp" 'bmp) carga) (make-posn 0 0) "black")
(play-sound "sonido.wav" #t)

(define (loader n x y)
  (if (>= n 0)
      (begin
        ((draw-solid-rectangle carga) (make-posn x y) 19 15 "white")
        (sleep 0.03)
        (loader (- n 1) (+ x 9) y)
        )
      ((draw-solid-rectangle carga) (make-posn x y) 15 15 "white")
      )
  )
(define (inicio)
  (begin
    (loader 120 0 400)
    (sleep 2)
    (close-viewport carga)
    (dibujar)
    
    )
  )




;--------------------------Llamado a las funciones ---------------------

(inicio)




(converclick (get-mouse-click ven2) 0 )



    

