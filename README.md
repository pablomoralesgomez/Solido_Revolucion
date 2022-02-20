# Sólido de Revolución

Autor: Pablo Morales Gómez

Asignatura: Creando Interfaces de Usuario

Curso: 4º


## Introducción

En esta práctica hemos generado un sólido de revolución a partir de puntos que un usuario debe introducir manualmente. Estos puntos serán, a su vez, rotados consecutivamente una serie de grados previamente establecidos (por defecto 30) hasta completar una vuelta de 360 grados. Finalemente, con todos los vértices generados, usamos el objeto *PShape* para unir los vértices entre si y creamos el sólido de revolución.



## Desarrollo

La organización del código en esta práctica es bastante sencillo. En la clase principal (en la que están incluidos los métodos *draw* y *setup*) lidiamos principalmente con los controles que permiten al usuario interactuar con nuestra aplicación, para mayor simplicidad usamos una variable global llamada *state* para poder discernir si nos encontramos dibujando el contorno que formará la figura o si estamos viendo el sólido resultante. Además, de esta clase existen otras 2: *Background*, donde gestionamos los fondos y mayormente los textos que se localizan en la app, y *Figure*, siendo esta última la clase encargada de recoger los puntos que el usuario introduce, rotarlos, unirlos para formar el sólido y de su posterior visualización.


### Pantalla de Dibujo

Esta pantalla inicial se encuentra dividida en 2 partes por una línea vertical en el centro de la escena. Al lado izquierdo quedan las instrucciones y explicaciones que requiere el usuario para sacar el máximo provecho del programa, esta parte no permite ningún tipo de interacción, es puramente informativa. Aquí incluimos todos los controles que se pueden realizar en la app, incluyendo algunos exclusivos de cuando se genera la fugura.

El lado opuesto, al comienzo de la ejecución, se encuentra vacío y es en este sitio donde el cliente puede usar el ratón para ir marcando los vértices que conformararn el contorno del sólido. Cada vez que se introduce un nuevo punto, este se muestra en pantalla y una línea surge del mismo y va hasta donde se encuentre el ratón situado (la línea no saldrá de la mitad de la pantalla dedicada al dibujo). Este añadido fue incluido porque se pensó que mejoraba la interacción del usuario, pudiendo este ahora tener una mayor idea de donde situar el siguiente vértice en relación con los que ya se habían colocado, asimismo los puntos previos se encuentran unidos por una línea que sigue el orden en el que fueron incluidos. 

Con la tecla R, un cliente puede eliminar el último punto que ha sido añadido al contorno. Por otro lado, una vez se ha completado el contorno se puede pulsar la tecla F que hará que se genere la figura y que, por tanto, cambiemos de estado. 


### Pantalla del Sólido

Esta escena se genera cuando en la de dibujo se pulsa la tecla F y se ha dibujado al menos un vétice en el contorno inicial. En esta pantalla podemos visualizar el sólido ya creado y podemos interactuar con él. La interacción puede ser de 3 formas diferentes.

La primera de todas es utilizando las teclas W, A, S y D con las que podemos rotar la figura sobre los ejes Y y X. La segunda es con la flecha hacia arriba y hacia abajo, con estas podemos aumentar o disminuir el tamaño del sólido. Todas estas transformaciones fueron bastante sencillas de incluir, ya que el propio objeto *PShape* incluye métodos que permiten realizar estas acciones con suma facilidad. Además, si se quiere se pueden deshacer todas las transformaciones aplicadas a la figura mediante estas dos formas pulsando la tecla F (esto se indica en la esquina inferior izquierda) que devuelve la figura al estado en el que se encontraba cuando fue generada.

La última de las interacciones son con las flechas izquierda y derecha que nos permiten, respectivamente, aumentar y disminuir el ángulo de rotación usado a la hora de generar os vértices que forman parte de la figura. Aumentando de esta forma el número de superficies planas entrelazadas a medida que el ángulo se reduce (siendo el más pequeño de 2.5 grados) y disminuyéndolas mientras pulsamos la tecla izquierda (llegando a tener como ángulo máximo 120 grados). Este extra fue incluido para que el usuario pudiese tener un mayor abanico de posibilidades de generación de un mismo sólido, pudiendo este elegir si la forma generada es más o menos redondeada.

Finalmente, se puede regresar al modo dibujo pulsando la tecla R donde encontraremos el contorno como lo habíamos dejado, pudiendo ahora modificarlo y ajustarlo si lo vemos necesario o simplemente borrarlo y generar uno nuevo.



## Previsualización de la Aplicación

<p align="center"> <img src="animacion.gif" alt="gif animado" /> </p>
