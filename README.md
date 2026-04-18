<div align="center">

```
   ✦  ·  ·   ★   ·  ✦  ·   ·   ✧   ·   ✦
  ·   ·   ✧   ·   ✦   ·  ·  ★   ·  ·   ✦  ·
```

```
░█████╗░██╗   ██╗██████╗  █████╗ ███████╗████████╗██████╗  █████╗ ██╗
██╔══██╗██║   ██║██╔══██╗██╔══██╗██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██║
███████║██║   ██║██████╔╝███████║███████╗   ██║   ██████╔╝███████║██║
██╔══██║██║   ██║██╔══██╗██╔══██║╚════██║   ██║   ██╔══██╗██╔══██║██║
██║  ██║╚██████╔╝██║  ██║██║  ██║███████║   ██║   ██║  ██║██║  ██║███████╗
╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝
```

### *Your terminal horoscope engine — powered by the stars & Groq AI*

```
   ·  ✦   ·   ·  ✧  ·   ★   ·  ✦  ·  ·   ✧
```

[![Ruby](https://img.shields.io/badge/Ruby-3.2%2B-CC342D?style=flat-square&logo=ruby&logoColor=white)](https://www.ruby-lang.org/)
[![Version](https://img.shields.io/badge/version-0.0.2-blueviolet?style=flat-square)](./CHANGELOG.md)
[![Groq](https://img.shields.io/badge/Groq-LLaMA_3.3_70B-F55036?style=flat-square)](https://groq.com/)
[![CLI](https://img.shields.io/badge/Interface-Interactive_CLI-4B0082?style=flat-square)](https://github.com)
[![License](https://img.shields.io/badge/License-MIT-gold?style=flat-square)](./LICENSE)
[![Free API](https://img.shields.io/badge/API-100%25_Free-27ae60?style=flat-square)](https://console.groq.com/)

> *"The stars incline, they do not bind — but they do speak to those who listen via CLI."*

</div>

---

## 🌌 ¿Qué es Aurastral?

**Aurastral** es una herramienta de línea de comandos escrita en Ruby que genera horóscopos personalizados usando inteligencia artificial (LLaMA 3.3 70B vía Groq API gratuita). Con una experiencia de usuario completamente interactiva — splash screen animado, navegación con flechas y animaciones de carga — es el tipo de proyecto que nadie *necesita*, pero todos *quieren tener* en su GitHub.

---

## ✨ ¿Qué hay de nuevo en v0.0.2?

| # | Feature | Descripción |
|---|---|---|
| 🔴 | **Splash screen animado** | ASCII art en rojo que aparece línea por línea al ejecutar `aurastral start` |
| 🎛️ | **Menú interactivo completo** | Navega todas las opciones con flechas ↑↓ y Enter — sin escribir flags |
| ⏳ | **Spinner de carga** | Animación dorada mientras la IA consulta los astros |
| 🌟 | **Nuevo comando de entrada** | `aurastral start` es el único punto de entrada |

---

## 🖥️ Demo

### Splash screen (animación de entrada)

```
   ✦  ·  ★  ·  ✦  ·  ✧

░█████╗░██╗   ██╗██████╗  █████╗ ███████╗████████╗██████╗  █████╗ ██╗
██╔══██╗██║   ██║██╔══██╗██╔══██╗██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██║
███████║██║   ██║██████╔╝███████║███████╗   ██║   ██████╔╝███████║██║
██╔══██║██║   ██║██╔══██╗██╔══██║╚════██║   ██║   ██╔══██╗██╔══██║██║
██║  ██║╚██████╔╝██║  ██║██║  ██║███████║   ██║   ██║  ██║██║  ██║███████╗
╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝

        Your terminal horoscope engine — v0.0.2
```
*↑ Aparece en rojo, línea por línea, en ~2 segundos*

---

### Menú interactivo

```
✦ What would you like to do?
‣ Read my horoscope
  About Aurastral
  Exit
```

```
✦ Select your sign:
‣ ♈  Aries     (Mar 21 – Apr 19)
  ♉  Taurus    (Apr 20 – May 20)
  ♊  Gemini    (May 21 – Jun 20)
  ♋  Cancer    (Jun 21 – Jul 22)
  ♌  Leo       (Jul 23 – Aug 22)
  ♍  Virgo     (Aug 23 – Sep 22)
  ♎  Libra     (Sep 23 – Oct 22)
  ♏  Scorpio   (Oct 23 – Nov 21)
  ♐  Sagittarius (Nov 22 – Dec 21)
  ♑  Capricorn (Dec 22 – Jan 19)
  ♒  Aquarius  (Jan 20 – Feb 18)
  ♓  Pisces    (Feb 19 – Mar 20)
```

```
✦ How are you feeling today? (optional, press Enter to skip)
> feeling chaotic and ready for anything
```

---

### Spinner de carga

```
⠋ Consulting the stars...
```
*↑ Animación dorada mientras Groq procesa la respuesta (~300ms)*

```
✦ The stars have spoken.
```

---

### Output final

```
╔══════════════════════════════════════════╗
║   ♏  SCORPIO — October 23 · Nov 21  ♏   ║
╚══════════════════════════════════════════╝

  ✦ Today, the universe conspires in your favor —
    or at least, it's pretending to. Mercury in
    retrograde has finally packed its bags, leaving
    you with unusual clarity. Trust that instinct
    you've been ignoring since Tuesday.

  ────────────────────────────────────────────
  🌙 Lucky number  →  7
  💫 Avoid         →  people who say "per my last email"
  🔮 Energy        →  chaotic neutral (as requested)
  ────────────────────────────────────────────
```

---

## 🗂️ Estructura del proyecto

```
aurastral/
├── bin/
│   └── aurastral              # Ejecutable — reconoce `aurastral start`
├── lib/
│   └── aurastral/
│       ├── cli.rb              # Menú interactivo completo con tty-prompt
│       ├── splash.rb           # ★ NUEVO — Animación ASCII en rojo
│       ├── spinner.rb          # ★ NUEVO — Spinner dorado con tty-spinner
│       ├── horoscope.rb        # Lógica de generación y prompt builder
│       ├── groq_client.rb      # Cliente HTTP para Groq API
│       ├── renderer.rb         # Output decorado con TTY gems
│       ├── exporter.rb         # Exportación a Markdown
│       ├── version.rb          # VERSION = "0.0.2"
│       ├── themes/
│       │   ├── cosmic.rb
│       │   ├── minimal.rb
│       │   └── retro.rb
│       └── signs.rb
├── spec/
│   ├── horoscope_spec.rb
│   └── groq_client_spec.rb
├── .env.example
├── Gemfile
├── Gemfile.lock
├── CHANGELOG.md
├── aurastral.gemspec
└── README.md
```

---

## 🛠️ Stack tecnológico

| Capa | Tecnología | Rol |
|---|---|---|
| **Lenguaje** | Ruby 3.2+ | Core del proyecto |
| **IA / LLM** | Groq API + LLaMA 3.3 70B | Generación de horóscopos |
| **HTTP Client** | `faraday` | Requests a la API |
| **CLI Parsing** | `OptionParser` (stdlib) | Comando `start` |
| **Menú interactivo** | `tty-prompt` | Navegación con flechas y Enter |
| **Animación de carga** | `tty-spinner` | ★ Nuevo en v0.0.2 |
| **Terminal UI** | `tty-box`, `pastel` | Output visual decorado |
| **Splash screen** | ANSI escapes + `pastel` | ★ Nuevo en v0.0.2 |
| **Config** | `dotenv` | Variables de entorno |
| **Testing** | `rspec` | Unit tests |
| **Packaging** | RubyGems + `gemspec` | Distribución como gema |

---

## 🚀 Instalación

### Prerequisitos

- Ruby `>= 3.2.0`
- Una API key gratuita de [Groq Console](https://console.groq.com/) — tarda 30 segundos

### Pasos

```bash
# 1. Clona el repo
git clone https://github.com/tu-usuario/aurastral.git
cd aurastral

# 2. Instala dependencias
bundle install

# 3. Configura tu API key
cp .env.example .env
# Edita .env y pega tu GROQ_API_KEY

# 4. Hazlo ejecutable
chmod +x bin/aurastral

# 5. ¡Lanza Aurastral!
bin/aurastral start
```

### Instalación global (opcional)

```bash
gem build aurastral.gemspec
gem install aurastral-0.0.2.gem

# Desde cualquier lugar:
aurastral start
```

---

## 🎮 Uso

### El único comando que necesitas

```bash
aurastral start
```

Eso es todo. El splash animado aparece, luego el menú interactivo te guía por todo el proceso con las flechas del teclado.

### Flujo completo de navegación

```
aurastral start
    │
    ▼
🔴 Splash screen ASCII animado (~2s)
    │
    ▼
✦ Menú principal
  ▸ Read my horoscope  ──► 1. Elige tu signo (12 opciones con símbolo)
    About Aurastral         2. Elige período (Day / Week / Month)
    Exit                    3. Escribe tu mood (opcional)
                            4. Elige idioma (English / Español)
                            5. Elige tema visual
                            6. ¿Exportar a Markdown?
                                 │
                                 ▼
                            ⠋ Spinner dorado animado
                                 │
                                 ▼
                            ✦ Output final decorado
```

---

## 🔑 Variables de entorno

```bash
# .env (no subir al repo — ya está en .gitignore)
GROQ_API_KEY=gsk_xxxxxxxxxxxxxxxxxxxxxxxx

# Opcionales
AURASTRAL_DEFAULT_LANG=es
AURASTRAL_DEFAULT_THEME=cosmic
AURASTRAL_EXPORT_DIR=~/horoscopes
```

---

## 🌠 Temas visuales

| Tema | Descripción | Caracteres |
|---|---|---|
| `cosmic` | Violetas, dorados y estrellas Unicode | `✦ ♏ ★ ✧` |
| `minimal` | Solo texto, sin color | `>` |
| `retro` | ASCII art estilo terminal 80s | `[*] ===` |
| `pastel` | Colores suaves, ideal para screenshots | `🌸 💫 🌙` |

---

## 🧪 Tests

```bash
bundle exec rspec
bundle exec rspec --format documentation
```

---

## 📋 CHANGELOG

### v0.0.2 — *The Animated Update*
- ✅ Splash screen ASCII animado en rojo al ejecutar `aurastral start`
- ✅ Menú completamente interactivo con flechas y Enter (`tty-prompt`)
- ✅ Spinner dorado animado durante la carga (`tty-spinner`)
- ✅ Nuevos archivos: `splash.rb` y `spinner.rb`
- ✅ Versión centralizada en `lib/aurastral/version.rb`

### v0.0.1 — *The Beginning*
- ✅ CLI funcional con flags manuales
- ✅ Integración con Groq API (LLaMA 3.3 70B)
- ✅ Temas visuales: cosmic, minimal, retro
- ✅ Exportación a Markdown
- ✅ Soporte multi-idioma (en/es)

---

## 🗺️ Roadmap

- [x] **v0.0.1** — MVP: CLI funcional con Groq + tema cosmic
- [x] **v0.0.2** — Splash animado + menú interactivo + spinner de carga
- [ ] **v0.0.3** — Historial de lecturas + exportación mejorada
- [ ] **v0.0.4** — Carta natal (fecha + hora + lugar de nacimiento)
- [ ] **v0.0.5** — Publicación en RubyGems.org
- [ ] **v1.0.0** — Plugin para Neovim 👀

---

## 🤝 Contribuciones

Las contribuciones son bienvenidas. Si quieres agregar un tema nuevo, soporte de idioma o cualquier feature, abre un issue o un PR.

```bash
git checkout -b feature/nombre-del-feature
```

---

## 📄 Licencia

MIT © 2025 — Hecho con ☕, Ruby y demasiadas horas mirando la pantalla.

---

<div align="center">

*"Not all those who wander are lost — some are just reading their terminal horoscope."*

**⭐ Dale una estrella si te gustó el proyecto**

</div>