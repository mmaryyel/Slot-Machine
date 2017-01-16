require 'pp'

get '/' do
  @rolls = []

  3.times { @rolls << Roll.create }

  @win = "WINNER!!" if @rolls.map! { |roll| roll.value }.uniq.count == 1

  erb :index
end

# QUE HACER?: Convierte esta ruta para que utilice Ajax y si la petición no es
# de Ajax de igual forma sirva.
#Envía la información mediante el método post
post '/rolls' do
  #Dentro de esta variable se guarda un arreglo de la action(html)=rolls

  @rolls = []

  if params[:value]
    3.times { @rolls << Roll.create({ value: value }) }
  else
    3.times { @rolls << Roll.create }
  end
  #Esta es la forma de validar a un ganador 
  #@win= GANA! si la variable rolls aplicandole un map, cada elemento multiplicado
  #por su valor es igual a 1
  
  @win = "WINNER!!" if @rolls.map! { |roll| roll.value }.uniq.count == 1
 #De esta forma mostraremos el resultado
 #Si el usuario tiene instalado Javascript(lo sabemos utilizando el metodo "xhr" sobre request)
 #request.xhr? entonces le enviamos una petición a :_die_roll, layout: false
  if request.xhr?
    puts "*" * 30
    puts "AJAX"
    puts "*" * 30
    erb :_die_roll, layout: false # TIP: Qué esté haciendo esto y qué debe hacer diferente.
 #Si el usuario no tiene instalado javascript, entonces el juego será ejecutado por html 
  else
    puts "*" * 30
    puts "HTML"
    puts "*" * 30
    erb :index
  end

end
