---
title: Home
---
# The Floors Before

<figure class="hero"><img src="{{ '/assets/art/season-one-cover.jpg' | relative_url }}" alt="Fan-made cover art: Carl with a spiked club, Princess Donut in a crown, a small dinosaur, and a grinning AI face over a burning city"><figcaption>AI-generated fan art, made by the Archivist's machine. Not official artwork.</figcaption></figure>

Everyone in the dungeon had a life before it. This is a fan anthology of what those lives might have been, one character per chapter, written and illustrated by fans.

## Chapters

<ul class="chapters">
{% assign chs = site.chapters | sort: "order" %}
{% for ch in chs %}
  <li><a href="{{ ch.url | relative_url }}">{{ ch.title }}</a> <span>{{ ch.character }} · by {{ ch.author }}</span></li>
{% endfor %}
</ul>

Want to write or draw one? See [how to contribute]({{ '/contribute/' | relative_url }}).
