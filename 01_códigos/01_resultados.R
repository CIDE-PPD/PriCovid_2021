#------------------------------------------------------------------------------#
# Objetivo:                 Contabilizar respuestas efectivas de en PRICOVID
#
# Encargada:                Regina Isabel Medina Rosales
# Contacto:                 regina.medina@alumnos.cide.edu
# Fecha de creación:        01 de marzo de 2021 
# Fecha de actualización:   21 de abril de 2021
#
#------------------------------------------------------------------------------#

# 0. Configuración inicial -----------------------------------------------------
# Limpiar área de trabajo 
rm(list=ls())

# Cargar librerías 
library(readxl)         # Librería para importar archivos xlsx
library(dplyr)          # Librería para limpiar datos
library(stringr)        # Librería para manejar variables tipo texto 

# Dirección 
inp <- "02_datos_crudos/"
out <- "03_datos_limpios/"


# 1. Cargar datos --------------------------------------------------------------

# Último corte de los microdatos
df_raw_cru <- read_excel(paste0(inp, "PRISIÓN-COVID_2021_23_06_09_54.xlsx"))

dim(df_raw_cru)


# 2. Filtrar resultados --------------------------------------------------------

# Datos guardados después de la caída de los servidores
df_raw <- df_raw_cru                                %>% 
    mutate(fecha = as.Date(str_sub(Date, 1, 10)))   %>% 
    filter(SbjNam == "campo")                       %>% 
    select(SbjNum, SbjNam, Date, Duration, Upload, consentimiento:fecha) %>% 
    mutate(day = str_sub(Date, 1, 10))


# Distinguir los resultados 
table(df_raw_cru$SbjNam)    # Base posterior a la caída de los servidores
table(df_raw$SbjNam)        # Base conjunta

# Renombrar bases
# df_raw <- df_raw_cru
df_PRICO_resultados <- df_raw

# Guardar respaldo de resultado unificados y filtrados
write.csv(df_PRICO_resultados, paste0(out, "df_PriCovid_microdatos.csv"))
save(df_PRICO_resultados, file = paste0(out, "df_PriCovid_microdatos.RData"))


# 3. Explorar base -------------------------------------------------------------

# Nombres de las variables
names(df_raw)

# Ver cantidad de respuestas abiertas que fueron respondidas en cada ocasión
length(unique(df_raw$Q_5_S))    # Relación con la persona internada
length(unique(df_raw$S_13_9))   # ¿Por qué no visitó a su interno?    
length(unique(df_raw$S_34_5))   # ¿Por qué no informó de los síntomas?
length(unique(df_raw$S_35_6))   # ¿Qué pasó luego de que dio positivo a covid?
length(unique(df_raw$S_37_9))   # ¿Cómo le afectó a usted que tuviera covid?
length(unique(df_raw$S_42_8))   # ¿Qué tipo de problemas de salud ha tenido?
length(unique(df_raw$S_47_6))   # ¿Cómo se entera de las medidas?
length(unique(df_raw$S_49_16))  # ¿A qué se dedica usted generalmente?

# ---- Contabilizar encuestas incompletas
# Dejar solo las observaciones que se levantaron en campo (sacar piloto)
df_campo <- df_raw_cru                              %>% 
    mutate(fecha = as.Date(str_sub(Date, 1, 10)))   %>% 
    filter(SbjNam == "campo")   

# Buscar encuestas incompletas 
dim(df_campo)[1]            # Hay 234 respuestas levantadas en campo
table(df_campo$Complete)    # El filtro de STGndica que todas fueron completadas 
sum(is.na(df_campo$consentimiento)) # No hay ningún NA al final de la encuesta
sum(is.na(df_campo$trabajo))        # No hay ningún NA al final de la encuesta
length(df_campo$trabajo)

# Todas las encuestas levantadas en campo fueron respondidas completamente.

# FIN. -------------------------------------------------------------------------

