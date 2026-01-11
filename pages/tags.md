---
layout: default
title: Tags
permalink: /tags/
---

<div class="home">
  <h1 class="page-title page-heading">{{ page.title }}</h1>

  {%- assign all_tags = "" | split: "" -%}
  {%- for tag in site.tags -%}
    {%- assign all_tags = all_tags | push: tag[0] -%}
  {%- endfor -%}
  {%- for source in site.data.sources -%}
    {%- for tag in source.tags -%}
      {%- assign all_tags = all_tags | push: tag -%}
    {%- endfor -%}
  {%- endfor -%}
  {%- assign all_tags = all_tags | uniq | sort -%}

  <div class="tag-cloud">
    {%- for tag in all_tags -%}
      <a class="post-tag" href="#tag-{{ tag | slugify }}">{{ tag }}</a>{% unless forloop.last %}, {% endunless %}
    {%- endfor -%}
  </div>

  {%- for tag in all_tags -%}
    <h2 id="tag-{{ tag | slugify }}">{{ tag }}</h2>
    <ul class="post-list">
      {%- assign tagged_posts = site.tags[tag] -%}
      {%- if tagged_posts -%}
        {%- for post in tagged_posts -%}
          <li>
            <span class="post-meta">
              {{ post.date | date: "%b %-d, %Y" }}
              [<a class="post-link-inline" href="{{ post.url | relative_url }}">{{ post.title | escape }}</a>]
            </span>
          </li>
        {%- endfor -%}
      {%- endif -%}

      {%- for source in site.data.sources -%}
        {%- if source.tags contains tag -%}
          <li>
            <span class="post-meta">
              [<a class="post-link-inline" href="{{ source.url }}" target="_blank" rel="noopener noreferrer">{{ source.title }}</a>]
            </span>
          </li>
        {%- endif -%}
      {%- endfor -%}
    </ul>
  {%- endfor -%}
</div>
