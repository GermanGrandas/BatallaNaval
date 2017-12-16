;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |Programa sistemas de medida (final)|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
;Sistemas de medida
;(menu-principal) --> String
; funcion que muestra un sistema de conversion de medidas

(define (menu-principal)
  (begin
    (display " Menú principal") (newline)
    (display " 1. longitud")(newline)
    (display " 2. tiempo" ) (newline)
    (display " 3. Area" )(newline)
    (display " 4. Volumen" ) (newline)
    (display " 5. temperatura") (newline)
    (display " 6. salir" ) (newline)
    (leer-opcion (read) )
             )
  )

(define (leer-opcion opc)
  (if (and (integer? opc) ( < opc 7) (> opc 0)) 
      (cond ((= opc 1)(menu-longitud))
            ((= opc 2)(menu-tiempo))
            ((= opc 3)(menu-area))
            ((= opc 4)(menu-volumen))
            ((= opc 5)(menu-temperatura))
            ((= opc 6)(salir))
            )
      (begin
        (display "opcion no disponible")
        (menu-principal)
        )
      ))

(define (salir)
 
    "Hasta luego,Sistema creado por Germán Grandas."
    
  )
;TEMPERATURA

(define (menu-temperatura)
 (begin
  (display "    Menú de temperatura") (newline)
  (display " 1. Celcius to Fahrenheit")(newline)
  (display " 2. Celcius to Kelvin " ) (newline)
  (display " 3. Fahrenheit to celcius" )(newline)
  (display " 4. kelvin to celcius" ) (newline)
  (display " 5. volver al Menú principal") (newline)
  (leer-opc-temperatura (read))
   )
  )

(define (leer-opc-temperatura opc )
  (if (and (integer? opc) ( < opc 6 ) (> opc 0))
      (cond ((= opc 1) (begin 
                         (display "digite los grados celcius que quiere convertir")(newline)
                         (ctof (read))
                         (menu-principal)))           
            ((= opc 2) (begin 
                         (display "digite los grados celcius que quiere convertir")(newline)
                         (ctok (read))
                         (menu-principal)))
            ((= opc 3) (begin 
                         (display "digite los grados Fahrenheit que quiere convertir")(newline)
                         (ftoc (read))
                          (menu-principal)))
            ((= opc 4) (begin
                         (display "digite los grados kelvin que quiere convertir")(newline)
                         (ktoc (read))
                         (menu-principal)))
            ((= opc 5) (menu-principal)))
            (begin 
        (display " no hay mas opciones" ) (newline)
        (menu-principal) )))
     
;funciones de temperatura  
(define (ctof t)
  (begin
    (display "El equivalente en grados Fahrenheit es:")
   (display (+ (* t (/ 9 5)) 32))(newline)
   (newline)))

(define (ctok t)
  (begin
    (display "El equivalente en grados Kelvin es:")
   (display ( + t 273)) (newline)
    (newline)))
  
  (define (ftoc t)
    (begin
      (display "El equivalente en grados celcius es:")
    (display (* (- t 32) (/ 5 9))) (newline) 
      (newline))) 
   
  (define (ktoc t)
    (begin
      (display "El equivalente en grados celcius es:")
      (display (- t 273) ) (newline)
      (newline)))
  ;Aqui termina temperatura

 ;Volumen
(define (menu-volumen)
  (begin
    (display " 1. Metros cúbicos to Centrimetros cúbicos")(newline)
    (display " 2. Metros cúbicos to Pies cúbicos" ) (newline)
    (display " 3. Centimetros cúbicos to Metros cúbicos" ) (newline)
    (display " 4. Pies cúbicos to Metros cúbicos" ) (newline)
    (display " 5. volver al menú principal" ) (newline)
    (leer-opc-volumen (read))
    )
  )

(define (leer-opc-volumen opc)
  (if (and (integer? opc) ( < opc 6 ) (> opc 0))
      (cond ((= opc 1) (begin
                         (display "digite los metros cúbicos que quiere convertir")(newline)
                         (m3tocm3 (read))
                         (menu-principal)))
            (( = opc 2) (begin
                          (display "digite los metros cúbicos que quiere convertir") (newline)
                          (m3topies3 (read))
                          (menu-principal)))
            ((= opc 3) (begin 
                         (display "digite los centimetros cúbicos que quiere convertir") (newline)
                         (cm3tom3 (read))
                         (menu-principal)))
            ((= opc 4) (begin
                         (display "digite los pies cúbicos que quiere convertir" ) (newline)
                         (pies3tom3 (read))
                         (menu-principal)))
            ((= opc 5) (menu-principal))
            )
      (begin 
        (display " no hay mas opciones" )(newline)
        (menu-principal) )
      )
  )
;acá comienzan las funciones de volumen

(define (m3tocm3 n)
  (begin
    (display "El equivalente en centimetros cúbicos es:") 
   (display (* n 100000)) (newline)
    (newline))
  )

(define (m3topies3 n)
  (begin
    (display "El equivalente en pies cúbicos es:")
    (display (* n 35.31)) (newline)
    (newline)
    )
  )

(define (pies3tom3 n)
  (begin
    (display "El equivalente en metros cúbicos es:")
    (display (* n 28.31)) (newline)
    (newline)
    )
  )

(define (cm3tom3 n)
  (begin
    (display "El equivalente en metros cúbicos es:")
    (display (* n 0.000001)) (newline)
    (newline)
    )
  )
;aqui termina volumen

;AREA
(define (menu-area)
  (begin
    (display " 1. Metros cuadrados to centimetro cuadrado")(newline)
    (display " 2. Metros cuadrados to hectárea" ) (newline)
    (display " 3. Metros cuadrados to yardas cuadradas")(newline)
    (display " 4. Metros cuadrados to Pulgadas cuadradas")(newline)
    (display " 5. Metros cuadrados to pies cuadrados") (newline)
    (display " 6. Volver al menu principal") (newline)
    (leer-opc-area (read))
    )
  )
(define (leer-opc-area opc)
  (if (and (integer? opc) ( > opc 0) (< opc 7))
      (cond ((= opc 1) (begin
                         (display "Digite los metros cuadrados que quiere convertir")(newline)
                         (m2tocm2 (read))
                         (menu-principal)
                         ))
            ((= opc 2) (begin
                         (display "Digite los metros cuadrados que quiere convertir")(newline)
                         (m2toh (read)) 
                         (menu-principal)
                         ))
            ((= opc 3) (begin
                         (display "Digite los metros cuadrados que quiere convertir") (newline)
                         (m2toy2 (read))
                         (menu-principal)
                         ))
            ((= opc 4) (begin
                         (display "Digite los metros cuadrados que quiere convertir")(newline)
                         (m2toinch2 (read))
                         (menu-principal)
                         ))
            ((= opc 5) (begin
                          (display "Digite los metros cuadrados que quiere convertir")(newline)
                          (mt2toft2 (read))
                          (menu-principal)
                          ))
            ((= opc 6) (menu-principal))
            )
    (begin
      (display "no hay mas opciones")
      (menu-principal)
      )
    )
  )
;funciones de area
(define (m2tocm2 m)
 (begin
   (display "el equivalente en centimetros cuadrados es:")
    (display (* m 10000) )(newline)
  (newline)))

(define (m2toh m)
  (begin
    (display "El equivalente en hectareas es:")
    (display ( / m 10000))(newline)
    (newline)
    )
  )

(define (m2toy2 m)
  (begin
    (display "El equivalente en yardas es:")
    (display ( * m 1.195))(newline)
    (newline)
    )
  )

(define (m2toinch2 m)
  (begin
    (display "El equivalente en pulgadas es:")
    (display ( * m 1550))(newline)
    (newline)
    )
  )

(define (mt2toft2 m)
  (begin
    (display "El equivalente en pies es:")
    (display (* m 10.7639))(newline)
    (newline)
    )
  )

;acá termina area

;TIEMPO

(define (menu-tiempo)
  (begin
    (display " 1. Horas to días")(newline)
    (display " 2. Horas to minutos")(newline)
    (display " 3. Horas to segundos")(newline)
    (display " 4. Volver al menu principal") (newline)
    (leer-opc-tiempo (read))
    )
  )

(define (leer-opc-tiempo opc)
  (if (and (integer? opc)(> opc 0)(< opc 5))
      (cond ((= opc 1)(begin
                         (display "Digite la/las horas que quiere convertir")(newline)
                         (h2d (read))
                         (menu-principal)))
            ((= opc 2) (begin
                         (display "Digite la/las horas que quiere convertir")(newline)
                         (h2m (read))
                         (menu-principal)))
            ((= opc 3) (begin
                         (display "Digite la/las horas que quiere convertir")(newline)
                         (h2s (read))
                         (menu-principal)
                         )
                       )
            ((= opc 4)(menu-principal))
            )
      (begin
        (display "no hay mas opciones")
        (menu-principal)
        )
      )
  )

;funciones de tiempo
(define (h2d t)
  (begin
    (display "El equivalente en días es:")
    (display (/ t 24))(newline)
    (newline)
    )
  )

(define (h2m t)
  (begin
    (display "El equivalente en minutos es:")
    (display ( * t 60)) (newline)
    (newline)
    )
  )

(define (h2s t)
  (begin
    (display "El equivalente en segundos es")
    (display (* t 3600)(newline)
             (newline)
             )
    )
  )
;acá termina tiempo

;LONGITUD

(define (menu-longitud)
  (begin
    (display " 1. Metros to decimetros")(newline)
    (display " 2. Metros to centimetros")(newline)
    (display " 3. Metros to milimetros" ) (newline)
    (display " 4. Metros to nanometros" ) (newline)
    (display " 5. Metros to Decametros" ) (newline)
    (display " 6. Metros to Heptometros" ) (newline)
    (display " 7. Metros to Kilómetros" ) (newline)
    (display " 8. Metros to Miriámetro" )(newline)
    (display " 9. Metros to pies" ) (newline)
    (display " 10. Metros to Pulgadas")(newline)
    (display " 11. Metros to yardas" ) (newline)
    (display " 12. Volver al menú principal") (newline)
    (leer-opc-longitud (read))
    )
  )

(define (leer-opc-longitud opc)
  (if (and (integer? opc) (> opc 0) (< opc 13))
      (cond ((= opc 1) (begin
                         (display "Digite los metros que quiere convertir")(newline)
                         (mt2deci (read))
                         (menu-principal)
                         )
                       )
            ((= opc 2) (begin
                         (display "Digite los metros que quiere convertir")(newline)
                         (mt2centi (read))
                         (menu-principal)
                         )
                       )
            ((= opc 3) (begin
                         (display "Digite los metros que quiere convertir")(newline)
                         (mt2mm (read))
                         (menu-principal)
                         )
                       )
            ((= opc 4) (begin
                         (display "Digite los metros que quiere convertir")(newline)
                         (mt2nano (read))
                         (menu-principal)
                         )
                       )
            ((= opc 5) (begin
                         (display "Digite los metros que quiere convertir")(newline)
                         (mt2Deca (read))
                         (menu-principal)
                         )
                       )
            ((= opc 6) (begin
                         (display "Digite los metros que quiere convertir")(newline)
                         (mt2Hepto (read))
                         (menu-principal)
                         )
                       )
            ((= opc 7) (begin
                         (display "Digite los metros que quiere convertir")(newline)
                         (mt2km (read))
                         (menu-principal)
                         )
                       )
            ((= opc 8) (begin
                         (display "Digite los metros que quiere convertir")(newline)
                         (mt2miri (read))
                         (menu-principal))
                       )
            ((= opc 9) (begin
                         (display "Digite los metros que quiere convertir")(newline)
                         (mt2ft (read))
                         (menu-principal)
                         )
                       )
            ((= opc 10) (begin
                          (display "Digite los metros que quiere convertir")(newline)
                          (mt2inch (read))
                          (menu-principal)
                          )
                        )
            ((= opc 11) (begin
                          (display "Digite los metros que quiere convertir")(newline)
                          (mt2yarda (read))
                          (menu-principal)
                          )
                        )
            ((= opc 12) (menu-principal))
            )
      (begin
        (display "no hay mas opciones")
        (menu-principal)
        )
      )
  )

;acá comienzan las funciones de longitud

(define (mt2deci m)
  (begin
    (display "El equivalente en decimetros es:")
    (display (/ m 10))(newline)
             (newline)
             )
  )

(define (mt2centi m)
  (begin
    (display "El equivalente en centimetros es:")
    (display ( / m 100)) (newline)
    (newline)
    )
  )

(define (mt2mm m )
  (begin
    (display "El equivalente en milimetros es:")
    (display ( / m 1000)) (newline)
             (newline)
             )
    )
  

(define (mt2nano m)
  (begin
    (display "El equivalente en nanómetros es:")
    (display (/ m 10000)) (newline)
    (newline)
    )
  )

(define (mt2Deca m)
  (begin 
    (display "El equivalente en Decimetros es:")
    (display (/ m 10)) (newline)
    (newline)
    )
  )

(define (mt2Hepto m)
  (begin
    (display "El equivalente en Heptometros es:")
    (display (/ m 100)) (newline)
    (newline)
    )
  )

(define (mt2km m)
  (begin
    (display "El equivalente en Kilometros es:")
    (display (/ m 1000)) (newline)
    (newline)
    )
  )

(define (mt2miri m)
  (begin
    (display "El equivalente en Miriametros es:")
    (display (/ m 10000))(newline)
    (newline)
    )
  )

(define (mt2ft m)
  (begin 
    (display "El equivalente en Pies es:")
    (display (* m 3.2808)) (newline)
    (newline)
    )
  )

(define (mt2inch m)
  (begin
    (display "El equivalente en pulgadas es:")
    (display (* m 39.37)) (newline)
    (newline)
    )
  )

(define (mt2yarda m)
  (begin
    (display "El equivalente en yardas es:")
    (display (* m 1.0936133)) (newline)
    (newline)
    )
  )
    
;aca terminan longitudes
;acá termina el programa
  
                                   
(menu-principal)
