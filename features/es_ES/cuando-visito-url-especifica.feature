Característica: solicitud de URL específica

  Escenario: Solicitud de una URL específica opcionalmente indicada con un nombre coloquial
  ########################################################################
  # Patrón: 
  #   Cuando visito _pagina_
  #
  # Descripción:
  #   Solicita la URL referida comprobando previamente si el valor de la 
  # misma ha sido mapeado en config.url_mappings.
  #
  #   Si se ha definido una función "path_to" los mapeos de url_mappings
  # son ignorados y se utilizará dicha función para obtener la ruta que
  # se debe solicitar.
  #
  #   El valor por defecto definido en el mapeo de URLs (string.to_url) 
  # devuelve la propia cadena si no existe un mapeo concreto para ella y 
  # comienza por / o https?://. En caso contrario devuelve nulo.
  #
  # Ejemplos:
  #
  #     Cuando visito /mi-pagina
  #
  #   Sería equivalente a tener definido el siguente mapeo:
  #
  #     MundoPepino.configure do |config|
  #       config.url_mappings[/mi página$/i] = '/mi-pagina'
  #     end
  #
  #   y escribir:
  #
  #     Cuando visito mi página
  #
  #   Por otro lado:
  #
  #     Cuando visito /pilots/sully-iii
  #
  #   Nos llevaría a '/pilots/sully-iii' (si dicha cadena no tiene un 
  # mapeo a otro lugar, cosa bastante absurda por otro lado).
  # 
  #   Por último:
  #
  #     Cuando visito la entreplanta
  #
  #   ...nos devolverá nulo si 'la entreplanta' no tiene definido ningún 
  # mapeo de URL, o el valor de dicho mapeo en caso contrario.
  #
  ########################################################################
    Cuando visito /
    Entonces debo ver la etiqueta H1 con el valor "Portada de Mundo Pepino"
    Cuando visito "/"
    Entonces debo ver la etiqueta H1 con el valor "Portada de Mundo Pepino"
    Cuando visito la portada
    Entonces debo ver la etiqueta H1 con el valor "Portada de Mundo Pepino"
    Cuando visito "la HOME"
    Entonces debo ver la etiqueta H1 con el valor "Portada de Mundo Pepino"

  Escenario: Solicitud de una URL específica en definición de contexto "Given"
    Dado que visito la portada
    Entonces debo ver la etiqueta H1 con el valor "Portada de Mundo Pepino"
