# Análisis de Dataset sobre Phishing con Zeppelin

Este proyecto tiene como objetivo analizar un dataset sobre phishing para identificar patrones y características de URLs maliciosas, utilizando Apache Zeppelin 0.10.1 en Ubuntu 22.04. El análisis busca extraer insights valiosos que puedan contribuir a mejorar la ciberseguridad, un área crítica en la era digital donde el phishing sigue siendo una de las principales técnicas empleadas por ciberdelincuentes para engañar a los usuarios y obtener información confidencial.

**¿Por qué este dataset?** Elegimos este dataset porque ofrece una amplia gama de características relacionadas con URLs y páginas web, permitiéndonos explorar cómo se estructuran los sitios maliciosos en comparación con los legítimos. Además, nos brinda la oportunidad de aplicar técnicas de análisis de datos y derivar nuevas métricas que enriquezcan nuestra comprensión de este fenómeno.

Puedes explorar el repositorio completo aquí: [carloszealand2005/Data-science-Zeppelin](https://github.com/carloszealand2005/Data-science-Zeppelin/tree/main).

## Introducción

El phishing representa una amenaza significativa en el ámbito de la ciberseguridad, utilizando técnicas de ingeniería social para engañar a los usuarios. Este proyecto analiza un dataset de URLs etiquetadas como phishing o legítimas, con el fin de identificar patrones que nos permitan entender mejor cómo operan estos sitios y cómo detectarlos de manera más efectiva.

## Dataset

El dataset analizado proviene del archivo `PhiUSIIL_Phishing_URL_Dataset.csv` y contiene 56 columnas que describen diversas características de URLs y páginas web. A continuación, se listan las columnas principales:

- **FILENAME**: Nombre del archivo asociado.
- **URL**: La URL completa.
- **URLLength**: Longitud de la URL.
- **Domain**: Dominio de la URL.
- **DomainLength**: Longitud del dominio.
- **IsDomainIP**: Indica si el dominio es una IP (0 o 1).
- **TLD**: Dominio de nivel superior (ej. "com", "ec").
- **URLSimilarityIndex**: Índice de similitud de la URL.
- **CharContinuationRate**: Tasa de continuación de caracteres.
- **TLDLegitimateProb**: Probabilidad de legitimidad del TLD.
- **URLCharProb**: Probabilidad de caracteres en la URL.
- **TLDLength**: Longitud del TLD.
- **NoOfSubDomain**: Número de subdominios.
- **HasObfuscation**: Indica si hay ofuscación (0 o 1).
- **NoOfObfuscatedChar**: Número de caracteres ofuscados.
- **ObfuscationRatio**: Ratio de ofuscación.
- **NoOfLettersInURL**: Número de letras en la URL.
- **LetterRatioInURL**: Ratio de letras en la URL.
- **NoOfDegitsInURL**: Número de dígitos en la URL.
- **DegitRatioInURL**: Ratio de dígitos en la URL.
- **NoOfEqualsInURL**: Número de signos igual en la URL.
- **NoOfQMarkInURL**: Número de signos de interrogación.
- **NoOfAmpersandInURL**: Número de ampersands.
- **NoOfOtherSpecialCharsInURL**: Número de otros caracteres especiales.
- **SpacialCharRatioInURL**: Ratio de caracteres especiales.
- **IsHTTPS**: Indica si usa HTTPS (0 o 1).
- **LineOfCode**: Líneas de código en la página.
- **LargestLineLength**: Longitud de la línea más larga.
- **HasTitle**: Indica si tiene título (0 o 1).
- **Title**: Título de la página.
- **DomainTitleMatchScore**: Puntuación de coincidencia entre dominio y título.
- **URLTitleMatchScore**: Puntuación de coincidencia entre URL y título.
- **HasFavicon**: Indica si tiene favicon (0 o 1).
- **Robots**: Indica si tiene robots.txt (0 o 1).
- **IsResponsive**: Indica si es responsive (0 o 1).
- **NoOfURLRedirect**: Número de redirecciones.
- **NoOfSelfRedirect**: Número de redirecciones a sí misma.
- **HasDescription**: Indica si tiene descripción (0 o 1).
- **NoOfPopup**: Número de popups.
- **NoOfiFrame**: Número de iframes.
- **HasExternalFormSubmit**: Indica si hay envío de formularios externos (0 o 1).
- **HasSocialNet**: Indica si tiene enlaces a redes sociales (0 o 1).
- **HasSubmitButton**: Indica si tiene botones de envío (0 o 1).
- **HasHiddenFields**: Indica si tiene campos ocultos (0 o 1).
- **HasPasswordField**: Indica si tiene campos de contraseña (0 o 1).
- **Bank**: Indica si está relacionado con bancos (0 o 1).
- **Pay**: Indica si está relacionado con pagos (0 o 1).
- **Crypto**: Indica si está relacionado con criptomonedas (0 o 1).
- **HasCopyrightInfo**: Indica si tiene información de copyright (0 o 1).
- **NoOfImage**: Número de imágenes.
- **NoOfCSS**: Número de archivos CSS.
- **NoOfJS**: Número de archivos JavaScript.
- **NoOfSelfRef**: Número de referencias a sí misma.
- **NoOfEmptyRef**: Número de referencias vacías.
- **NoOfExternalRef**: Número de referencias externas.
- **label**: Etiqueta que indica si es phishing (1) o legítima (0).

### Columnas Derivadas

Para enriquecer el análisis, se calcularon tres columnas adicionales:

1. **`SecurityCategory`**: Clasifica la seguridad de la página en categorías como "HIGH", "MEDIUM", "LOW" o "VERY LOW", basada en factores como el uso de HTTPS, presencia de copyright, ofuscación, redirecciones y más. [Ver implementación en el notebook](https://github.com/carloszealand2005/Data-science-Zeppelin/blob/main/Proyecto%20programaci%C3%B3n%20week14..ipynb).
2. **`UrlComplexity`**: Evalúa la complejidad de la URL ("SIMPLE", "MEDIUM", "COMPLEX", "VERY COMPLEX") según el número de subdominios, longitud de la URL, caracteres especiales y su ratio. [Ver implementación en el notebook](https://github.com/carloszealand2005/Data-science-Zeppelin/blob/main/Proyecto%20programaci%C3%B3n%20week14..ipynb).
3. **`PresenceRatio`**: Mide el ratio de presencia de contenido ("VERY LOW", "LOW", "MEDIUM", "HIGH") basado en la relación entre elementos como imágenes, CSS, JS y líneas de código totales, útil para detectar páginas con poco contenido real, típicas del phishing. [Ver implementación en el notebook](https://github.com/carloszealand2005/Data-science-Zeppelin/blob/main/Proyecto%20programaci%C3%B3n%20week14..ipynb).

## Estructura del Repositorio

- **`Physhing_home.sql`**: Archivo SQL con consultas para manipular y analizar el dataset, incluyendo la creación de tablas y triggers. [Ver archivo](https://github.com/carloszealand2005/Data-science-Zeppelin/blob/main/Physhing_home.sql).
- **`Proyecto programación week14..ipynb`**: Notebook exportado desde Zeppelin que contiene el análisis, funciones derivadas y visualizaciones en Scala con Spark. [Ver notebook](https://github.com/carloszealand2005/Data-science-Zeppelin/blob/main/Proyecto%20programaci%C3%B3n%20week14..ipynb).

## Análisis Realizado

El análisis se centró en responder cinco preguntas clave, utilizando consultas SQL y código en Scala/Spark:

1. **¿Cuáles son los cinco dominios más recurrentes en el dataset?**
2. **¿Cuáles son los factores más comunes en las páginas consideradas como phishing?**
3. **¿Cuántas páginas de cada tipo de complejidad de URL existen dentro del dataset?**
4. **¿Cuáles son los cinco dominios con más seguridad basados en la columna derivada?**
5. **¿Cuántas páginas con dominio ‘.ec’ existen dentro del dataset y qué porcentaje de estas son consideradas como ‘phishing’?**

## Insights de Datos (Sección "Preguntas")

A continuación, se detallan los insights obtenidos de las preguntas planteadas en el análisis:

1. **Dominios más recurrentes**  
   - Se identificaron los cinco dominios que aparecen con mayor frecuencia en el dataset, lo que sugiere una concentración de actividad (legítima o maliciosa) en ciertos dominios populares. Consulta ejecutada: [ver código en el notebook](https://github.com/carloszealand2005/Data-science-Zeppelin/blob/main/Proyecto%20programaci%C3%B3n%20week14..ipynb#L11).

2. **Factores comunes en páginas de phishing**  
   - Las páginas etiquetadas como phishing (`label = 1`) tienden a compartir características como:
     - **Redirecciones de URL** (`NoOfURLRedirect > 0`): Indican intentos de ocultar el destino real.
     - **Relación con criptomonedas sin copyright** (`Crypto = 1` y `HasCopyrightInfo = 0`): Sugiere sitios fraudulentos que imitan servicios financieros.
     - **Ausencia de HTTPS** (`IsHTTPS = 0`): Falta de seguridad básica, común en sitios maliciosos.  
   - Consulta ejecutada: [ver código en el notebook](https://github.com/carloszealand2005/Data-science-Zeppelin/blob/main/Proyecto%20programaci%C3%B3n%20week14..ipynb#L12).

3. **Distribución por complejidad de URL**  
   - Las URLs se clasificaron en cuatro categorías:
     - **SIMPLE**: Predominan en sitios legítimos con estructuras claras.
     - **MEDIUM**: Mezcla de sitios legítimos y algunos sospechosos.
     - **COMPLEX**: Mayor presencia de phishing con subdominios y caracteres especiales.
     - **VERY COMPLEX**: Fuerte correlación con phishing debido a alta ofuscación.  
   - Consulta ejecutada: [ver código en el notebook](https://github.com/carloszealand2005/Data-science-Zeppelin/blob/main/Proyecto%20programaci%C3%B3n%20week14..ipynb#L13).

4. **Dominios con alta seguridad**  
   - Se listaron los cinco dominios con mayor frecuencia en la categoría "HIGH" de `SecurityCategory`, indicando sitios con HTTPS, copyright, títulos claros y sin redirecciones ni popups. Estos dominios son menos propensos a ser phishing. Consulta ejecutada: [ver código en el notebook](https://github.com/carloszealand2005/Data-science-Zeppelin/blob/main/Proyecto%20programaci%C3%B3n%20week14..ipynb#L14).

5. **Dominios ‘.ec’ y phishing**  
   - Se contabilizaron las páginas con TLD `.ec` y se calculó el porcentaje etiquetado como phishing (`label = 1`). Este análisis reveló la prevalencia de sitios maliciosos en dominios ecuatorianos, proporcionando un insight local valioso. Consulta ejecutada: [ver código en el notebook](https://github.com/carloszealand2005/Data-science-Zeppelin/blob/main/Proyecto%20programaci%C3%B3n%20week14..ipynb#L15).

## Conclusiones

El análisis destaca patrones claros en las URLs de phishing, como la ausencia de HTTPS, alta complejidad y poca presencia de contenido real. Estos hallazgos pueden servir como base para desarrollar herramientas de detección más efectivas y fomentar investigaciones futuras sobre dominios específicos, como los `.ec`.

## Instrucciones de Uso

Para ejecutar el proyecto:

1. **Requisitos**: Asegúrate de tener Apache Zeppelin 0.10.1 y Spark instalados en Ubuntu 22.04.
2. **Notebook**: Importa el archivo `Proyecto programación week14..ipynb` en Zeppelin y ejecuta las celdas para reproducir el análisis. [Descargar notebook](https://github.com/carloszealand2005/Data-science-Zeppelin/blob/main/Proyecto%20programaci%C3%B3n%20week14..ipynb).
3. **SQL**: Usa las consultas en `Physhing_home.sql` en un entorno compatible (ej. Oracle SQL) para manipular el dataset. [Descargar SQL](https://github.com/carloszealand2005/Data-science-Zeppelin/blob/main/Physhing_home.sql).

## Créditos y Agradecimientos

- **Dataset**: Obtenido de `PhiUSIIL_Phishing_URL_Dataset.csv`.
- **Agradecimientos**: A la comunidad de Zeppelin y Spark por las herramientas utilizadas.
