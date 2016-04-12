class DeffieHellman
	attr_accessor :alfa,:secret,:p,:publickey_recibido,:key_compartido
	def initialize(nombre = nil,alfa = nil,secret = nil,p = nil)
		@nombre,@alfa,@secret,@p,@publickey_recibido = nombre,alfa,secret,p,0
	end

	#Funcion que realiza el algoritmo de exponenciacion rapida para tres
	#numeros de la forma (a**b)%m:
	def exponenciacion_rapida(a, b, m)
		_x = 1
		_y = a%m
		while ((b > 0)&&(_y > 1))
			if (b%2 != 0)
				_x = (_x*_y)%m
				b = b-1
			else
				_y = (_y*_y)%m
				b = b/2
			end
		end
		return _x
	end

	#Calculamos la Y
	def get_Y
		exponenciacion_rapida(@alfa,@secret,@p)
	end

	#Con esta funcion realizaremos el intercambio de datos entre
	#los usuarios involucrados en la generacion:
	def enviar(ente,public_key)
		ente.alfa,ente.p,ente.publickey_recibido = @alfa,@p,public_key
	end

	#Calculamos la K
	def get_K
		#@publickey_recibido**@secret % @p
		exponenciacion_rapida(@publickey_recibido,@secret,@p)
	end

	#Funcion que mostrara los datos calculados:
	def mostrar_datos
	puts "Los datos de #{@nombre} son: " <<
	"\nY: " << get_Y.to_s <<
	#"\nK: " << (@publickey_recibido**@secret % @p).to_s << "\n---------------------\n"
	"\nK: " << get_K.to_s << "\n---------------------\n"

	end
end
