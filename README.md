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

## Using the skills in claude.ai chat (no Claude Code)

The same skills run in claude.ai. You don't need Claude Code or a terminal.

1. **Turn on code execution:** claude.ai → Settings → Capabilities → enable **Code execution and file creation** (skills need it). On Team or Enterprise plans, an org admin may need to allow skills first.
2. **Upload the skills:** download [`dist/share-learning.zip`](dist/share-learning.zip) and [`dist/search-team-knowledge.zip`](dist/search-team-knowledge.zip) from this repo (open the file on GitHub → **Download raw file**). Then go to claude.ai → Settings → Capabilities → **Skills** → **Upload skill**, once for each zip. Don't unzip them.
3. **Connect Miro:** claude.ai → Settings → Connectors → **Miro** → Connect, signing in with the account that has access to the board. In a new chat, check that Miro is turned on in the tools menu.
4. **Use them by asking.** In claude.ai, skills load based on what you ask, not on slash commands:
   - "Check our team knowledge first: <problem>"
   - "Share what we learned in this chat to the team hub"

Fallback if you can't upload skills: create a Project and paste the body of each `SKILL.md` into the project instructions.

## Updating the skills

Edit `.claude/skills/*/SKILL.md`, then run `./package.sh` and commit the rebuilt `dist/*.zip`. Claude Code users get the change with `git pull`. claude.ai users have to re-upload the zips.

## Sticky format

Both skills read and write this format. You can also add stickies to the hub by hand: they're picked up even if they don't follow the format.

```
💡 <summary, at most 5 words>
<1–2 sentence self-contained claim>
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
package.sh                                      # build dist/*.zip for claude.ai upload
dist/                                           # prebuilt zips for claude.ai
DEMO.md                                         # 5-minute demo scenario
```
