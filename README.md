![Build Status](https://img.shields.io/static/v1?label=Autoría&message=PPD&color=EC1E2D) 
![Build Status](https://img.shields.io/github/directory-file-count/CIDE-PPD/PriCovid_2021) 
![Build Status](https://img.shields.io/tokei/lines/github/CIDE-PPD/PriCovid_2021) 
![Build Status](https://img.shields.io/twitter/follow/cideppd?style=social)
![Build Status](https://img.shields.io/github/followers/CIDE-PPD?style=social)

# Encuesta PriCovid 2021
Este repositorio contiene todos los insumos necesarios para replicar el análisis de la Encuesta sobre experiencias de familiares de personas privadas de su libertad durante la pandemia de COVID-19 (PriCovid) 2021, respondiendo así a los más altos estándares de transparencia. Para reproducir este análisis, basta con clonar el repositorio, abrir el proyecto de R `PriCovid_2021.Rproj` y ejecutar los códigos.

# :open_file_folder: Organización del respositorio 
Para facilitar la reproducción del análisis de la encuesta PriCovid 2021, se describen a continuación las carpetas contenidas en el respositorio. 

## :clipboard: Documentación (`00_documentación`) 
La carpeta de documentación contiene el pseudocódigo de la encuesta PriCovid 2021. Este documento se genera de manera automática desde SurveyToGo (software utilizado para la programación de la encuesta) y permite la reproducción de la encuesta debido a que contiene: 

- Les preguntas tal cual fueron presentadas a las personas encuestadas y su identificador numérico único. 
- Las opciones de repuesta para cada pregunta y su respectivo código numérico. 


## :computer: Códigos de limpieza en R (`01_códigos`) 
Una vez recolectados los datos por medio de SurveyToGo, el análisis de datos se realizó en R. En esta carpeta se incluyen tres códigos de análisis. 

| Nombre del código    | Tarea       | 
| :------------:       |  :---       | 
| `01_resultados`      | Filtra las respuestas levantadas en campo (se excluyen respuestas rescopiladas durante pruebas piloto)       | 
| `02_limpieza`        | Transforma los microdatos limpiados en el primer código en tablas agregadas       |
| `03_visualizaciones` | Convierte las tablas agregadas en gráficas de barras         |


## :floppy_disk: Microdatos originales (`02_datos_crudos`) 
En esta carpeta se incluyen los microdatos originales con las respuestas almacenadas como códicos numéricos, tal cual y como son producidos por SurveyToGo. Esto incluye observaciones recopiladas durante las pruebas piloto. Además, se incluye un _codebook_ (equivalente al cuestionario de la carpeta 00, pero en formato excel), con la cual se decodifican las respuestas. 

## :mag_right: Datos procesados (`03_datos_limpios`) 
Aquí se almacenan las bases limpias: microdatos filtrados con las respuestas levantadas en campo y los tabulados agregados con las frecuencias de las respuestas de cada pregunta. Ambas bases se almacenan en formato `.RData` y `.csv`. 

## :bar_chart: Visualizaciones (`04_figuras`) 
Todas las preguntas contenidas en la encuesta tienen una gráfica de barras que representa de manera visual la distribución de las respuestas. 

## :bookmark_tabs: Reporte de resultados (`05_reportes`) 
El reporte de resultados se genera de manera automática con un archivo `.RMarkdown`, que retoma los insumos procesados y los incorpora en un solo archivo `.pdf` con gráficas y tablas de las frecuencias de respuestas para cada pregunta. El reporte también recopila las respuestas de formato abierto que se recopilaron a manera de comentario al final de la encuesta. 

