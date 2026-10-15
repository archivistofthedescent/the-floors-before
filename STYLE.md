# Style guide for The Floors Before

Every chapter should feel like it belongs next to the Dungeon Crawler Carl books, while being entirely our own writing.

## Never
- Copy or closely paraphrase text from the books, including the AI's actual lines, achievement names or chapter text.
- Contradict major canon without flagging it in the author's note as speculation or AU.

## Voice
- **First person, past tense,** told by the character whose backstory it is, as if they're finally telling someone.
- **Dark comedy with real grief underneath.** Jokes and gore sit next to genuine loss. Let the sad beats land, then undercut them, never the other way round.
- Swearing, violence and grim humour are fine at the level the books use them.
- Short punchy paragraphs. One-line paragraphs for impact. Dialogue that sounds like people under pressure.

## The System's interruptions
The System AI is the frame narrator ("the Archive"). It interrupts with block quotes in **bold**:
- Achievements: `**Achievement Unlocked: <Name>!**`, a snarky explanation, then `**Reward: ...**`.
- Notifications, death notices (`**Crawler <Name> has died.**`), status effects and loot boxes.
- Asides to "the Archivist", the reader. Gleeful, petty, a little unhinged and occasionally, accidentally, sincere.
- Use 4 to 8 interruptions per part. They should be funny, and they should also land a little cruel.
- Each part opens with an `ARCHIVE` header and closes with an `End of Part N` aside.

## Shape
- **Parts of about 2,000 to 2,500 words each.** The big three (Carl, Princess Donut, Mordecai) get 4 parts (about 9,000 words); everyone else gets 3 parts (about 6,500 words).
- Part 1: the ordinary life before, and the collapse or arrival. Part 2: the long middle, the routine and the first real loss. Part 3: the turn that made them who they are in canon. For 4-part characters, Part 4 carries the backstory right up to the edge of canon and pays off the recurring object.
- Give each backstory one concrete recurring object or phrase that pays off at the end (for Mordecai: "heat is a promise", the weak-tea colour, the tin cup).
- End with an italic author's note listing which details are invented.

## Art
- Every part gets its own image, showing a key scene from that part. No two parts share an image.
- Style: match `assets/art/season-one-cover.jpg`. It should be cinematic, gritty, fire-lit and painterly-photoreal, like a TV season poster, with the character as the hero of the frame.
- Format: square 1024x1024 or landscape 1600x900, JPEG under 500KB, saved with the same name as the part's file (for example `_chapters/002-zev-1.md` gets `assets/art/002-zev-1.jpg`). The chapter page picks it up automatically.
- Never use the official book logo or cover art. It must be labelled as AI-generated fan art (the site does this automatically).
- How to generate images on the Pi is described in `scripts/pi/ART.md`.

## Files
- File name: `NNN-character-P.md` (for example `002-zev-1.md`), where NNN is the character's release number and P is the part.
- Front matter: `title`, `character`, `author: Archivist of the Descent`, `order` (for example 2.1), `description` (one line that starts with "Dungeon Crawler Carl fan fiction."), and `tags`.
