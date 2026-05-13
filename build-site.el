;; build-site.el — Org Mode site builder for Pawan Jangra's portfolio
;; Based on: https://systemcrafters.net/publishing-websites-with-org-mode/building-the-site/

;; Use system-installed htmlize (apt: elpa-htmlize)
;; On CI (GitHub Actions), install via: sudo apt-get install elpa-htmlize
(add-to-list 'load-path "/usr/share/emacs/site-lisp/elpa-htmlize")
(require 'htmlize nil t)  ;; soft-require: won't error if missing

;; Load the publishing system
(require 'ox-publish)

;; Custom HTML head — Simple.css + minimal overrides
(setq org-html-validation-link nil
      org-html-head-include-scripts nil
      org-html-head-include-default-style nil
      org-html-head "
<link rel=\"stylesheet\" href=\"https://cdn.simplecss.org/simple.min.css\" />
<style>
  :root {
    --accent: #2563eb;
    --accent-bg: #eff6ff;
    --bg: #ffffff;
    --text: #1e293b;
    --border: #e2e8f0;
  }
  body { font-family: 'Georgia', serif; }
  code, pre { font-family: 'Fira Code', 'Consolas', monospace; font-size: 0.9em; }
  h1, h2, h3 { font-family: 'Segoe UI', sans-serif; }
  table { width: 100%; border-collapse: collapse; }
  th { background: var(--accent-bg); }
  blockquote { border-left: 4px solid var(--accent); background: var(--accent-bg); }
  nav { margin-bottom: 1rem; }
  header { border-bottom: 2px solid var(--accent); }
</style>
")

;; Preamble shown on every page (navigation bar)
(setq org-html-preamble
      "<nav>
  <a href=\"/index.html\">Home</a> &nbsp;|&nbsp;
  <a href=\"/about.html\">About</a> &nbsp;|&nbsp;
  <a href=\"/projects.html\">Projects</a> &nbsp;|&nbsp;
  <a href=\"/skills.html\">Skills</a> &nbsp;|&nbsp;
  <a href=\"https://pawan1198.github.io/portfolio\" target=\"_blank\">Portfolio ↗</a>
</nav>")

;; Postamble (footer)
(setq org-html-postamble
      "<footer>
  <p>Pawan Jangra &middot; Research Consultant &amp; Data Analyst &middot; New Delhi, India</p>
  <p><small>Built with GNU Emacs &amp; Org Mode &mdash; %C</small></p>
</footer>")

;; Define the publishing project
(setq org-publish-project-alist
      (list
       (list "pawan-org-site"
             :recursive t
             :base-directory "./content"
             :publishing-function 'org-html-publish-to-html
             :publishing-directory "./docs"
             :with-author nil
             :with-creator nil
             :with-toc nil
             :section-numbers nil
             :time-stamp-file nil
             :html-doctype "html5"
             :html-html5-fancy t)))

;; Build!
(org-publish-all t)

(message "Build complete! Output in ./docs/")
