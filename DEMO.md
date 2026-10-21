# Demo: "The duplicate-frame trap" (5 minutes)

**The story.** While building mycelium, A's Claude tried to add a sticky to an existing Miro frame with `canvas_create_from_svg`. Miro quietly created a **second frame with the same name** and put the sticky there. The fix is to use `canvas_update_from_svg` and target the existing frame by its id and `transform`. This really happened today, and it is exactly the kind of gotcha that every teammate's Claude would otherwise hit again.

We show A capturing it in Claude Code, and B (in **claude.ai chat**, with no Claude Code) avoiding it on a *different* task.

## Cast

| Role | Where | Does |
|---|---|---|
| **A** | Claude Code, the session where the gotcha happened | `/share-learning` |
| **B** | claude.ai chat, with the Miro connector and both skills uploaded | asks for retro action items on the board |
| **C** | Miro, in the browser | drives the big screen; adds a handwritten sticky |

## Prep (do it now, about 10 minutes)

1. **B:** finish the claude.ai setup in the [README](README.md#using-the-skills-in-claudeai-chat-no-claude-code). Check that the Miro connector is on in B's chat.
2. **C:** on the board, create a frame named **`Sprint Retro`** below the 🍄 Knowledge Hub, and add 2 stickies: "Went well: shipped onboarding early" and "Didn't go well: flaky e2e tests blocked two releases".
3. **A:** keep the session open in which the duplicate-frame bug happened. If it's gone, start a new Claude Code session and re-tell the story in 2–3 messages (or paste the paragraph above) before running `/share-learning`.
4. **Rehearse once**, then **delete A's rehearsal sticky** from the hub so the live post is the first one.

## On stage

1. **C — set the scene (30 s).** Big screen on the board. "This frame is our team's memory. Every sticky is something one person's Claude learned that the others' Claude can reuse."
2. **A — capture (90 s).** In Claude Code:
   ```
   /share-learning the Miro duplicate-frame gotcha
   ```
   Claude drafts the learning. A reads it out, approves it, and **a yellow sticky appears live on the big screen.**
3. **B — retrieve (2 min).** In claude.ai chat:
   > Check our team knowledge first, then add three action-item stickies for the flaky e2e tests into the existing **Sprint Retro** frame on https://miro.com/app/board/uXjVEXWzxyc=/

   Expected: Claude opens with **"🍄 From the team knowledge hub: A found that canvas_create_from_svg creates a duplicate frame…"**, then uses `canvas_update_from_svg`. The 3 stickies land **inside the existing Sprint Retro frame**, with no duplicate frame. C points at the board.
4. **C — humans in the loop (30 s, optional).** Add a sticky by hand to the hub: "Flaky e2e tests: the staging DB resets nightly; run e2e after 03:00 UTC". B asks: "check team knowledge: why are our e2e tests flaky?" Both the handwritten sticky and the seed sticky come back.
5. **Close (30 s).** "Two skills, one Miro board, no backend. It works in Claude Code and in claude.ai. Next steps (see the original spec): automatic capture on session end, automatic recall on every prompt, and corroboration and contradiction links."

## If something breaks

- **A's share fails:** say "here's one A posted earlier" and point at the board. Step 3 still works as long as the learning is on the board, so post it during rehearsal and *don't* delete it if you're short on time.
- **B's Claude doesn't open the hub:** say "use the search-team-knowledge skill" explicitly. If the skill doesn't load at all, paste the contents of `.claude/skills/search-team-knowledge/SKILL.md` into the chat.
- **The Miro connector is slow:** narrate while it runs. Claude reading the whole hub frame takes about 5–10 s.
