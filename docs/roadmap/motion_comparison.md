# Motion: Leap.nvim vs Flash.nvim

## 1. The Core Difference
*   **Leap.nvim**: "I see the target."
    *   *Mechanism*: You look at the target character pair (e.g., `st` in "const"). You press `s` + `s` + `t`. You are there.
    *   *Mental Model*: **Determinism**. 90% of the time, the jump is unique. If not, a label appears.
    *   *Cognitive Load*: Low (Reactive).
*   **Flash.nvim**: "I search for the target."
    *   *Mechanism*: You press `s`. You type the first character `c`. **Everything** with `c` on screen gets a label (`a`, `b`, `c`...). You pick the label.
    *   *Mental Model*: **Search & Select**. You don't aim at the destination's 2-char signature; you aim at the *match*.
    *   *Cognitive Load*: Medium (Active search phase).

## 2. Advanced Flash Capabilities
Flash is not just a motion plugin; it's a *general purpose label engine*.
*   **Remote Operations**: Delete a word 10 lines away without moving your cursor. (`dr` + label).
*   **Treesitter Integration**: Select a function block visually (`S` -> expands scope -> jump).
*   **Search Integration**: When you press `/`, it automatically labels matches.

## 3. Recommendation
*   **Stick with Leap** if you prioritize **Flow**. The 2-char jump becomes muscle memory (you "type" the destination).
*   **Switch to Flash** if you want **Power**. If you often look at a spot and think "I want to delete that" but strictly don't want to move your eyes to verify the 2-char context.

## 4. Why Flash is "Gamified"
Flash covers the screen in colorful labels (beacons). This can feel "Arcade-like". Leap is minimal (ghost text). For a "Cognitive Interface", Leap's minimalism is usually preferred unless you struggle with typing pairs.
