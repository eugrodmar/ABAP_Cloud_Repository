# ABAP Cloud · Ejercicios y Práctica

Repositorio de ejercicios desarrollados durante la formación en **SAP** en Experis Academy (Junta de Andalucía, 2026).

Cubre tres áreas del desarrollo ABAP Cloud moderno: modelado de datos con CDS Views, consultas sobre esos modelos y desarrollo de servicios RESTful con el modelo RAP.

---

## Contenido principal

### [CDS Views & CDS Queries](./src/zrepaso17/)

Cada ejercicio tiene dos partes que van en pareja: la **definición de la vista CDS** (`.ddls`) y la **clase ABAP que la consulta** (`.clas.abap`). La vista modela los datos sobre SAP HANA y la clase los ejecuta y muestra el resultado en consola.

Conceptos trabajados:
- Definición de vistas sobre tablas SAP con joins entre entidades
- Campos calculados, expresiones `CASE`, concatenaciones y conversiones de tipo
- Consultas `SELECT` sobre CDS Views con ordenación y filtros
- Operaciones con tablas internas en ABAP OO
- Gestión de excepciones en consultas


---

### [RAP Model](./src/zlibreria_17/)

Ejercicios de **ABAP RESTful Application Programming**. Desarrollo de servicios OData listos para consumir desde SAP Fiori, siguiendo la arquitectura RAP sobre BTP.

Conceptos trabajados:
- Definición de Business Objects (BO)
- Behavior Definition y Behavior Implementation
- Proyecciones y exposición como servicio OData
- Personalización de vistas en SAP Fiori Elements

---

## Stack

![SAP BTP](https://img.shields.io/badge/SAP_BTP-0066CC?style=flat-square&logo=sap&logoColor=white)
![ABAP Cloud](https://img.shields.io/badge/ABAP_Cloud-0066CC?style=flat-square&logo=sap&logoColor=white)
![CDS Views](https://img.shields.io/badge/CDS_Views-0066CC?style=flat-square&logo=sap&logoColor=white)
![RAP Model](https://img.shields.io/badge/RAP_Model-0066CC?style=flat-square&logo=sap&logoColor=white)
![SAP HANA](https://img.shields.io/badge/SAP_HANA-0066CC?style=flat-square&logo=sap&logoColor=white)
![SAP Fiori](https://img.shields.io/badge/SAP_Fiori-0066CC?style=flat-square&logo=sap&logoColor=white)

---

## Contexto formativo

Formación **SAP Business Technology Platform — Desarrollador SAP Back-End ABAP Cloud**
Experis Academy · Manpower Group · Junta de Andalucía (FPE) · 2026
