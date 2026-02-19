# Analizador Léxico de Números Complejos (Flex/Lex)

Este proyecto implementa un analizador léxico generado con **Flex** que identifica y valida números complejos en su forma estándar (`a + bi`) o como imaginarios puros (`bi`). El programa lee una lista de cadenas desde un archivo de texto plano y determina cuáles cumplen con las reglas léxicas definidas.

**Autor:** Julian David Cristancho Bustos  
**Programa:** Ciencias de la Computación e Inteligencia Artificial  
**Institución:** Universidad Sergio Arboleda  

---

## 📌 Características Principales

El analizador es capaz de reconocer y procesar las siguientes características léxicas:
- **Parte real e imaginaria:** Ambas partes ($a, b \in \mathbb{R}$) pueden ser números enteros o decimales.
- **Notación científica:** Soporta notación científica con la letra `e` o `E`, permitiendo espacios entre la base, la letra, el signo y el exponente (ej. `1.3 e -12`).
- **Unidad imaginaria flexible:** Acepta las letras `i, j, I, J` como identificadores de la parte imaginaria.
- **Tolerancia a espacios:** Permite espacios en blanco entre los signos `+` o `-` y los números.
- **Lectura automatizada:** Procesa la entrada línea por línea directamente desde un archivo llamado `Entrada.txt`.

---

## 🛠️ Requisitos del Sistema

Para compilar y ejecutar este proyecto, necesitas tener instalados:
- **Flex** (Fast Lexical Analyzer Generator)
- **GCC** (GNU Compiler Collection) o cualquier otro compilador de C estándar.
- Entorno basado en Unix (Linux/macOS) o Windows (MSYS2/Cygwin/WSL).

---

## 📂 Archivos del Proyecto

- `quiz.l`: Código fuente del analizador léxico escrito en Flex.
- `Entrada.txt`: Archivo de texto que contiene los casos de prueba (una cadena por línea).
- `README.md`: Documentación del proyecto.

---

## 🚀 Compilación y Ejecución

Sigue estos pasos en tu terminal para hacer funcionar el analizador:

1. **Clonar/Descargar el repositorio** y navegar a la carpeta del proyecto.
2. **Generar el código en C** a partir del archivo Flex:
   ```bash
   flex quiz.l

3. **Compilar el código C generado para crear el ejecutable:**
   ```bash
   gcc lex.yy.c -lfl -o quiz
4. **Ejecutar el programa:**
   ```bash
   ./quiz

5. **Pruebas**

Escribe en el archivo Entrada.txt lo que deseas probar por ejemplo:
- 1.3 e -12 + 2.34 I
- 1.12 e 10
- 0.13 J
- bhdvhwuiehdnc
Donde el resultado es: 
- 1.3 e -12 + 2.34 I == ACEPTA
- 1.12 e 10 == NO ACEPTA
- 0.13 J == ACEPTA
- bhdvhwuiehdnc == NO ACEPTA
