#CARGAR PAQUETES
pacman::p_load( "vroom", "dplyr" )

#leer la data
la_data <- vroom( file = "data/data_original.csv" )
getwd
setwd("~/desktop/analisis_SNI")
getwd()
library(vroom)

la_data <- vroom("data/data_original.csv")

#nos quedamos solo con DR. y DRA.
#magritte control + shift + M
#queremos que nobilis sea igual a DR o DRA y se ven en el ambiente
data_filtrada <- la_data %>% 
  filter( nobilis == "DR. " | nobilis == "DRA." )

#creamos un directorio de resultados
dir.create( path = "results" )

#guardar esta data
write.csv( x= data_filtrada, file = "results/limpia.csv" )

#Calcular la proporcion de DR y DRA que pierden el SNI
data_resumen <- data_filtrada %>% 
  filter( cambio == "perdio SNI" ) %>% 
  group_by( nobilis ) %>% 
  summarise( totales = sum( miembros ))

#Guardamos la data resumen
write.csv( x= data_resumen, file = "results/resumen.csv" )

#TO-DOs (por hacer)
#araliz: Calcular el % de DR y DRA que pierde el SNI
#        Como TOTAL DE INGRESOS / TOTAL DE PERDIDAS

  