---
layout: default
title: Homepage
tagline: 
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
  <div class="post-entry">
        {{  post.content || split:'<!--more-->' | first }}
  </div>
  <div class="post-footer">
        <div class="read-more">
            <a href="{{ post.url }}">read more... &rarr;</a>
        </div>
    </div>
</article>
{% endfor %}






