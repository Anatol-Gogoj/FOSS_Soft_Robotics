---
layout: page
title: Media
permalink: /media/
---

## Logos & Branding
<!-- Put PNG/SVG assets in /docs/assets/images or /docs/media -->

## Slide Decks
<!-- Upload to /docs/media or link externally -->

## Photos & Figures
<!-- Thumbnails + captions -->

## All Media Pages
<ul>
{%- assign pages = site.pages | where: "dir", "/media/" | sort: "title" -%}
{%- for p in pages -%}
  {%- unless p.url == "/media/" -%}
  <li><a href="{{ p.url | relative_url }}">{{ p.title | default: p.url }}</a></li>
  {%- endunless -%}
{%- endfor -%}
</ul>
