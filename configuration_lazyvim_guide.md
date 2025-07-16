# Guía de Configuración de LazyVim y Desarrollo con Rust

<!--toc:start-->
- [Guía de Configuración de LazyVim y Desarrollo con Rust](#guía-de-configuración-de-lazyvim-y-desarrollo-con-rust)
  - [1. Instalación y Configuración Inicial de LazyVim](#1-instalación-y-configuración-inicial-de-lazyvim)
    - [1.1. Añadir Configuraciones Personalizadas](#11-añadir-configuraciones-personalizadas)
    - [1.2. Activación de Extras de LazyVim](#12-activación-de-extras-de-lazyvim)
  - [2. Configuración de Plugins Específicos](#2-configuración-de-plugins-específicos)
    - [2.1. Temas (Colorscheme)](#21-temas-colorscheme)
    - [2.2. Deshabilitar Noice UI](#22-deshabilitar-noice-ui)
    - [2.3. Configuración de Snack Explorer (NvimTree)](#23-configuración-de-snack-explorer-nvimtree)
    - [2.4. Configuración para Go (Golang)](#24-configuración-para-go-golang)
  - [3. Solución de Problemas](#3-solución-de-problemas)
    - [3.1. Error en Archivos Astro](#31-error-en-archivos-astro)
  - [4. Configuración Específica para Rust](#4-configuración-específica-para-rust)
    - [4.1. Recomendaciones Generales para Rust en LazyVim](#41-recomendaciones-generales-para-rust-en-lazyvim)
    - [4.2. Prerrequisitos del Entorno Rust](#42-prerrequisitos-del-entorno-rust)
    - [4.3. Instalación y Verificación de rust-analyzer](#43-instalación-y-verificación-de-rust-analyzer)
<!--toc:end-->

Este documento detalla la instalación y configuración de LazyVim, incluyendo la personalización de plugins y la configuración específica para el entorno de desarrollo de Rust.

## 1. Instalación y Configuración Inicial de LazyVim

Se asume que LazyVim ha sido instalado desde su repositorio oficial utilizando la configuración por defecto.

### 1.1. Añadir Configuraciones Personalizadas

Para modificar o añadir configuraciones a LazyVim, es crucial seguir la documentación oficial. Las personalizaciones generalmente se realizan en el archivo:

```
~/.config/nvim/lua/config/options.lua
```

Edita este archivo según las directrices de LazyVim para ajustar las opciones a tus necesidades.

### 1.2. Activación de Extras de LazyVim

LazyVim ofrece "extras" que son colecciones de plugins y configuraciones para lenguajes o herramientas específicas. Para gestionarlos:

1. Ejecuta el comando `:LazyExtras` en Neovim.
2. Desde la interfaz de LazyExtras, puedes habilitar o deshabilitar los extras que necesites.

**Ejemplo para el plugin de Rust:**

Al abrir un archivo de Rust (`.rs`), si no tienes los plugins necesarios, puedes ejecutar `:LazyExtras`. LazyVim a menudo sugerirá y facilitará la instalación de los plugins adecuados para el lenguaje detectado.

## 2. Configuración de Plugins Específicos

Las configuraciones personalizadas para plugins individuales se gestionan creando archivos Lua específicos dentro del directorio `~/.config/nvim/lua/plugins/`.

### 2.1. Temas (Colorscheme)

Para definir un tema, crea el archivo `~/.config/nvim/lua/plugins/colorscheme.lua`. Este archivo contendrá la configuración para descargar y aplicar el tema deseado.

**Ejemplo de contenido para `colorscheme.lua`:**

```lua
-- ~/.config/nvim/lua/plugins/colorscheme.lua
return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  -- Puedes añadir más temas aquí y cambiar el que se carga por defecto
}
```

> **Nota**: Reemplaza "folke/tokyonight.nvim" y la configuración según el tema que desees usar.

### 2.2. Deshabilitar Noice UI

El plugin noice.nvim es responsable de mostrar mensajes flotantes para los comandos. Si prefieres el comportamiento tradicional de Vim (mensajes en la línea de comandos inferior), puedes deshabilitarlo.

Crea el archivo `~/.config/nvim/lua/plugins/noice.lua` con el siguiente contenido:

```lua
-- ~/.config/nvim/lua/plugins/noice.lua
return {
  { "folke/noice.nvim", enabled = false },
}
```

### 2.3. Configuración de Snack Explorer (NvimTree)

Para que el explorador de archivos (usualmente NvimTree, gestionado por snack-explorer en algunos contextos de LazyVim) muestre archivos y carpetas ocultas, puedes crear o modificar el archivo `~/.config/nvim/lua/plugins/snack-explorer.lua` o el archivo correspondiente a `nvim-tree.lua`.

**Ejemplo para NvimTree** (si snack-explorer lo usa o si configuras NvimTree directamente):

```lua
-- ~/.config/nvim/lua/plugins/nvim-tree.lua (o el archivo relevante para tu explorador)
return {
  "nvim-tree/nvim-tree.lua",
  opts = {
    view = {
      hide_dotfiles = false, -- Muestra archivos ocultos (dotfiles)
    },
    filters = {
      dotfiles = false, -- Asegura que los dotfiles no sean filtrados por defecto
      custom = {},    -- Puedes añadir filtros personalizados aquí
    },
  },
}
```

> **Nota**: El nombre exacto del archivo y la estructura pueden variar ligeramente dependiendo de la versión de LazyVim y cómo gestiona snack-explorer.

### 2.4. Configuración para Go (Golang)

La configuración para trabajar con Go se puede añadir creando el archivo `~/.config/nvim/lua/plugins/go-lang.lua`. Esta configuración a menudo se basa en los "extras" proporcionados por LazyVim.

El contenido de este archivo puede ser similar al que se encuentra en el repositorio oficial de LazyVim para el extra de Go:
<https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/extras/lang/go.lua>

Es importante destacar que existen múltiples archivos de configuración para los diversos "extras" de LazyVim. La configuración en estos archivos suele ser la misma que la documentada y es la predeterminada para los plugins de extras de LazyVim (accesibles mediante el comando `:LazyExtras`).

## 3. Solución de Problemas

### 3.1. Error en Archivos Astro

Se ha reportado el siguiente error al trabajar con archivos Astro:

```
Error in FileType Autocommands for "*"..function <SNR>1_LoadFTPlugin[20]..script /usr/local/share/nvim/runtime/ftplugin/astro.vim[164]..function <SNR>31_CollectPathsFromConfig:
line 11:
E474: Trailing comma: } }, }
```

Este error se solucionó eliminando el archivo astro.vim de la siguiente ruta:

```
sudo rm /usr/local/share/nvim/runtime/ftplugin/astro.vim
```

> **Precaución**: Eliminar archivos del sistema de Neovim puede tener efectos secundarios. Considera moverlo o renombrarlo primero.

## 4. Configuración Específica para Rust

Para un desarrollo óptimo con Rust en LazyVim, sigue estas recomendaciones:

### 4.1. Recomendaciones Generales para Rust en LazyVim

- **Utiliza los plugins de LazyExtras**: Asegúrate de que los extras para Rust estén activados mediante `:LazyExtras`. Esto instalará rust-tools.nvim o herramientas similares y rust-analyzer.

- **Instalación Limpia**: Considera una instalación limpia de Neovim o asegúrate de que no haya configuraciones conflictivas previas si encuentras problemas con la configuración de Rust.

### 4.2. Prerrequisitos del Entorno Rust

Antes de configurar LazyVim para Rust, asegúrate de que tu sistema tiene:

- **Rust y Cargo Instalados**:
  - Si no los tienes, instálalos desde rustup.rs.

- **Verifica el Estado de tu Instalación de Rust**:
  - Puedes usar el siguiente comando en tu terminal:

    ```
    rustup show
    ```

### 4.3. Instalación y Verificación de rust-analyzer

rust-analyzer es el servidor de lenguaje oficial para Rust y es esencial para funcionalidades como autocompletado, diagnóstico y navegación de código.

- **Verifica si rust-analyzer está instalado y accesible**:
  - El binario de rust-analyzer usualmente se encuentra en `~/.cargo/bin/`. Puedes verificarlo con:

    ```
    ~/.cargo/bin/rust-analyzer --version
    ```

  - O de forma más general (si está en tu PATH):

    ```
    rust-analyzer --version
    ```

- **Instala rust-analyzer si no está presente**:
  - Si el comando anterior falla o indica que no está instalado, puedes instalarlo usando rustup:

    ```
    rustup component add rust-analyzer
    ```

- **Asegura la Toolchain Nocturna (Nightly) para rust-analyzer**:
  - Algunas características de rust-analyzer pueden funcionar mejor o ser más recientes con la toolchain nocturna. Para añadir rust-analyzer a tu toolchain nocturna (ejemplo para Linux x86_64):

    ```
    rustup component add rust-analyzer --toolchain nightly-x86_64-unknown-linux-gnu
    ```

  - Ajusta `nightly-x86_64-unknown-linux-gnu` según tu sistema operativo y arquitectura si es diferente.

- **Actualiza tu Toolchain Nocturna**:
  - Mantén tu toolchain nocturna y sus componentes actualizados.

  ```
    rustup update nightly 
  ```

Claro, aquí tienes el texto convertido a documentación en formato Markdown.

# 🐍 Guía: Entornos Virtuales de Python en LazyVim con venv-selector.nvim

Esta guía detalla el proceso para configurar y utilizar **`venv-selector.nvim`** en una instalación de Neovim con **LazyVim**, específicamente en un entorno de Arch Linux. Este plugin ofrece una manera rápida y eficiente de seleccionar el entorno virtual de Python (`.venv`, `venv`, etc.) para un proyecto.

-----

## 1\. Problema Inicial 🤔

Al utilizar la configuración por defecto de LazyVim para Python, el comando `:PythonSetInterpreter` puede no estar disponible o no funcionar como se espera. Una solución más robusta y directa es utilizar un plugin dedicado como **`venv-selector.nvim`**.

-----

## 2\. Instalación y Configuración del Plugin ⚙️

Para habilitar **`venv-selector.nvim`** en LazyVim, es necesario crear un archivo de configuración específico para él en la carpeta de plugins.

#### Paso 1: Crear el Archivo de Configuración

Crea un nuevo archivo Lua en el directorio de plugins de tu configuración de Neovim:

```bash
touch ~/.config/nvim/lua/plugins/python-venv.lua
```

#### Paso 2: Añadir el Código de Configuración

Pega el siguiente código en el archivo `python-venv.lua` que acabas de crear. Esta configuración define el plugin, sus dependencias, cuándo debe cargarse y un atajo de teclado para activarlo.

```lua
-- ~/.config/nvim/lua/plugins/python-venv.lua
return {
  -- El nombre del plugin en GitHub
  "linux-cultist/venv-selector.nvim",

  -- Dependencias necesarias para el funcionamiento del plugin
  dependencies = {
    "neovim/nvim-lspconfig",
    "nvim-telescope/telescope.nvim", -- Requerido para la interfaz de selección
    "mfussenegger/nvim-dap-python",   -- Opcional, para integración con el depurador
  },

  -- Carga perezosa: El plugin solo se activará al abrir archivos de Python
  ft = { "python" },

  -- Configuración principal del plugin
  config = function()
    -- Se utiliza la configuración por defecto, que es suficiente para la mayoría de los casos.
    require("venv-selector").setup()
  end,

  -- Atajos de teclado para una mayor comodidad
  keys = {
    -- Define el atajo <leader>pv para ejecutar el comando VenvSelect
    -- El 'desc' añade una descripción útil que puede ser vista con plugins como which-key
    { "<leader>pv", "<cmd>VenvSelect<cr>", desc = "Python: Seleccionar Entorno Virtual" },
  },
}
```

-----

## 3\. Solución de Errores Comunes 🛠️

#### Error: `Cannot find any fd binary on your system`

Al intentar usar el atajo de teclado (`<leader>pv`) por primera vez, es muy probable que encuentres este error.

> **Causa**: El plugin utiliza **Telescope** para mostrar la lista de entornos virtuales. A su vez, Telescope depende de una herramienta de línea de comandos llamada **`fd`** para buscar archivos y directorios de manera eficiente. El error indica que `fd` no está instalado en tu sistema.

> **Solución en Arch Linux**: La instalación de `fd` es muy sencilla. Abre una terminal y ejecuta el siguiente comando:

```bash
sudo pacman -S fd
```

Una vez instalado `fd`, reinicia Neovim. El error desaparecerá.

-----

## 4\. Flujo de Trabajo Final ✅

Con la configuración completada y las dependencias instaladas, el proceso para cambiar de entorno virtual es el siguiente:

1. Abre cualquier archivo `.py` dentro de tu proyecto en Neovim.
2. Presiona la combinación de teclas **`<leader>pv`** (tu tecla líder, seguida de `p` y `v`).
3. Se abrirá una ventana de **Telescope** mostrando todos los entornos virtuales detectados en el directorio del proyecto.
4. Navega por la lista y presiona `Enter` para seleccionar el entorno deseado.
5. El plugin reconfigurará automáticamente el LSP (`pyright`) y otras herramientas para utilizar el intérprete de Python del entorno que has seleccionado.
