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
