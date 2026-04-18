<div align="center">

```
   ✦  ·  ·   ★   ·  ✦  ·   ·   ✧   ·   ✦
  ·   ·   ✧   ·   ✦   ·  ·  ★   ·  ·   ✦  ·
```

# 🔮 Aurastral

### *Your terminal horoscope engine — powered by the stars & Groq AI*

```
   ·  ✦   ·   ·  ✧  ·   ★   ·  ✦  ·  ·   ✧
```

[![Ruby](https://img.shields.io/badge/Ruby-3.2%2B-CC342D?style=flat-square&logo=ruby&logoColor=white)](https://www.ruby-lang.org/)
[![Groq](https://img.shields.io/badge/Groq-LLaMA_3.3_70B-F55036?style=flat-square&logo=groq&logoColor=white)](https://groq.com/)
[![CLI](https://img.shields.io/badge/Interface-Terminal_CLI-4B0082?style=flat-square&logo=gnometerminal&logoColor=white)](https://github.com)
[![License](https://img.shields.io/badge/License-MIT-gold?style=flat-square)](./LICENSE)
[![Free API](https://img.shields.io/badge/API-100%25_Free-27ae60?style=flat-square)](https://console.groq.com/)

> *"The stars incline, they do not bind — but they do speak to those who listen via CLI."*

</div>

---

## 🌌 ¿Qué es Aurastral?

**Aurastral** es una herramienta de línea de comandos escrita en Ruby que genera horóscopos personalizados usando inteligencia artificial (LLaMA 3.3 70B vía Groq). Combina la elegancia del lenguaje Ruby con outputs visuales decorados en terminal, soporte de múltiples temas y exportación a Markdown.

Es el tipo de proyecto que nadie *necesita*, pero todos *quieren tener* en su GitHub.

```bash
$ aurastral --sign scorpio --mood "feeling chaotic"

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

## ✨ Features

- 🔮 **Horóscopos generados por IA** — Cada lectura es única, contextual y usa tu estado de ánimo como input
- 🎨 **Temas visuales para terminal** — `cosmic`, `minimal`, `retro`, `pastel` y más
- 📅 **Modo diario / semanal / mensual** — Perspectivas de diferentes rangos temporales
- 💾 **Exportación a Markdown** — Guarda tus lecturas en archivos `.md` con timestamps
- 🌍 **Soporte multi-idioma** — Español, inglés y portugués
- 🎭 **Parámetro `--mood`** — Ajusta el tono de la lectura según cómo te sientas hoy
- 🌙 **Todos los 12 signos** — De Aries a Piscis, nadie queda sin leer
- ⚡ **Ultra-rápido** — Groq entrega respuestas en ~300ms
- 🔁 **Modo interactivo** — Loop de consultas sin reiniciar el proceso

---

## 🗂️ Estructura del proyecto

```
aurastral/
├── bin/
│   └── aurastral            # Ejecutable principal (CLI entry point)
├── lib/
│   └── aurastral/
│       ├── cli.rb            # Parser de argumentos (OptionParser)
│       ├── horoscope.rb      # Lógica de generación y prompt builder
│       ├── groq_client.rb    # Cliente HTTP para Groq API
│       ├── renderer.rb       # Output decorado en terminal (TTY)
│       ├── exporter.rb       # Exportación a Markdown
│       ├── themes/
│       │   ├── cosmic.rb     # Tema por defecto — violetas y dorado
│       │   ├── minimal.rb    # Limpio, sin decoración
│       │   └── retro.rb      # ASCII art estilo 80s
│       └── signs.rb          # Datos de los 12 signos zodiacales
├── spec/
│   ├── horoscope_spec.rb
│   └── groq_client_spec.rb
├── .env.example              # Variables de entorno de ejemplo
├── Gemfile
├── Gemfile.lock
├── aurastral.gemspec
└── README.md
```

---

## 🛠️ Stack tecnológico

| Capa | Tecnología | Rol |
|---|---|---|
| **Lenguaje** | Ruby 3.2+ | Core del proyecto |
| **IA / LLM** | Groq API + LLaMA 3.3 70B | Generación de horóscopos |
| **HTTP Client** | `net/http` + `faraday` | Requests a la API |
| **CLI Parsing** | `OptionParser` (stdlib) | Flags y argumentos |
| **Terminal UI** | `tty-prompt`, `pastel`, `tty-box` | Output visual decorado |
| **Config** | `dotenv` | Variables de entorno |
| **Testing** | `rspec` | Unit tests |
| **Packaging** | RubyGems + `gemspec` | Distribución como gema |

---

## 🚀 Instalación

### Prerequisitos

- Ruby `>= 3.2.0`
- Una API key gratuita de [Groq Console](https://console.groq.com/) (tarda 30 segundos)

### Pasos

```bash
# 1. Clona el repo
git clone https://github.com/tu-usuario/aurastral.git
cd aurastral

# 2. Instala dependencias
bundle install

# 3. Configura tu API key
cp .env.example .env
echo "GROQ_API_KEY=tu_api_key_aqui" >> .env

# 4. Hazlo ejecutable
chmod +x bin/aurastral

# 5. (Opcional) Instálalo globalmente
gem build aurastral.gemspec
gem install aurastral-*.gem
```

---

## 🔭 Uso

### Comandos básicos

```bash
# Horóscopo del día (modo interactivo)
aurastral

# Signo específico
aurastral --sign scorpio

# Con estado de ánimo
aurastral --sign libra --mood "anxious about a decision"

# Perspectiva semanal
aurastral --sign gemini --period week

# Idioma español
aurastral --sign aries --lang es

# Tema visual
aurastral --sign taurus --theme retro

# Exportar a Markdown
aurastral --sign pisces --export

# Ver todos los signos disponibles
aurastral --list-signs

# Ayuda
aurastral --help
```

### Flags completos

| Flag | Alias | Descripción | Default |
|---|---|---|---|
| `--sign` | `-s` | Signo zodiacal | Interactivo |
| `--mood` | `-m` | Estado de ánimo actual | `neutral` |
| `--period` | `-p` | `day`, `week`, `month` | `day` |
| `--lang` | `-l` | `en`, `es`, `pt` | `en` |
| `--theme` | `-t` | `cosmic`, `minimal`, `retro`, `pastel` | `cosmic` |
| `--export` | `-e` | Guarda en `readings/YYYY-MM-DD.md` | `false` |
| `--no-color` | | Output sin colores (ideal para pipes) | `false` |

---

## ⚙️ Cómo funciona

```
┌─────────────────────────────────────────────────────────┐
│                    Aurastral Flow                        │
├─────────────────────────────────────────────────────────┤
│                                                          │
│  CLI Input (flags)                                       │
│       │                                                  │
│       ▼                                                  │
│  cli.rb  ──► Parsea argumentos con OptionParser          │
│       │                                                  │
│       ▼                                                  │
│  horoscope.rb  ──► Construye el prompt con:             │
│       │             · Signo + fechas zodiacales          │
│       │             · Mood del usuario                   │
│       │             · Período temporal                   │
│       │             · Idioma seleccionado                │
│       │                                                  │
│       ▼                                                  │
│  groq_client.rb  ──► POST a Groq API                    │
│       │               modelo: llama-3.3-70b-versatile    │
│       │               ~300ms response time               │
│       │                                                  │
│       ▼                                                  │
│  renderer.rb  ──► Decora el output con TTY gems         │
│       │            · Colores via pastel                  │
│       │            · Bordes via tty-box                  │
│       │            · Tema aplicado                       │
│       │                                                  │
│       ├──► Terminal output (siempre)                     │
│       └──► exporter.rb ──► readings/2025-01-14.md       │
│                            (si --export está activo)     │
└─────────────────────────────────────────────────────────┘
```

El corazón del proyecto es **`horoscope.rb`**, que construye un prompt estructurado enviado a LLaMA 3.3 70B instruyéndole a responder como un astrólogo que conoce el contexto emocional del usuario. La respuesta se parsea y se renderiza con formato visual usando la familia de gemas `tty-*`.

---

## 🌠 Temas visuales

| Tema | Descripción | Preview |
|---|---|---|
| `cosmic` | Violetas, dorados y estrellas Unicode | ✦ ♏ ★ ✧ |
| `minimal` | Solo texto, sin color, para pipes | `>` |
| `retro` | ASCII art estilo terminal de los 80s | `[*]` `===` |
| `pastel` | Colores suaves, ideal para screenshots | 🌸 💫 🌙 |

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

## 🧪 Tests

```bash
# Correr todos los tests
bundle exec rspec

# Con cobertura
bundle exec rspec --format documentation

# Solo un archivo
bundle exec rspec spec/horoscope_spec.rb
```

---

## 🗺️ Roadmap

- [ ] **v0.1** — MVP: CLI funcional con Groq + tema cosmic
- [ ] **v0.2** — Exportación Markdown + multi-idioma
- [ ] **v0.3** — Temas visuales adicionales + modo interactivo
- [ ] **v0.4** — Compatibilidad con carta natal (fecha + hora + lugar)
- [ ] **v0.5** — Distribución como gema en RubyGems.org
- [ ] **v1.0** — Plugin para Neovim 👀

---

## 🤝 Contribuciones

Las contribuciones son bienvenidas! Si quieres agregar un nuevo tema, soporte de idioma, o cualquier feature, abre un issue o un PR.

```bash
# Fork → clone → branch → commit → PR
git checkout -b feature/new-theme-nebula
```

Por favor sigue las guías de estilo de Ruby (RuboCop) y asegúrate de que los tests pasen.

---

## 📄 Licencia

MIT © 2025 — Hecho con ☕, Ruby y demasiadas horas mirando la pantalla.

---

<div align="center">

*"Not all those who wander are lost — some are just reading their terminal horoscope."*

**⭐ Dale una estrella si te gustó el proyecto**

</div>