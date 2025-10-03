---
layout: page
title: Research
permalink: /research/
---

A collection of research notes and summaries:

<ul>
{%- assign pages = site.pages | where_exp: "p", "p.url contains '/research/' and p.url != '/research/'" | sort: "title" -%}
{%- for p in pages -%}
  <li><a href="{{ p.url | relative_url }}">{{ p.title | default: p.url }}</a></li>
{%- endfor -%}
</ul>
