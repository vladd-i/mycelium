---
name: share-learning
description: Synthesize transferable learnings from the current Claude Code session and post them, after the user approves, as stickies in the team's Miro knowledge hub (mycelium). Use when the user runs /share-learning or asks to share, publish, or save what was learned in this session for teammates.
---

# Share learning to the team knowledge hub

Turn this session into 1–3 learnings that a teammate on a *different* task would benefit from, and post them to the shared Miro board.

## Hub location

- Board: https://miro.com/app/board/uXjVEXWzxyc=/
- Hub frame: `🍄 Knowledge Hub`, id `3458764687994986893`
- Tools: the claude.ai Miro MCP (`mcp__claude_ai_Miro__canvas_read_as_svg`, `mcp__claude_ai_Miro__canvas_update_from_svg`). If they are listed only as deferred tools, load them first with ToolSearch `select:mcp__claude_ai_Miro__canvas_read_as_svg,mcp__claude_ai_Miro__canvas_update_from_svg`.

## Steps

1. **Who is sharing.** Run `echo "$MYC_AUTHOR"`; if it's empty, use `git config user.name`; if that's empty, ask the user.

2. **Synthesize.** Review the whole conversation so far. Pick 0–3 learnings.
   - Good: non-obvious facts about a system, codebase, tool, API, or data; gotchas and their fixes; decisions and why they were made; approaches that did NOT work.
   - Bad: a story of what was done, trivia, or anything that only makes sense inside this session.
   - Each claim must stand on its own: name the specific tool, system, or file, and don't use "we", "I", or "the user".
   - Zero is a valid answer. If nothing is transferable, say so and stop.

3. **Approve.** Show the drafts to the user in the exact sticky format below and ask them to approve, edit, or drop each one. Post only what they approve.

4. **Find free slots.** Read the hub frame (`canvas_read_as_svg` with `widget_ids: ["3458764687994986893"]`). The grid has 4 columns at x = 40, 430, 820, 1210 and rows at y = 40 + 268·row (coordinates relative to the frame). Take the first cells not already occupied by a sticky.

5. **Post.** Make one `canvas_update_from_svg` call (NOT `canvas_create_from_svg`, which would create a duplicate frame). Nest the new stickies, with no ids, inside the existing frame group. Copy the frame's `transform` from the read in step 4:

   ```xml
   <svg viewBox="0 0 3840 2160" xmlns="http://www.w3.org/2000/svg">
   <g data-miro-id="3458764687994986893" transform="translate(1700,-164)" data-frame="🍄 Knowledge Hub">
   <rect data-type="sticky" x="40" y="308" width="350" height="228" data-color="light_yellow"
     data-content="💡 CLAIM&lt;br&gt;WHEN: ...&lt;br&gt;HOW WE KNOW: ...&lt;br&gt;TAGS: #topic #entity&lt;br&gt;BY: AUTHOR · YYYY-MM-DD" />
   </g>
   </svg>
   ```

   - Lines are separated by `&lt;br&gt;`. XML-escape `&`, `<`, `>`, `"` inside `data-content`.
   - Color by author: first sharer of the demo `light_yellow`, second `light_blue`, third `light_green`, others `light_pink`. If unsure, reuse the color this author already has on the board, or else pick one that isn't in use yet.
   - If the result says an item wasn't confirmed, re-read the frame before retrying, so you don't post duplicates.

6. **Confirm.** Tell the user what was posted, with a deep link to each sticky: `https://miro.com/app/board/uXjVEXWzxyc=/?moveToWidget=<id>`.

## Sticky format (the contract shared with /search-team-knowledge)

```
💡 <1–2 sentence self-contained claim>
WHEN: <situation where this matters>
HOW WE KNOW: <error seen / test run / doc read>
TAGS: #<topic> #<entity> #<entity>
BY: <author> · <YYYY-MM-DD>
```
