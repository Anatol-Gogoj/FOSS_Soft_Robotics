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
