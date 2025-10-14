# 📁 Gestión y versionamiento de Scripts – Repositorio GitHub  
**Analytics | Mutual de Seguridad**  

Este repositorio contiene la estructura organizada para el almacenamiento, versionado y documentación de nuestros activos digitales en formato **Python (`.py`)** y **Jupyter Notebooks (`.ipynb`)**, siguiendo las mismas buenas prácticas aplicadas en nuestro entorno SharePoint.

---

## 📐 Estructura de Carpetas

El repositorio replica la estructura documental institucional y debe mantenerse siempre organizada de la siguiente forma:

```
├── 01_Queries_Python/
│   ├── analisis_v01.ipynb
│   ├── analisis_v02.ipynb
│   └── ...
├── 02_Queries_SQL/
|   ├── analisis_v01.sql
│   ├── analisis_v02.sql
│   └── ...

```

---

## 🧑‍💻 Convenciones de Nombres y Versionado

Cada archivo debe cumplir con la siguiente estructura de nombre:

```
nombre_variable_v01.ipynb
```

- `nombre_variable`: nombre descriptivo y breve de la variable, proceso o script.  
- `v01`: versión del archivo. **Se debe incrementar en cada modificación relevante** (`v02`, `v03`, etc.).  
- Evita espacios o caracteres especiales. Usa guiones bajos `_` si es necesario.

Ejemplo:

```
extraccion_dias_reposo_v01.ipynb
extraccion_dias_reposo_v02.ipynb
```

---

## 🔄 Control de Versiones y Flujo de Trabajo

El flujo recomendado para trabajar en este repositorio es el siguiente:

### 1. Clonar el repositorio  
Desde Visual Studio Code o DBeaver, clonar el repositorio en tu equipo:

```bash
git clone https://github.com/SGControlGest/Analytics
```

---

### 2. Crear tu rama personal  
Cada integrante debe trabajar en **su propia rama** para evitar conflictos en la rama principal:

```bash
git checkout -b nombre_usuario/feature_nombre
```

Ejemplo:
```bash
git checkout -b drojas/extraccion_datos
```

---

### 3. Subir cambios con versiones claras  
Antes de subir cualquier archivo:

- Asegúrate de actualizar la versión (`v01`, `v02`, …).  
- Incluye un breve comentario descriptivo en el commit.

```bash
git add 01_Queries_Python/extraccion_datos_v02.ipynb
git commit -m "Actualización script extracción de datos - versión 02"
git push origin drojas/extraccion_dato
```

---

### 4. Pull Request (PR) a `main`  
Cuando un cambio esté revisado y aprobado, crear un **Pull Request** hacia la rama `main`.  
- La `main` debe contener únicamente versiones **validadas y estables**.  
- Todo cambio importante debe pasar por revisión antes de integrarse.

---

## 🧰 Buenas Prácticas de Desarrollo

✅ **Documentar siempre:** Cada notebook debe incluir una breve descripción del objetivo del script, autor y fecha.  
✅ **Evitar sobreescrituras:** Nunca subir archivos con el mismo nombre.  
✅ **Mantener el historial:** No eliminar versiones antiguas, sirven como referencia de evolución del código.  
✅ **Commits descriptivos:** Usa mensajes de commit claros que expliquen qué se cambió y por qué.  
✅ **Mantener estructura:** Guardar el script o query en su carpeta correspondiente.
✅ **Mantener estructura:** Guardar el script o query en su carpeta correspondiente.
✅**Coordinación**: Coordinar tanto las tareas a realizar como la forma de ejecutarlas, manteniendo una estructura y un orden de trabajo que permitan optimizar recursos y evitar la duplicación de esfuerzos.

---

## 🧪 Ejemplo de flujo completo

1. Clonas el repositorio.  
2. Creas tu rama `drojas/ajuste_modelo`.  
3. Subes el archivo `01_Queries_Python/modelo_prediccion_v02.ipynb`.  
4. Haces commit con mensaje:  
   > "Actualización modelo de predicción - se agrega limpieza de datos"  
5. Creas un Pull Request hacia `main`.  
6. Tras revisión conjunta, se aprueba e integra el cambio.

---

## 📜 Normas de Versionado Resumidas

| Tipo de archivo             | Ejemplo de nombre                   | Reglas principales                                  |
|----------------------------|------------------------------------|------------------------------------------------------|
| Script Python             | `extraccion_base_v01.ipynb`        | Incrementar versión por cada modificación           |
| Regla de negocio          | `definicion_variable_v02.ipynb`    | Mantener histórico de cambios en definiciones       |

---

## 📌 Recomendaciones Finales

- Utiliza **Visual Studio Code** con la extensión de Git integrada para gestionar ramas y commits fácilmente.  
- Evita subir notebooks con salidas pesadas o datos sensibles.  
- Siempre realiza `pull` de la rama principal antes de iniciar nuevos desarrollos.

**Integración de Dbeaver en proceso**

---

📚 **Mantén este README actualizado** cada vez que se incorporen nuevas tematicas o lenguajes de programación al repositorio u se sumen nuevas convenciones.