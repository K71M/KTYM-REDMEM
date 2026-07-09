<h1 align="center">🚀 KTYM-REDMEM</h1>
<p align="center">
  <strong>Advanced Kernel-Level RAM Optimizer for Windows</strong><br>
  <sub>A lightweight, native, and high-performance solution to purge system memory.</sub>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Platform-Windows-blue?style=for-the-badge&logo=windows" alt="Windows">
  <img src="https://img.shields.io/badge/Architecture-x86_/_x64_/_ARM64-lightgrey?style=for-the-badge" alt="Architecture">
  <img src="https://img.shields.io/badge/License-MIT-green?style=for-the-badge" alt="License">
</p>

---

## 👁️ Visual Showcase

Así es como luce el optimizador en acción. Limpieza absoluta, interfaz completamente centrada y reportes precisos en tiempo real:

<p align="center">
  <img src="./assets/console_ui.png" width="85%" alt="Console UI Interface">
</p>

### Real-Time Performance Drop
Mira cómo impacta directamente en el Administrador de Tareas, liberando la memoria Standby y el caché oculto de Windows de forma inmediata:

<p align="center">
  <img src="./assets/task_manager.png" width="85%" alt="Task Manager Drop">
</p>

---

## 🛡️ ¿Por qué es superior a otros optimizadores?

A diferencia de las herramientas convencionales que solo cierran tus aplicaciones a la fuerza, **KTYM-REDMEM** interactúa directamente con el núcleo de Windows (`ntdll.dll` y `kernel32.dll`) utilizando privilegios de depuración (`SeDebugPrivilege`).

### ⚙️ Acciones Avanzadas Ejecutadas:
* **🧹 Purga de la Lista Standby:** Vacía la caché en espera que Windows almacena y no libera automáticamente.
* **💾 Liberación de System Cache:** Purga la caché de intercambio del sistema de archivos.
* **🔄 Vaciado de Working Sets:** Obliga a los procesos activos a devolver páginas de memoria inactivas al archivo de paginación (*Pagefile*).
* **🗑️ Garbage Collection (.NET):** Fuerza la recolección de basura profunda del entorno de ejecución.

---

## 🚀 Cómo usarlo (Un Solo Clic)

No requiere instalar software de terceros ni configurar políticas de ejecución (`Set-ExecutionPolicy`) en tu sistema.

1. Descarga el archivo ejecutable por lotes `SuperRAM_Optimizer.bat`.
2. Haz **doble clic** sobre él.
3. Concede los permisos de Administrador necesarios para que interactúe con el Kernel.
4. Revisa tu consumo de RAM en el Administrador de Tareas.

---

## 📝 Licencia
Este proyecto está bajo la Licencia MIT. Siéntete libre de modificarlo o distribuirlo.
