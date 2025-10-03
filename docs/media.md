---
layout: page
title: Media
permalink: /media/
---

Slides, images, and downloads:

<ul>
{%- assign pages = site.pages | where_exp: "p", "p.url contains '/media/' and p.url != '/media/'" | sort: "title" -%}
{%- for p in pages -%}
  <li><a href="{{ p.url | relative_url }}">{{ p.title | default: p.url }}</a></li>
{%- endfor -%}
</ul>
