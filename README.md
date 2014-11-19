# Sistemas y Tecnologías Web: Chat Usando Ajax y jQuery

**Autores: Aarón Socas Gaspar && Aarón José Vera Cerdeña**

##Descripción

Ejemplo de como construir un chat simple con jQuery y Sinatra.


##Aplicación

Podemos acceder a la aplicación subida a heroku desde [aqui](https://sytw6.herokuapp.com/).


##Tests

[![Build Status](https://travis-ci.org/alu0100207385/SYTW_p6.svg?branch=testing)](https://travis-ci.org/alu0100207385/SYTW_p6)

Podemos probar la aplicación ejecutando los tests. Podemos hacerlo en nuestra maquina local mediante la opción: 
`rake local_tests` o bien accediendo a los resultados en [travis](https://travis-ci.org/alu0100207385/SYTW_p6/builds/39286192).

##Instalación

1. Instalaremos las gemas necesarias: `bundle install`
2. Podemos usar el archivo `config.yml` que se proporciona o configurar el nuestro propio.


##Ejecución

Con el comando `$ rake -T` podemos ver las opciones posibles.
Las opciones posibles son:

```
1. rake ajax         # make an Ajax request via curl
2. rake heroku       # Open app in Heroku
3. rake local_tests  # Run tests in local machine
4. rake noajax       # make a non Ajax request via curl
5. rake rackup       # Run the server via rackup
6. rake repo         # Open repository
7. rake server       # run the chat server
8. rake sinatra      # Run the server via Sinatra
9. rake tests        # Run tests (default)

```


##Recursos

* Blazeeboy gist [https://gist.github.com/blazeeboy/9289678](https://gist.github.com/blazeeboy/9289678)
* [Selenium](http://www.seleniumhq.org/)
* [Travis](https://travis-ci.org/)
* [Ayuda](http://nereida.deioc.ull.es/~lpp/perlexamples/node499.html#section:jquerychat)
* [Ejemplo_chat](https://github.com/crguezl/chat-blazee)
* [Coveralls](http://nereida.deioc.ull.es/~lpp/perlexamples/node314.html#section:coveralls)
* [Text Color](https://github.com/fazibear/colorize)

-------------------------
*Aarón Socas Gaspar && Aarón José Vera Cerdeña- Sistemas y Tecnologías Web (Curso 2014-2015)*
