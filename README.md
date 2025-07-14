# Dataset sobre phishing.
Sus columnas son: 

|-- FILENAME: string (nullable = true)

|-- URL: string (nullable = true)

|-- URLLength: integer (nullable = true)

|-- Domain: string (nullable = true)

|-- DomainLength: integer (nullable = true)

|-- IsDomainIP: integer (nullable = true)

|-- TLD: string (nullable = true)

|-- URLSimilarityIndex: double (nullable = true)

|-- CharContinuationRate: double (nullable = true)

|-- TLDLegitimateProb: double (nullable = true)

|-- URLCharProb: double (nullable = true)

|-- TLDLength: integer (nullable = true)

|-- NoOfSubDomain: integer (nullable = true)

|-- HasObfuscation: integer (nullable = true)

|-- NoOfObfuscatedChar: integer (nullable = true)

|-- ObfuscationRatio: double (nullable = true)

|-- NoOfLettersInURL: integer (nullable = true)

|-- LetterRatioInURL: double (nullable = true)

|-- NoOfDegitsInURL: integer (nullable = true)

|-- DegitRatioInURL: double (nullable = true)

|-- NoOfEqualsInURL: integer (nullable = true)

|-- NoOfQMarkInURL: integer (nullable = true)

|-- NoOfAmpersandInURL: integer (nullable = true)

|-- NoOfOtherSpecialCharsInURL: integer (nullable = true)

|-- SpacialCharRatioInURL: double (nullable = true)

|-- IsHTTPS: integer (nullable = true)

|-- LineOfCode: integer (nullable = true)

|-- LargestLineLength: integer (nullable = true)

|-- HasTitle: integer (nullable = true)

|-- Title: string (nullable = true)

|-- DomainTitleMatchScore: double (nullable = true)

|-- URLTitleMatchScore: double (nullable = true)

|-- HasFavicon: integer (nullable = true)

|-- Robots: integer (nullable = true)

|-- IsResponsive: integer (nullable = true)

|-- NoOfURLRedirect: integer (nullable = true)

|-- NoOfSelfRedirect: integer (nullable = true)

|-- HasDescription: integer (nullable = true)

|-- NoOfPopup: integer (nullable = true)

|-- NoOfiFrame: integer (nullable = true)

|-- HasExternalFormSubmit: integer (nullable = true)

|-- HasSocialNet: integer (nullable = true)

|-- HasSubmitButton: integer (nullable = true)

|-- HasHiddenFields: integer (nullable = true)

|-- HasPasswordField: integer (nullable = true)

|-- Bank: integer (nullable = true)

|-- Pay: integer (nullable = true)

|-- Crypto: integer (nullable = true)

|-- HasCopyrightInfo: integer (nullable = true)

|-- NoOfImage: integer (nullable = true)

|-- NoOfCSS: integer (nullable = true)

|-- NoOfJS: integer (nullable = true)

|-- NoOfSelfRef: integer (nullable = true)

|-- NoOfEmptyRef: integer (nullable = true)

|-- NoOfExternalRef: integer (nullable = true)

|-- label: integer (nullable = true)


## Las tres columnas añadidas nuevas fueron:

Security -> Que tan segura es una página

UrlComplexity -> Que tan compleja es la URL basándose en 4 parámetros 

ContentRatio -> Que tanto contenido tiene la página basándose en las líneas de código totales. Una página de SCAM generalmente tendrá muy poco contenido pero muchas líneas de código, necesarias para hacer phishing
