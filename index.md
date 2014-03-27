---
layout: page
title: Hello World!
tagline: Supporting tagline
---
{% include JB/setup %}

{% for post in site.posts %}
<article>
  <header>
    <h2>
        <a href="{{ post.url }}" rel="bookmark" title="Permanent link to ">{{ post.title }}</a>
    </h2>
    <h5><time>{{ post.date | date: '%B' }} {{ post.date | date: '%e' }}, {{ post.date | date: '%Y' }}</time></h5>
  </header>
  {{ post.content }}
</article>
{% endfor %}






