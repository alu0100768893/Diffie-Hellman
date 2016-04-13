# Práctica para la asignatura de [_Seguridad en sistemas informáticos_](https://campusvirtual.ull.es/1516/course/view.php?id=143) en la que se pide:
---
## Objetivo: Implementar el método de Diffie-Hellman.

Desarrollo:
Implementa el método de Diffie-Hellman en el lenguaje de programación que se desee:

---
![esquema de la práctica](img/DH.png)
---



### También se ha realizado el ataque Man in the middle a este protocolo:

---
![esquema de la práctica](img/DHM.png)

### En la práctica se pidió realizar la siguiente modificación:
---
La modificacion consiste en implementar el método de manera que puedan intervenir más de dos usuarios, con la peculiaridad de que sólo ejecutaremos la primera vuelta de la generación, dónde el último usuario es el que tendrá la clave generada por todos.
Si quisiéramos que todos tuviesen la clave, deberíamos hacer que todos y cada uno de ellos sea el último de la generacion, con lo que deberiamos ir rotándolos a todos una vez para que pudiesen obtener todos la clave final pasando una vez por la última posición de la generación.



#### Para ejecutar: _"ruby main.rb"_
---
Si se desea ejecutar la modificación de la práctica, en el directorio Modificacion:
>_ruby main-modificacion.rb_

Si se desea ejecutar el ataque Man in the middle:
>_ruby main-mitm.rb_

### Enlaces:

+ [Página personal.](http://alu0100768893.github.io/)
+ [Repositorio de la práctica.](https://github.com/alu0100768893/Diffie-Hellman)
+ [Enlace a la asignatura.](https://campusvirtual.ull.es/1516/course/view.php?id=143)
