require_relative "DH.rb"
require 'prime'

system("clear")
puts "***** PRACTICA DIFFIE-HELLMAN - JOSE MENA *****"
puts ""
puts ""
#Comenzamos pidiendo por teclado los datos necesarios para realizar
#el metodo de Diffie-Hellman:
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

#xA
print "Introduzca el secreto de Alice: "
xA = gets.chomp.to_i

#xB
print "Introduzca el secreto de Bob: "
xB = gets.chomp.to_i

puts ""

#Creamos a los usuarios, con sus correspondientes datos,
#que van a realizar la comunicacion y a generar
#mediante el metodo las claves:
Alice = DeffieHellman.new("Alice",alfa,xA,p)
Bob = DeffieHellman.new("Bob",alfa,xB,p)
#Realizamos el intercambio de datos(Yalice->Bob,Ybob->Alice)
Alice.enviar(Bob,Alice.get_Y)
Bob.enviar(Alice,Bob.get_Y)

#Finalmente mostramos los resultados:
Alice.mostrar_datos
Bob.mostrar_datos
