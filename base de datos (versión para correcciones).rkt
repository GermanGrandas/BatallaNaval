;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |base de datos (versión para correcciones)|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))


(define-struct estudiante (codigo nombre apellido fecha-nacimiento carrera nota1 nota2 ))
(define vec (make-vector 11)) 

(define (menu)
  (begin
  (display "        Menu principal")(newline)
  (display "1. Insertar Base de estudiantes")(newline)
  (display "2. Modificar base de estudiantes")(newline)
  (display "3. Eliminar base de estudiantes")(newline)
  (display "4. listar base de estudaintes")(newline)
  (display "5. Salir")(newline)
  (menu-principal (read))
  )
  )
(define (menu-principal opc)  
(if (and (integer? opc) ( < opc 6) (> opc 0)) 
  
    (cond
    ((= opc 1)(begin
                (display "digite la linea que desea insertar, recuerde que los datos existentes de eliminaran")
     (insertar vec (read))))
    ((= opc 2)(modificar))
    ((= opc 3)(begin
              (display "inserte la linea que desea eliminar")  
     (eliminar vec (read))))
    ((= opc 4)(begin
                (display "codigo")(display " ")(display "nombre")(display " ")(display "apellido")(display " ")(display "fecha de nacimiento")(display " ")(display "carrera")
        (display " ")(display "nota")(display " ")(display "nota")(display " ")(display "promedio")(newline)
                (listar vec 0)))
    ((= opc 5)(salir))
    )
    (begin
      (display "opcion no disponible")(newline)
      (menu)
      )
  )
  )
  


(define (salir)
  (display "Gracias por usar nuestros servicios")
  )

(define (modificar)
  (begin
    (display "digite la posicion que desea modificar")(newline)
  (modificar-base (read))
  )
  )

(define (listar vec i)
  (if (< i (vector-length vec))
    (begin
        (display (estudiante-codigo (vector-ref vec i)))
        (display " ")
        (display (estudiante-nombre (vector-ref vec i)))
        (display " ")
        (display (estudiante-apellido (vector-ref vec i)))
        (display " ")
        (display (estudiante-fecha-nacimiento (vector-ref vec i)))
        (display " ")
        (display (estudiante-carrera (vector-ref vec i)))
        (display " ")
        (display (estudiante-nota1 (vector-ref vec i)))
        (display " ")
        (display (estudiante-nota2 (vector-ref vec i)))
        (display " ")
        (display (/ (+ (estudiante-nota1 (vector-ref vec i)) (estudiante-nota2 (vector-ref vec i))) 2))
        (newline)
        (listar vec (+ i 1))
        
        )
      "error"
      ))

(define (base)
  (begin
    
     (vector-set! vec 0 (make-estudiante "102585699" "casimiro" "guitierrez" "15/05/1990"   "industrial"             2 3   ))
     (vector-set! vec 1 (make-estudiante "970562056" "leonardo" "castrillon" "05/09/1995"   "sistemas"               4 3   ))
     (vector-set! vec 2 (make-estudiante "109945520" "Humberto" "agudelo"    "16/03/1988"   "medicina veterinaria" 3.2 4   ))
     (vector-set! vec 3 (make-estudiante "526954021" "disney"   "landia"     "8/11/1985"    "Ambiental"            2 3.2   ))
     (vector-set! vec 4 (make-estudiante "970556320" "ana"      "banana"     "30/06/1996"   "sistemas"               4 5   ))
     (vector-set! vec 5 (make-estudiante "968502465" "manuela"  "palacio"    "20/09/1997"   "medicina"               3 4   ))
     (vector-set! vec 6 (make-estudiante "105598727" "Melissa"  "Franco"     "5/5/1999"     "pedagogía"            3.5 4.5 ))
     (vector-set! vec 7 (make-estudiante "970506630" "Gerson"   "hurtado"    "20/03/1996"   "TAH"                    1 2   ))
     (vector-set! vec 8 (make-estudiante "107993604" "Laura"    "Henao"      "9/1/1998"     "sistemas"               4 3   ))
     (vector-set! vec 9 (make-estudiante "980653890" "fernando" "suarez"     "29/02/1996"   "mecanica"               3 3   ))
     (vector-set! vec 10 (make-estudiante "15874556" "camila"   "gomez"      "12/09/1996"   "física"                 3 4   ))
     )
  )
(define (modificar-base i)
  (begin
  (vector-set! vec i (make-estudiante (read)(read)(read)(read)(read)(read)(read) ))
  (menu)
  )
  )
(define (insertar vec i)
  (if (and (< i 11)(> i 0))
  (begin
  (vector-set! vec i (make-estudiante (read)(read)(read)(read)(read)(read)(read) ))
  (menu)
  )
  (begin
    (display "opcion no disponible")
    (menu)
    )
  )
  )

(define (eliminar vec i)
  (begin
    (vector-set! vec i (make-estudiante "-" "-" "-" "-" "-" "-"))
    (menu)
    )
  )
(base)
(menu)

