require_relative "man-in-the-middle.rb"
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


#----------------------------------------------------------------------
#aqui comenzamos a realizar la modificacion, la cual consistira
#en implementar el ataque Man-in-the-middle a Diffie-Hellman.
#datos de Mitm
print "Introduzca el secreto del Man in the middle: "
xM = gets.chomp.to_i
#----------------------------------------------------------------------


puts ""


#Creamos a los usuarios, con sus correspondientes datos,
#que van a realizar la comunicacion y a generar
#mediante el metodo las claves:
Alice = DeffieHellman.new("Alice",alfa,xA,p)
Bob = DeffieHellman.new("Bob",alfa,xB,p)

#----------------------------------------------------------------------
Mitm = ManInTheMiddle.new("Man in the middle",alfa,xM,p)
#Realizamos el intercambio de datos(Yalice->Bob,Ybob->Alice)
#Ahora tenemos en cuenta el ataque MITM, con lo que los datos
#se intercambian de la siguiente manera:
#Yalica->Mitm, Ybob->Mitm, Yamitm->Bob, Ybmitm->Alice
Mitm.robarYs(Alice.get_Y,Bob.get_Y)
Mitm.enviar(Alice,Mitm.get_Y)
Mitm.enviar(Bob,Mitm.get_Y)
#----------------------------------------------------------------------

#Finalmente mostramos los resultados:
Alice.mostrar_datos
Bob.mostrar_datos

#----------------------------------------------------------------------
Mitm.mostrar_datos
#----------------------------------------------------------------------
