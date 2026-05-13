# Pawan Jangra — Org Mode Portfolio Site

A simple personal portfolio/research site built with **GNU Emacs Org Mode**,
published as static HTML, and auto-deployed to GitHub Pages via GitHub Actions.

## Tech Stack

- Content: [Org Mode](https://orgmode.org/) (`.org` files)
- Build: `emacs -Q --script build-site.el`
- Styling: [Simple.css](https://simplecss.org/) + custom overrides
- Deploy: GitHub Actions → GitHub Pages

## Local Build

```sh
# Requires Emacs (>= 24.5)
chmod +x build.sh
./build.sh
# Output: ./public/
```

Then open `public/index.html` in your browser.

## Project Structure

```
.
├── content/           # Org source files
│   ├── index.org      # Homepage
│   ├── about.org      # About page
│   ├── projects.org   # Projects page
│   └── skills.org     # Skills & tools page
├── public/            # Generated HTML (git-ignored)
├── build-site.el      # Emacs Lisp build script
├── build.sh           # Shell wrapper
└── .github/
    └── workflows/
        └── deploy.yml # GitHub Actions CI/CD
```

## Deployment

Push to `main` → GitHub Actions builds the site → deploys to GitHub Pages.

**Setup steps:**
1. Create a new GitHub repo (e.g. `pawan-org-site`)
2. Push this folder to `main`
3. Go to **Settings → Pages → Source → GitHub Actions**
4. Done — your site will be live at `https://<username>.github.io/<repo>/`

## Adding Content

Edit any `.org` file in `content/` and push. The workflow handles the rest.
To add a new page, create a new `.org` file and link to it from `index.org`.
