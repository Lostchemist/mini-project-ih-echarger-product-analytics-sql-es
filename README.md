-- LEVEL 1

-- Question 1: Number of users with sessions

-- Question 2: Number of chargers used by user with id 1




-- LEVEL 2

-- Question 3: Number of sessions per charger type (AC/DC):

-- Question 4: Chargers being used by more than one user

-- Question 5: Average session time per charger




-- LEVEL 3

-- Question 6: Full username of users that have used more than one charger in one day (NOTE: for date only consider start_time)

-- Question 7: Top 3 chargers with longer sessions

-- Question 8: Average number of users per charger (per charger in general, not per charger_id specifically)

-- Question 9: Top 3 users with more chargers being used




-- LEVEL 4

-- Question 10: Number of users that have used only AC chargers, DC chargers or both

-- Question 11: Monthly average number of users per charger

-- Question 12: Top 3 users per charger (for each charger, number of sessions)




-- LEVEL 5

-- Question 13: Top 3 users with longest sessions per month (consider the month of start_time)
    
-- Question 14. Average time between sessions for each charger for each month (consider the month of start_time)
![logo_ironhack_blue 7](https://user-images.githubusercontent.com/23629340/40541063-a07a0a8a-601a-11e8-91b5-2f13e4e6b441.png)

# Mini Proyecto | IronHack eCharger Product Analytics SQL

## Asignación

El propósito de esta asignación es evaluar tu conocimiento en SQL. No se centra en alcanzar el nivel técnico más alto, sino en ver si conoces las técnicas principales y tienes experiencia mínima. La prueba está diseñada para ser resuelta en SQLite, pero si no conoces la sintaxis específica de algunas funciones, no te preocupes. El objetivo principal de estas pruebas es entender cómo piensas y cómo escribes consultas desde una perspectiva de alto nivel. Siéntete libre de usar StackOverflow o cualquier otra fuente para descubrir el equivalente de una función en SQLite. Si no lo encuentras de inmediato, simplemente escribe la consulta en tu lenguaje SQL preferido o incluso siguiendo una estructura sin código intentando mostrar tu proceso de pensamiento.

### Archivos

- **sql_test.db**

Base de datos con las siguientes tablas y columnas:

- **Users** (id, name, surname)
- **Chargers** (id, label, type)
- **Sessions** (id, user_id, charger_id, start_time, end_time)

Para abrir este archivo, recomendamos usar SQLite Studio, un cliente SQLite que te ayudará a explorar la base de datos y escribir consultas sobre la marcha. Puedes descargarlo desde [aquí](https://sqlitestudio.pl/).

![ai-eng/ironhack_echargers-1](https://education-team-2020.s3.eu-west-1.amazonaws.com/ai-eng/ironhack_echargers-1.png)

- **SQL_assignment_questions_sqlite.sql**

En este script, tienes 14 preguntas SQL para recuperar algunos datos específicos de la base de datos `sql_test.sqlite`.

### Evaluación y Entregables

Por favor, completa el archivo `SQL_assignment_questions_sqlite.sql` con tus respuestas y renómbralo a `SQL_assignment_my_solution_MYNAME_YYYYDDMM_HHMM.sql`. Por ejemplo, si completas tu archivo el 2022-10-01 a las 18:02, nombra el archivo `SQL_assignment_my_solution_20221001_1802.sql`. Sube el archivo a la misma carpeta de Drive desde donde descargaste los archivos o envíalo de vuelta a la dirección de correo electrónico desde la que recibiste todos los archivos.

Agradecemos que te tomes el tiempo para realizar esta prueba y nos gustaría pedirte que no inviertas más de 90 minutos en escribir tus soluciones. De nuevo, no te preocupes por dejar algunas preguntas en blanco o incompletas. Solo queremos una visión general de tus conocimientos y no necesitamos que el test esté completado en su totalidad. Nos centraremos en tu solución desde una perspectiva de alto nivel, deduciendo tu línea de pensamiento y cómo abordas los problemas. Siéntete libre de añadir cualquier archivo externo o comentarios que desees para apoyar tu presentación.

Hay 5 niveles de preguntas según su complejidad. Por favor, asegúrate de haber respondido o explicado el proceso de pensamiento de al menos una pregunta de cada nivel.

### Guía de SQLite Studio

SQLite Studio no requiere ninguna instalación. Puedes descomprimir la carpeta ‘SQLiteStudio’ y hacer clic en el archivo SQLiteStudio que abrirá el cliente (lo mismo en Mac, Windows o Ubuntu). Una vez abierto, crea una conexión a una nueva base de datos y selecciona el archivo `sql_test.db` adjunto a esta prueba. Puedes revisar la base de datos y las tablas en la izquierda y escribir y ejecutar consultas a la derecha. Copia y pega el contenido de `SQL_assignment_questions_sqlite.sql` en un nuevo script SQL y estarás listo para comenzar a escribir y probar tus consultas.

![ai-eng/ironhack_echargers-2](https://education-team-2020.s3.eu-west-1.amazonaws.com/ai-eng/ironhack_echargers-2.png)

Puedes descargar SQLite Studio desde [aquí](https://sqlitestudio.pl/).