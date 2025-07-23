SELECT * FROM phishing;

UPDATE PHISHING
SET ID = ROWNUM;
COMMIT;

SELECT MAX(id) FROM phishing;

CREATE SEQUENCE phishing_id_seq
START WITH 232974 
INCREMENT BY 1
NOCACHE
NOCYCLE;

-- Trigger para aumentar automáticamente el ID:
CREATE OR REPLACE TRIGGER trg_phishing_id
BEFORE INSERT ON PHISHING
FOR EACH ROW
BEGIN
  -- Si el nuevo ID es nulo (es decir, no se proporcionó un valor en la inserción)
  IF :NEW.ID IS NULL THEN
    -- Asigna el siguiente valor de la secuencia a la columna ID
    SELECT phishing_id_seq.NEXTVAL INTO :NEW.ID FROM DUAL;
  END IF;
END;
/

commit;


INSERT INTO phishing (Filename, URL, URLLength, Domain, DomainLength, IsDomainIP, TLD, URLSimilarityIndex, CharContinuationRate, TLDLegitimateProb, URLCharProb, TLDLength, NoOfSubDomain, HasObfuscation, NoOfObfuscatedChar, ObfuscationRatio, NoOfLettersInURL, LetterRatioInURL, NoOfDegitsInURL, DegitRatioInURL, NoOfEqualsInURL, NoOfQMarkInURL, NoOfAmpersandInURL, NoOfOtherSpecialCharsInURL, SpacialCharRatioInURL, IsHTTPS, LineOfCode, LargestLineLength, HasTitle, Title, DomainTitleMatchScore, URLTitleMatchScore, HasFavicon, Robots, IsResponsive, NoOfURLRedirect, NoOfSelfRedirect, HasDescription, NoOfPopup, NoOfiFrame, HasExternalFormSubmit, HasSocialNet, HasSubmitButton, HasHiddenFields, HasPasswordField, Bank, Pay, Crypto, HasCopyrightInfo, NoOfImage, NoOfCSS, NoOfJS, NoOfSelfRef, NoOfEmptyRef, NoOfExternalRef, label) VALUES ('oph04388_4.txt','http://geminilogo9.mystrikingly.com/',35,'geminilogo9.mystrikingly.com',28,0,'com',7179548157,'0.583333333','0.5229071','0.054232495',3,1,0,0,'0',25,'0.714',1,'0.029',0,0,0,2,'0.057',0,9,50,1,'geminilogo9mystrikingly',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);


SELECT Pay FROM phishing;
/*
root
 |-- FILENAME: string (nullable = true)
 |-- URL: string (nullable = true)
 |-- URLLength: integer (nullable = true)
 |-- URLSimilarityIndex: double (nullable = true)
 |-- CharContinuationRate: double (nullable = true)
 |-- TLDLegitimateProb: double (nullable = true)
 |-- URLCharProb: double (nullable = true)
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
*/


----- Querys para trabajar con este dataset:
SELECT *  FROM phishing WHERE SpacialCharRatioInURL > '0.3';
SELECT Url, COUNT(*) FROM phishing
GROUP BY URL
HAVING COUNT(*) > 3;


-- Creación de tablas que se definieron el el modelo lógico: 
--Desactivar trigger antes que nada:
ALTER TRIGGER trg_phishing_id DISABLE;
-- Crear backup:
CREATE TABLE PHISING_BACKUP AS SELECT * FROM PHISHING;

--TABLA DOMINIOS (Relación uno a muchos):
CREATE TABLE Domains AS
SELECT DISTINCT
    Domain AS DOMAIN_NAME,
    DomainLength AS DOMAIN_LENGTH,
    IsDomainIP AS IS_DOMAIN_IP,
    TLD AS TLD,
    TLDLength AS TLDLength
FROM
    PHISHING;
    
ALTER TABLE DOMAINS ADD CONSTRAINT PK_DOMAINS PRIMARY KEY (DOMAIN_NAME);
SELECT * FROM Domains;

-- TABLA PRINCIPAL PHISHING
CREATE TABLE Phishing_urls AS 
SELECT
    ID AS URL_ID,
    FILENAME AS FILENAME,
    URL AS URL_Text,
    URLLength AS URLLength,
    Domain AS DOMAIN_NAME, -- Esta sería la FK a la tabla DOMAINS
    NoOfSubDomain AS NoOfSubDomain,
    URLSimilarityIndex AS URLSimilarityIndex,
    CharContinuationRate AS CharContinuationRate,
    TLDLegitimateProb AS TLDLegitimateProb,
    URLCharProb AS URLCharProb,
    NoOfEqualsInURL AS NoOfEqualsInURL,
    NoOfQMarkInURL AS NoOfQMarkInURL,
    NoOfAmpersandInURL AS NoOfAmpersandInURL,
    NoOfOtherSpecialCharsInURL AS NoOfOtherSpecialCharsInURL,
    SpacialCharRatioInURL AS SpacialCharRatioInURL,
    NoOfLettersInURL AS NoOfLettersInURL,
    LetterRatioInURL AS LetterRatioInURL,
    NoOfDegitsInURL AS NoOfDegitsInURL,
    DegitRatioInURL AS DegitRatioInURL,
    label AS label
FROM
    PHISHING;
    
    
ALTER TABLE PHISHING_URLS ADD CONSTRAINT PK_PHISHING_URLS PRIMARY KEY (URL_ID);
SELECT * FROM phishing_urls;

    
-- Tabla de extensión de los atributos de la página:
CREATE TABLE Page_code_attributes AS
SELECT
    ID AS URL_ID, -- Esta es la PK y FK
    LineOfCode AS LineOfCode,
    LargestLineLength AS LargestLineLength,
    NoOfImage AS NoOfImage,
    NoOfCSS AS NoOfCSS,
    NoOfJS AS NoOfJS,
    NoOfSelfRef AS NoOfSelfRef,
    NoOfEmptyRef AS NoOfEmptyRef,
    NoOfExternalRef AS NoOfExternalRef
FROM
    PHISHING;
    
ALTER TABLE Page_code_attributes ADD CONSTRAINT PK_PAGE_CODE_ATTRIBUTES PRIMARY KEY (URL_ID);
SELECT * FROM Page_code_attributes;
    
-- Tabla de extensión de comportamiento de una página (uno a uno)
CREATE TABLE page_behavior AS 
SELECT
    ID AS URL_ID, -- Esta es la PK y FK
    HasObfuscation AS HasObfuscation,
    NoOfObfuscatedChar AS NoOfObfuscatedChar,
    ObfuscationRatio AS ObfuscationRatio,
    IsHTTPS AS IsHTTPS,
    HasTitle AS HasTitle,
    Title AS Title,
    DomainTitleMatchScore AS DomainTitleMatchScore,
    URLTitleMatchScore AS URLTitleMatchScore,
    HasFavicon AS HasFavicon,
    Robots AS Robots,
    IsResponsive AS IsResponsive,
    NoOfURLRedirect AS NoOfURLRedirect,
    NoOfSelfRedirect AS NoOfSelfRedirect,
    HasDescription AS HasDescription,
    NoOfPopup AS NoOfPopup,
    NoOfiFrame AS NoOfiFrame,
    HasExternalFormSubmit AS HasExternalFormSubmit,
    HasSocialNet AS HasSocialNet,
    HasSubmitButton AS HasSubmitButton,
    HasHiddenFields AS HasHiddenFields,
    HasPasswordField AS HasPasswordField,
    Bank AS Bank,
    Pay AS Pay,
    Crypto AS Crypto,
    HasCopyrightInfo AS HasCopyrightInfo
FROM
    PHISHING;
    

ALTER TABLE page_behavior ADD CONSTRAINT PK_PAGE_BEHAVIOR_INDICATORS PRIMARY KEY (URL_ID);
SELECT * FROM page_behavior;


    commit;
-----------------

----Consultas de pruebas:
SELECT
    pu.URL_Text AS "URL de la Página",
    pca.LineOfCode AS "Líneas de Código",
    pca.LargestLineLength AS "Longitud Línea Más Larga",
    pca.NoOfImage AS "Número de Imágenes",
    pca.NoOfCSS AS "Número de Archivos CSS",
    pca.NoOfJS AS "Número de Archivos JavaScript",
    pca.NoOfSelfRef AS "Referencias a Sí Misma",
    pca.NoOfEmptyRef AS "Referencias Vacías",
    pca.NoOfExternalRef AS "Referencias Externas"
FROM
    PHISHING_URLS pu
JOIN
    PAGE_CODE_ATTRIBUTES pca ON pu.URL_ID = pca.URL_ID
WHERE
    pu.URL_ID = 12345;
    
-- Consultar si la página es de phishing o no
    SELECT 
        pu.URL_Text AS "URL de la Página",
        pu.label AS "Es legítima"
    FROM phishing_urls pu;
-- Consultar la página con el nombre de su dominio 
SELECT
    pu.URL_Text AS "Url de la página",
    dom.DOMAIN_NAME AS "Nombre dominio"
    FROM phishing_urls pu
    JOIN domains dom ON pu.DOMAIN_NAME = dom.DOMAIN_NAME;