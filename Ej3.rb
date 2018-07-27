count = 0
clave = 0
nombres = Hash.new
edades = Hash.new
comunas = Hash.new
generos = Hash.new


opcion = 0

while opcion != 10 do
  
  puts 'Menú de Opciones:'
  puts '1: Ingresar un nuevo alumno'
  puts '2: Editar los datos de un alumno'
  puts '3: Eliminar los datos de un alumno'
  puts '4: Consultar la cantidad de alumnos ingresados'
  puts '5: Muestra las comunas de todos los alumnos'
  puts '6: Listar alumnos con edades entre 20 y 25 años'
  puts '7: Ver suma de las edades de todos los alumnos'
  puts '8: Ver promedio de las edades de todos los alumnos'
  puts '9: Ver alumnos agrupados por género'
  puts '10: Salir'

  puts print 'Seleccione una opcion del menu'

  opcion = gets.chomp.to_i

  case opcion
    when 1
      count += 1
      puts 'Ingrese el nombre del nuevo estudiante'
      nombre = gets.chomp.capitalize!
      nombres.store(count, nombre)
      puts 'Ingrese la edad del nuevo estudiante'
      edad = gets.chomp.to_i
      edades.store(count, edad)
      puts 'Ingrese la comuna del nuevo estudiante'
      comuna = gets.chomp.capitalize!
      comunas.store(count, comuna)
      puts 'Ingrese el genero del nuevo estudiante'
      puts 'Ingrese 1 para femenino ó 2 para masculino'
      genero = gets.chomp.to_i
      while genero != 1 && genero != 2
        puts 'Ingrese 1 para femenino ó 2 para masculino'
        genero = gets.chomp.to_i
      end
      generos.store(count, genero)
      puts "
      Ha ingresado exitosamente los datos de #{nombres[count]}
      "
      puts "
      Regresando al menú principal
      "
    when 2
      puts print nombres
      puts 'Ingrese el número asociado al alumno a editar datos'
      clave = gets.chomp.to_i
      while nombres.has_key?(clave) == false
      puts 'Opcion no encontrada, Ingrese el número correcto asociado al alumno a editar datos'
      clave = gets.chomp.to_i
  	  end
  	  puts "Usted ha seleccionado al alumno llamado #{nombres[clave]}"
  	  editar = 0

      while editar != 5

        puts 'Seleccione qué desea editar'
        puts 'nombre : 1'
        puts 'edad : 2'
        puts 'comuna : 3'
        puts 'genero : 4'
        puts 'salir : 5'
        editar = gets.chomp.to_i
        case editar

       	when 1

       	  puts 'Ingrese el nuevo nombre para el alumno'
       	  nombre = gets.chomp
       	  nombres[clave] = nombre
       	  puts 'Datos actualizados'

       	when 2

       	  puts 'Ingrese la nueva edad para el alumno'
       	  edad = gets.chomp
       	  edades[clave] = edad
       	  puts 'Datos actualizados'

       	when 3

       	  puts 'Ingrese la nueva comuna para el alumno'
       	  comuna = gets.chomp.capitalize!
       	  comunas[clave] = comuna
       	  puts 'Datos actualizados'

       	when 4

       	  puts 'Ingrese el nuevo genero para el alumno'
       	  puts 'Ingrese 1 para femenino ó 2 para masculino'
          genero = gets.chomp

          while genero != 1 && genero != 2
            puts 'Ingrese 1 para femenino ó 2 para masculino'
            genero = gets.chomp
          end

       	  generos[clave] = genero

       	  puts 'Datos actualizados'

       	when 5

       	  puts '
       	  Ha seleccionado salir de la edición, volverá al menu principal
       	  '      	  
          opcion = 0

        else
          puts "Usted ha seleccionado al alumno llamado #{nombres[clave]}"
          puts 'Seleccione qué desea editar'
          puts 'nombre : 1'
          puts 'edad : 2'
          puts 'comuna : 3'
          puts 'genero : 4'
          puts 'salir : 5'
          editar = gets.chomp.to_i
        end 
      end

    when 3

      puts print nombres
      puts 'Ingrese el número asociado al alumno a eliminar'
      clave = gets.chomp.to_i
      puts "Usted ha seleccionado al alumno llamado #{nombres[clave]}"
      puts '¿Está seguro que desea eliminar todos los dats asociados?'
      puts 'Este proceso no puede deshacerse'
      puts 'Escriba si, de lo contrario escriba no'
      eliminar = gets.chomp.downcase!
      while eliminar == 'si'
        nombres.delete(clave)
        edades.delete(clave)
        comunas.delete(clave)
        generos.delete(clave)
      end

    when 4

      puts "
      Hay #{nombres.count} alumnos registrados en el sistema
      
      Volviendo al menú principal

      "

    when 5

      com_unicas = comunas.values
      puts '
      Las comunas de las que provienen los alumnos son:
      '
      puts com_unicas & com_unicas
      puts '

      Volviendo al menú principal
      '
    when 6

      edad_2025 = edades.select { |y, x|  x.to_i >= 20 && x.to_i <= 25 }
      puts '

      '
      edad_2025.each { |x, y| puts "#{nombres[x]} tiene #{y} años"} 
      puts '

      '

    when 7

      sumaedad = edades.values.inject(0) { |sum, x| sum + x }
      puts "
      Todas las edades de los alumnos suman #{sumaedad}

      Volviendo al menú principal
      "


    when 8

      sumaedad = edades.values.inject(0) { |sum, x| sum + x }
      prom = sumaedad/edades.count
      puts "
      Todas las edades de los alumnos promedian #{prom}

      Volviendo al menú principal
      "

    when 9
      fem = generos.select { |x, y| y==1 }.keys
      mas = generos.select { |x, y| y==2 }.keys
      puts 'En el género femenino se encuentran :'
      fem.each { |x| puts "#{nombres[x]}" }
      puts 'En el género masculino se encuentran :'
      mas.each { |x| puts "#{nombres[x]}" }
      puts '

      Volviendo al menú principal
      '
    when 10

      puts "
      
      Saliendo...

      "
    else 
    puts '
    Vuelva a intentarlo
    '
    puts 'Menú de Opciones:'
    puts '1: Ingresar un nuevo alumno'
    puts '2: Editar los datos de un alumno'
    puts '3: Eliminar los datos de un alumno'
    puts '4: Consultar la cantidad de alumnos ingresados'
    puts '5: Muestra las comunas de todos los alumnos'
    puts '6: Listar alumnos con edades entre 20 y 25 años'
    puts '7: Ver suma de las edades de todos los alumnos'
    puts '8: Ver promedio de las edades de todos los alumnos'
    puts '9: Ver alumnos agrupados por género'
    puts '10: Salir'

    puts print 'Seleccione una opcion del menu'

    opcion = gets.chomp.to_i

  end
end
