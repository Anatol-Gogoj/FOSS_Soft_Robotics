---
title: Media
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
