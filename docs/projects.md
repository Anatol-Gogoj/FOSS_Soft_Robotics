---
layout: page
title: Projects
permalink: /projects/
---

Below are all project pages living under `/projects/`:

<ul>
{%- assign pages = site.pages | where_exp: "p", "p.url contains '/projects/' and p.url != '/projects/'" | sort: "title" -%}
{%- for p in pages -%}
  <li><a href="{{ p.url | relative_url }}">{{ p.title | default: p.url }}</a></li>
{%- endfor -%}
</ul>
