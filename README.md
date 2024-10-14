# 🚀 NoWait

**NoWait** es una aplicación que nace con la idea de **nunca hacer colas físicas**. Ofrecemos un sistema en el que puedes realizar colas virtuales, gestionadas de manera automática. Este es el proyecto **no_wait_front-end**, creado con [Flutter](https://flutter.dev), donde estamos implementando mejoras para ofrecer una interfaz amigable que te permita entender rápidamente cómo funciona el sistema de frontend de NoWait.

## 🏗️ Arquitectura

El proyecto sigue una **arquitectura hexagonal** con una capa adicional de presentación. En la capa de presentación se muestran las pantallas, widgets, vistas y funciones necesarias para una experiencia **responsive** y amigable con el usuario. 

### Detalles de la Arquitectura

- **Capa de Presentación**: Interactúa directamente con el usuario.
- **Arquitectura Hexagonal**: Gestiona el envío y la recepción de datos con el **backend**. La capa más externa (presentación) se comunica únicamente con la capa de aplicación.
- **Comunicación**: Utiliza modelos y repositorios de dominio que se conectan a través de adaptadores de infraestructura. 

En este sistema, hay un **switch** que elige de dónde se va a proveer la información, que puede ser un **endPoint** (de cualquier backend). Se separa la lógica del backend al que se le hace la petición del resto, permitiendo así, en un futuro, cambiar el proveedor de dicha información en el frontend. También se puede obtener información de un **DEMO** proporcionado por el mismo frontend, lo que facilita la creación de vistas demostrativas al presentar el producto NoWait.

Este switch entre **endPoint** y **DEMO** es gestionado por el "core" de la aplicación, específicamente en el **server_locator**, donde mediante la librería [GetIt](https://pub.dev/packages/get_it) se instancian las dependencias necesarias para la aplicación. Dentro de este archivo, puedes cambiar el proveedor de datos (endPoint o DEMO).

Cuenta con un sistema de autoRefresh para actualizar los tokens (accessToken y refreshToken, de 10 minutos y 1 dia manejados respectivamente) en el que al realizar cada una de las peticiones se manda el accessToken y en caso de que este este caducado y el [Back-end](https://github.com/Skrillboss/no_wait_backEnd) responda con un codigo en especifico (actualmente es el 401) envie automaticamente una peticion para actualizar el accessToken con el header Authorization enviando el refreshToken.

---

¡Gracias por tu interés en NoWait! Si tienes preguntas, no dudes en contactarnos. 😊
