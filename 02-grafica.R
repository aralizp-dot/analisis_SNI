#cargar paquetes
pacman::p_load( "ggplot2" )

#Graficar cambios por anios

#leer la data
limpia <- read.csv( file = "results/limpia.csv" )

#graficamos
#fill depende del tipo de cambio que vamos a usar
barras.p <- ggplot( data = limpia, 
                     mapping = aes( x= year,
                                    y = miembros, 
                                    fill = cambio ) ) +
  geom_col( position = "dodge" ) +
  ggtitle( "Cambios en el SNI" ) +
  theme_classic( ) +
  facet_wrap( ~ nobilis )
#~en funcion de la fila de nobilis

#Visualizar el grafico
barras.p

#Guardar el grafico
ggsave( filename = "results/barras.png",
        plot = barras.p , width = 7, height = 5 )


