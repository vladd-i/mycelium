# mycelium

Share what your Claude Code sessions learn with your teammates' sessions, using a Miro board as the shared knowledge hub.

- **`/share-learning`**: at the end of a session, Claude drafts 1–3 lessons that could help someone else, such as gotchas, non-obvious facts, or decisions and why they were made. You approve or edit each one, and the approved ones become stickies in the hub frame on the board.
- **`/search-team-knowledge <problem>`**: before you start on a problem, Claude reads the hub, shows what teammates have already learned that applies (with a link to each sticky), and then solves the problem with that in mind.

Knowledge hub: the `🍄 Knowledge Hub` frame on https://miro.com/app/board/uXjVEXWzxyc=/
Spec: the "1-hour demo spec (v2)" doc on the same board.

## Setup (2 minutes)

1. **Miro access:** you need edit access to the board above.
2. **Miro connector:** in Claude Code, run `/mcp` and check that **claude.ai Miro** is connected. If it isn't, connect it at claude.ai → Settings → Connectors → Miro, then restart Claude Code.
3. **Install the skills:**
   ```sh
   git clone git@github.com:vladd-i/mycelium.git
   cd mycelium && ./install.sh
   ```
   The script symlinks the skills into `~/.claude/skills/`, so they're available in every project, and running `git pull` here updates them. (You can skip this step if you only use them from inside this repo.)
4. **Your name** (optional): `export MYC_AUTHOR=yourname` in your shell profile. If it isn't set, the skills use `git config user.name`.
5. **Smoke test:** `/search-team-knowledge why do our tests fail overnight` should find the seeded sticky about the staging database.

## Sticky format

Both skills read and write this format. You can also add stickies to the hub by hand: they're picked up even if they don't follow the format.

```
💡 <1–2 sentence self-contained claim>
WHEN: <situation where this matters>
HOW WE KNOW: <error seen / test run / doc read>
TAGS: #<topic> #<entity>
BY: <author> · <YYYY-MM-DD>
```

## Layout

```
.claude/skills/share-learning/SKILL.md          # capture: session → approved stickies on the board
.claude/skills/search-team-knowledge/SKILL.md   # retrieval: board → relevant learnings → solve
install.sh                                      # symlink skills into ~/.claude/skills
```
