\# 🚀 Advanced Kernel-Level RAM Optimizer for Windows



Un script híbrido potente y ligero desarrollado en \*\*Batch + PowerShell\*\* para purgar la memoria RAM a nivel profundo (\*Kernel Level\*) sin necesidad de instalar software de terceros. Ideal para sistemas con recursos limitados o bajo cargas de trabajo pesadas.



\---



\## 🛡️ ¿Por qué es superior a otros optimizadores?



A diferencia de las herramientas convencionales que solo cierran aplicaciones a la fuerza, este script interactúa directamente con la API de Windows (`ntdll.dll` y `kernel32.dll`) utilizando privilegios de depuración (`SeDebugPrivilege`).



\### Acciones ejecutadas:

\* \*\*Purga de la Lista Standby:\*\* Vacía la caché en espera que Windows no libera automáticamente.

\* \*\*Liberación de System Cache:\*\* Purga la caché de intercambio del sistema de archivos.

\* \*\*Vaciado de Working Sets:\*\* Obliga a los procesos activos a devolver páginas de memoria inactivas al archivo de paginación (\*Pagefile\*).

\* \*\*Garbage Collection (.NET):\*\* Fuerza la recolección de basura del entorno de ejecución de PowerShell.



\---



\## 🎨 Interfaz de Usuario (UI)



El script cuenta con un diseño de consola \*\*centrado dinámicamente\*\* y codificado con una paleta de colores de alto contraste para un reporte limpio, estético y fácil de leer.



\---



\## 🚀 Cómo usarlo (Un Solo Clic)



No requiere configurar políticas de ejecución (`Set-ExecutionPolicy`) ni abrir la consola manualmente.



1\. Descarga el archivo `SuperRAM\_Optimizer.bat`.

2\. Haz \*\*doble clic\*\* sobre él.

3\. Concede los permisos de Administrador necesarios para interactuar con el Kernel.

4\. Revisa el reporte detallado en pantalla. Presiona cualquier tecla para cerrar.



\---



\## ⚙️ Arquitectura y Compatibilidad

\* \*\*Sistemas Operativos:\*\* Windows 10 / Windows 11 / Windows Server.

\* \*\*Arquitecturas:\*\* x86, x64, ARM64.

\* \*\*Requisitos:\*\* Ejecución con privilegios de Administrador (el script se auto-eleva solo).



\---



\## 📝 Licencia

Este proyecto está bajo la Licencia MIT. Siéntete libre de modificarlo, mejorarlo o distribuido.

