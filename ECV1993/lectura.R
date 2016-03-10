rm(list=ls())
library(dplyr)
# Base de caracteristicas del Hogar (urbano y rural)
hogaru <- read.table("Documents/BBVA/ECV 1993/HOGARU/HOGARU.txt", sep = "\t", header = T)

hogarr <- read.table("Documents/BBVA/ECV 1993/HOGARR/HOGARR.txt", sep = "\t", header = T)


# Los ponderadores de las encuestas
ponderadorU <- read.table("Documents/BBVA/ECV 1993/PONVIHOU/PONVIHOU.txt", sep = "\t", header = T)
ponderadorR <- read.table("Documents/BBVA/ECV 1993/PONVIHOR/PONVIHOR.txt", sep = "\t", header = T)

# Pegamos ponderadores
hogaru <- rename(hogaru,  HOGAR_N = HOGAR_N_3)
hogares_urbanos_p <- full_join(hogaru, ponderadorU, by = c("IDENTIFICADOR_VIV_U", "HOGAR_N") )

hogarr <- rename(hogarr,  HOGAR_N = HOGAR_N_3)
hogares_rurales_p <- full_join(hogarr, ponderadorR, by = c("IDENTIFICADOR_VIV_R", "HOGAR_N") )


# Las cuentas de los hogares con computador
weighted.mean(hogares_urbanos_p$MICR_COM_3, w = hogares_urbanos_p$PESOCAP3)

# No existe la pregunta para los hogares rurales:
weighted.mean(hogares_rurales_p$M, w = hogares_rurales_p$PESOCAP3)

