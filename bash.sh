#!/usr/bin/env bash
set -euo pipefail

echo "🔧 Ensuring GitHub Pages uses /docs with Jekyll Minima + top nav"

# 1) Remove root-level Pages config that causes README-only site
if [ -f _config.yml ]; then
  echo "• Removing root _config.yml (conflicts with /docs site)"
  git rm -f _config.yml || true
fi
if [ -f index.md ]; then
  echo "• Removing root index.md (conflicts with /docs site)"
  git rm -f index.md || true
fi

# 2) Create/refresh the Jekyll site in /docs
mkdir -p docs/{_posts,assets/{images,downloads}}

cat > docs/_config.yml <<'YML'
title: "FOSS Soft Robotics"
description: "Free & open resources for soft robotics."
theme: minima
# Important for project sites:
url: "https://anatol-gogoj.github.io"
baseurl: "/FOSS_Soft_Robotics"

# Show these as top navigation tabs:
header_pages:
  - about.md
  - projects.md
  - research.md
  - blog.md
  - media.md
  - contact.md

markdown: kramdown
kramdown:
  input: GFM
YML

cat > docs/index.md <<'MD'
---
layout: home
title: Home
---

Welcome! Use the tabs above to explore **Projects**, **Research**, **Blog**, **Media**, and **Contact**.
MD

cat > docs/about.md <<'MD'
---
layout: page
title: About
permalink: /about/
---

## Mission
<!-- Why FOSS for soft robotics? -->
MD

cat > docs/projects.md <<'MD'
---
layout: page
title: Projects
permalink: /projects/
---

## All Projects
<ul>
{%- assign pages = site.pages | where: "dir", "/projects/" | sort: "title" -%}
{%- for p in pages -%}
  {%- unless p.url == "/projects/" -%}
  <li><a href="{{ p.url | relative_url }}">{{ p.title | default: p.url }}</a></li>
  {%- endunless -%}
{%- endfor -%}
</ul>
MD

mkdir -p docs/projects
cat > docs/projects/example.md <<'MD'
---
layout: page
title: Example Project
---

## Summary
A placeholder project page. Add more in `docs/projects/`.
MD

cat > docs/research.md <<'MD'
---
layout: page
title: Research
permalink: /research/
---

## Notes & Summaries
<ul>
{%- assign pages = site.pages | where: "dir", "/research/" | sort: "title" -%}
{%- for p in pages -%}
  {%- unless p.url == "/research/" -%}
  <li><a href="{{ p.url | relative_url }}">{{ p.title | default: p.url }}</a></li>
  {%- endunless -%}
{%- endfor -%}
</ul>
MD

mkdir -p docs/research
cat > docs/research/example.md <<'MD'
---
layout: page
title: Example Research Note
---

A placeholder research note. Add more in `docs/research/`.
MD

cat > docs/blog.md <<'MD'
---
layout: page
title: Blog
permalink: /blog/
---

## Latest Posts
<ul>
{%- for post in site.posts -%}
  <li><a href="{{ post.url | relative_url }}">{{ post.title }}</a> <small>— {{ post.date | date: "%Y-%m-%d" }}</small></li>
{%- endfor -%}
</ul>
MD

cat > docs/_posts/2025-10-02-welcome.md <<'MD'
---
title: "Welcome to FOSS Soft Robotics"
---

We’re setting up the content skeleton—projects, research notes, media, and more.
MD

cat > docs/media.md <<'MD'
---
layout: page
title: Media
permalink: /media/
---

## All Media Pages
<ul>
{%- assign pages = site.pages | where: "dir", "/media/" | sort: "title" -%}
{%- for p in pages -%}
  {%- unless p.url == "/media/" -%}
  <li><a href="{{ p.url | relative_url }}">{{ p.title | default: p.url }}</a></li>
  {%- endunless -%}
{%- endfor -%}
</ul>
MD

mkdir -p docs/media
cat > docs/media/example.md <<'MD'
---
layout: page
title: Example Media Item
---

Drop slides/images into `docs/media/` or `docs/assets/`.
MD

cat > docs/contact.md <<'MD'
---
layout: page
title: Contact
permalink: /contact/
---

- Open a GitHub Issue (preferred for bugs/features)
- Email: <!-- add -->
MD

echo "✅ Files ready."

echo
echo "Next steps:"
echo "  1) git add -A && git commit -m 'fix(pages): use /docs + minima, add nav tabs' && git push"
echo "  2) In GitHub → Settings → Pages:"
echo "       • EITHER set Source = Deploy from a branch → Branch: V0.2-Content, Folder: /docs"
echo "       • OR keep 'GitHub Actions' but ensure the Pages workflow builds from ./docs"
echo "  3) Open: https://anatol-gogoj.github.io/FOSS_Soft_Robotics/?bust=$(date +%s)"

