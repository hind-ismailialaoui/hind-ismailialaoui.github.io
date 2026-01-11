---
layout: page
title: Publications
permalink: /publications/
---

<ul class="post-list">
  {%- for post in site.posts -%}
  <li>
    {%- assign date_format = site.minima.date_format | default: "%b %-d, %Y" -%}
    <span class="post-meta">
      {{ post.date | date: date_format }}
      [<a class="post-link-inline" href="{{ post.url | relative_url }}">{{ post.title | escape }}</a>]
    </span>
    {%- if site.show_excerpts -%}
      {{ post.excerpt }}
    {%- endif -%}
  </li>
  {%- endfor -%}
</ul>
