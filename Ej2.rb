nombres = %w[Violeta Andino Clemente Javiera Paula Pia Ray]

nombres_xl = nombres.select { |x| x.length > 5 }
downnombres = nombres.map { |x| x.downcase }
nombrescon_p = nombres.select { |x| x[0] == 'P' }
cantletras = nombres.map { |x| x.length }
sinvocal = nombres.map { |x| x.gsub(/[aeiou]/, '') }

puts print nombres_xl
puts print downnombres
puts print nombrescon_p
puts print cantletras
puts print sinvocal
