%%%---- ANALISIS AHP Y PLN PARA NOTICIAS DE ELECTROMOVILIDAD----%%%%

%Paso1: Analisis de Sentimiento%

%%Para poder efectuar todo el analisis al texto que conforman a las 23 noticias de movilidad electrica, primero deben ejecutarse
%% los codigos de los sentimientos de criterios y alternativas para así obtener el sentimiento asignado a cada frase de cada criterio como 
%% de cada alternativa que son mostrado en la comand window

%Paso2:Confeccion matrices%

Cuando se tienen los sentimientos asignados para criterios como para alternativas de cada frases, estas son colocadas en los codigos de matriz de comparacion
%% tanto de criterios como de alternativas, ya que con los sentimientos asignados se calcula la media geometrica, dando un sentimiento representativo de la 
%% importancia o sentimiento que tiene cada criterio como cada alternativa en el texto analizado.

%%Particularmente, en el caso de las alternativas, como se tiene el sentimiento representativo presente para cada una de ellas en el texto, se les debe a cada sentimiento
%% nuevo de estas alternativas, efectuar una media geometrica con cada sentimiento representativo de cada criterio, a modo de que se tenga un sentimiento de cada alternativa
%%pero con la influencia del criterio en ese valor.

%%Estos codigos que hacen las matrices de comparacion, analizan la importancia relativa que se tiene al comparar un criterio con otro o una alternativa con otra en base a comparar 
%% el valor de sentimiento que se tiene, ya que como todos los valores son hechos en una escala de saaty, el codigo simplemente rellena la matriz de comparacion "viendo la importancia
%% de A sobre B" simplemente en hacer comparaciones de mayor, menor o igual, si un criterio o una alternativa tiene un peso de sentimiento representativo mayor a la que se compara, 
%% segun que tan mayor o menor es, asigna un valor en escala de Saaty para hacer la matriz. Esto es valido tanto para las matrices de criterios como de alternativas.


%Paso3: Analisis de Pesos y Consistencias%

%%Una vez se obtienen de la comand window a las matrices de comparacion entre criterios como entre alternativas, estas se ingresan al codigo que analiza el pesos y consistencia
%% a cada matriz para ver el peso relativo de cada aspecto que fue comparado como la validez del modelo por medio de la consistencia. Ademas, este codigo permite obtener
%% los puntajes finales de las alternativas para poder tener la mejor estrategia que permita la descarbonización por medio de la movilidad electrica

%%%-----Consideraciones----%%%

%%Estos codigos su entrada es texto, por lo que son capaces de editar o analizar cualquier texto el sentimiento presente o contenido para cada criterio, esto se hace cambiando el texto
%% como las palabras clave de cada criterio o alternativas, y asi en base a lo que se muestra en las comand window, poder editar los demas codigos para daer con el peso y consistencia 
%final del modelo.
