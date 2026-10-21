---
name: share-learning
description: Distill transferable learnings from this session and, after user approval, post them as stickies to the team's Miro knowledge hub (mycelium). Use on /share-learning or "share what we learned".
---

# Share learning to the team knowledge hub

Turn this session into 1–3 learnings that a teammate on a *different* task would benefit from, and post them to the shared Miro board. This works in Claude Code and in claude.ai chat.

## Hub location

- Board: https://miro.com/app/board/uXjVEXWzxyc=/
- Hub frame: `🍄 Knowledge Hub`, id `3458764687994986893`
- Tools: the Miro connector's `canvas_read_as_svg` and `canvas_update_from_svg`. In Claude Code they are `mcp__claude_ai_Miro__*`; if they're listed only as deferred tools, load them with ToolSearch first. If no Miro tools are available at all, say that the Miro connector needs to be connected, and stop.

## Steps

1. **Who is sharing.** Use the name the user gave. Otherwise, if you have a shell, try `echo "$MYC_AUTHOR"` and then `git config user.name`. If you still don't have a name, ask.

2. **Synthesize.** Review the whole conversation so far. Pick 0–3 learnings. If the user named a focus (for example, `/share-learning the Miro frame gotcha`), stick to it.
   - Good: non-obvious facts about a system, codebase, tool, API, or data; gotchas and their fixes; decisions and why they were made; approaches that did NOT work.
   - Bad: a story of what was done, trivia, or anything that only makes sense inside this session.
   - Each claim must stand on its own: name the specific tool, system, or file, and don't use "we", "I", or "the user".
   - Give each learning a summary of at most 5 words that says the lesson itself, not just its topic ("Update, never create, existing frames", not "Miro frames"). The landing page and hub previews show only this line.
   - Zero is a valid answer. If nothing is transferable, say so and stop.

3. **Approve.** Show the drafts to the user in the exact sticky format below and ask them to approve, edit, or drop each one. Post only what they approve.

4. **Find free slots.** Read the hub frame (`canvas_read_as_svg` with `widget_ids: ["3458764687994986893"]`). Note the frame's `transform`. The grid has 4 columns at x = 40, 430, 820, 1210 and rows at y = 40 + 268·row (coordinates relative to the frame). Take the first cells not already occupied by a sticky.

5. **Post.** Make one `canvas_update_from_svg` call. Do NOT use `canvas_create_from_svg`: it creates a duplicate frame instead of adding to the existing one. Nest the new stickies, with no ids, inside the existing frame group, and copy the frame's `transform` from the read in step 4:

   ```xml
   <svg viewBox="0 0 3840 2160" xmlns="http://www.w3.org/2000/svg">
   <g data-miro-id="3458764687994986893" transform="translate(1700,-164)" data-frame="🍄 Knowledge Hub">
   <rect data-type="sticky" x="40" y="308" width="350" height="228" data-color="light_yellow"
     data-content="💡 SUMMARY&lt;br&gt;CLAIM&lt;br&gt;WHEN: ...&lt;br&gt;HOW WE KNOW: ...&lt;br&gt;TAGS: #topic #entity&lt;br&gt;BY: AUTHOR · YYYY-MM-DD" />
   </g>
   </svg>
   ```

   - Lines are separated by `&lt;br&gt;`. XML-escape `&`, `<`, `>`, `"` inside `data-content`.
   - Color: reuse the color this author already has on the board. Otherwise pick the first one not yet used by another author, in this order: `light_yellow`, `light_blue`, `light_green`, `violet`, `orange`. (`light_pink` is reserved for seed stickies.)
   - If the result says an item wasn't confirmed, re-read the frame before retrying, so you don't post duplicates.

6. **Confirm.** Tell the user what was posted, with a deep link to each sticky: `https://miro.com/app/board/uXjVEXWzxyc=/?moveToWidget=<id>`.

## Sticky format (the contract shared with search-team-knowledge)

```
💡 <summary, at most 5 words>
<1–2 sentence self-contained claim>
WHEN: <situation where this matters>
HOW WE KNOW: <error seen / test run / doc read>
TAGS: #<topic> #<entity> #<entity>
BY: <author> · <YYYY-MM-DD>
```
