class ManInTheMiddle
	attr_accessor :alfa,:secret,:p,:publickey_recibido,:key_compartido
	def initialize(nombre = nil,alfa = nil,secret = nil,p = nil)
    #----------------------------------------------------------------------
		@nombre,@alfa,@secret,@p,@publickey_recibido,@yA,@yB = nombre,alfa,secret,p,0,0,0
    #----------------------------------------------------------------------
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



#----------------------------------------------------------------------
  #funcion con la que el Mitm obtiene los ys de Alice y Bob
  def robarYs(yA,yB)
    @yA,@yB = yA,yB
  end

	#Calculamos la K
	def get_KA
		exponenciacion_rapida(@yA,@secret,@p)
	end

  #Calculamos la KB
  def get_KB
    exponenciacion_rapida(@yB,@secret,@p)
  end
#----------------------------------------------------------------------



	#Funcion que mostrara los datos calculados:
	def mostrar_datos
	puts "Los datos de #{@nombre} son: " <<
	"\nY: " << get_Y.to_s <<

#----------------------------------------------------------------------
	"\nKA: " << get_KA.to_s <<
  "\nKB: " << get_KB.to_s << "\n---------------------\n"
#----------------------------------------------------------------------

	end
end
