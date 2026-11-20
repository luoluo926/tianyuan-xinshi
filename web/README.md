# Web runtime

The browser build of Tianyuan Xinshi. A single Node file serves the front end and a JSON API; the game itself is the canvas application in `public/`, running against precompiled scene data.

## Start

```bash
npm install
npm start
```

Serves <http://127.0.0.1:8080> by default. Override with environment variables:

```powershell
$env:HOST="0.0.0.0"; $env:PORT="8080"; npm start
```

`npm run start:fast` skips the precompile check; `npm run precompile` rebuilds the scene and exits.

## Precompiled scene

On boot the server checks the generated assets and rebuilds anything missing:

- 840 map tiles for map `1001`
- 818 masks
- 47 NPC sprite sources
- 17 playable character models, each with stand and walk frames

Output lands in `public/generated/` and is served as plain PNG. The client never decodes `.map` or `.was` sources at runtime.

## Storage

Accounts are stored in `data/users.json`, created on first write. Guest sessions are not persisted. Each account holds one role.

## Layout

```
server.js            HTTP server, API routes, precompile pipeline
public/index.html    Entry screen and game shell
public/app.js        Client runtime
public/styles.css    Interface styling
public/generated/    Precompiled scene, masks, sprites
tools/               Asset export helpers
data/                Runtime account storage (not tracked)
```
