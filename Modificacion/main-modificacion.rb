require_relative "DH-modificacion.rb"
require 'prime'
#--------------------------------------------------------------------------------------
#La modificacion consiste en implementar el metodo de manera que puedan intervenir mas
#de dos usuarios, con la peculiaridad de que solo ejecutaremos la primera vuelta de la
#generacion, donde el ultimo usuario es el que tendra la clave generada por todos.
#si quisieramos que todos tuviesen la clave, deberiamos hacer que todos y cada uno de
#ellos sea el ultimo de la generacion, con lo que deberiamos ir rotandolos a todos una
#vez para que pudiesen obtener todos la clave final pasando una vez por la ultima
#posicion de la generacion.
#--------------------------------------------------------------------------------------
system("clear")
puts "***** PRACTICA DIFFIE-HELLMAN - JOSE MENA *****"
puts ""
puts ""
#Comenzamos pidiendo por teclado los datos necesarios para realizar
#el metodo de Diffie-Hellman:

#numero de usuarios
print "Introduzca el numero de usuarios que van a participar: "
numeroUsuarios = gets.chomp.to_i

#p
print "Introduzca la p(debe ser un numero primo): "
p = gets.chomp.to_i
#Comprobamos que la p es un numero primo, de no ser asi lo pedimos de nuevo
while (Prime.prime?(p) == false) do
	print "p debe ser primo: "
	p = gets.chomp.to_i
end

#alfa
print "Introduzca la variable alfa(debe ser menor que p): "
alfa = gets.chomp.to_i
#Comprobamos que alfa sea menor que p, de no ser asi lo pedimos de nuevo
while (alfa > p) do
	print "Alfa debe ser menor que p: "
	alfa = gets.chomp.to_i
end

secretos = []
for i in 0..numeroUsuarios-1
	print "Introduzca el secreto del usuario #{i}: "
	secretos.push(gets.chomp.to_i)
end


puts ""

#Creamos a los usuarios, con sus correspondientes datos,
#que van a realizar la comunicacion y a generar
#mediante el metodo las claves:
users = []
for i in 0..numeroUsuarios-1
	users[i] = DiffieHellman.new(i.to_s,alfa,secretos[i],p)
end

#Aqui comenzamos la vuelta de generacion de la clave, donde al final de ella
#el usuario users[numeroUsuarios-1] tendra al final la clave.
#Primero el primer usuario envia al siguiente su informacion((alfa**secreto)%p)
#a continuacion, todos los demas usuarios envian al siguiente el calculo
#((informacionRecibida**secreto)%p), o lo que es lo mismo en nuestro codigo,
#la K, y de esta manera el ultimo usuario tendra la clave generada por todos.
users[0].enviar(users[1],users[0].get_Y)
for i in 1..numeroUsuarios-2
	users[i].enviar(users[i+1],users[i].get_K)
end

print "Resultado final de la K: #{users[numeroUsuarios-1].get_K}"
puts ""
