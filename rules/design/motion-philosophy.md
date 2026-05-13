> This file extends [web/design-quality.md](../web/design-quality.md) with motion-specific standards.

# Motion Philosophy System

> A motion language specification for an AI-native enterprise visualization platform.
> Treat motion as infrastructure, not decoration.

## 1. Motion Philosophy

Motion is a communication layer, not a visual garnish.

Every animation in the system exists to serve one or more of the following:

| Intent | Description |
|--------|-------------|
| **State signaling** | Motion communicates what the system is doing. A panel loading should look different from a panel arriving. |
| **Spatial continuity** | Objects do not teleport. They travel. Motion preserves spatial memory so users always know where things went. |
| **Hierarchy reinforcement** | More important elements move with more authority. Less important elements move quietly or not at all. |
| **Cognitive load reduction** | Motion smooths abrupt state changes. A hard cut forces reorientation; a transition guides the eye. |
| **Atmospheric grounding** | Subtle ambient motion makes static dashboards feel alive without demanding attention. |

Motion is calm, controlled, and intentional. If a user notices an animation for its own sake, it is probably too much.

## 2. Core Motion Principles

| Principle | Rule |
|-----------|------|
| **Low-frequency animation** | The system should spend >80% of its time visually still. Motion is an event, not a background condition. |
| **Purposeful motion only** | Every animation answers "what changed and why." Decorative movement is forbidden. |
| **Spatial depth** | Z-axis is a first-class design dimension. Panels float, backgrounds recede, overlays advance. Motion communicates this hierarchy. |
| **Stable layouts** | Layouts do not reflow during motion. Panels slide, fade, scale — they do not push neighbors around unless the reflow is the intended communication. |
| **Calm transitions** | State transitions feel like a dimmer switch, not a light switch. Changes are eased, not instant, unless they are critical alerts. |
| **Hierarchy-aware animation** | High-priority UI (modals, alerts) moves with more presence. Low-priority UI (secondary panels, tooltips) moves quietly. Intensity maps to importance. |
| **One motion at a time** | When multiple elements need to transition, stagger them. Do not animate everything simultaneously. Sequential motion guides the eye. |
| **Motion budget** | A single interaction should trigger at most 3 concurrent animations. More than that is noise. |

## 3. Motion Hierarchy

Five layers, ordered by visual priority. Higher layers may interrupt lower ones; lower layers must never compete with higher ones.

| Layer | Name | Intensity | Example |
|-------|------|-----------|---------|
| **L0** | Background | 0.05–0.1 opacity drift | Gradient shift, grid drift |
| **L1** | Ambient | Subtle, looping | Particle drift, glow breathing, scanlines |
| **L2** | Panel transitions | Medium, user-initiated | Panel open/close, sidebar expand/collapse |
| **L3** | Interactive feedback | Fast, immediate | Hover, click, drag, tooltip appear |
| **L4** | Critical attention | High, interruptive | Error shake, success pulse, AI thinking indicator |

**Rules:**

- L0 and L1 are always running but never demand focus.
- L2 and L3 are user-triggered and must feel responsive.
- L4 overrides all other layers — it is the system saying "look here now."
- L4 animations are short (under 600ms total) to avoid fatigue.
- L0/L1 opacity must never exceed 0.15 on any animated property.

## 4. Duration System

All durations are in milliseconds. Use design tokens, never hardcode.

| Token | Range | Use Case |
|-------|-------|----------|
| `instant` | 0ms | Critical state changes, cursor changes, focus rings |
| `fast` | 100–150ms | Hover, micro-feedback, tooltip appear/disappear |
| `medium` | 200–300ms | Panel open/close, dropdown, accordion, navigation transitions |
| `slow` | 400–600ms | Modal enter/exit, page transitions, AI response streaming reveal |
| `ambient` | 2000–8000ms | Background gradients, particle drift, glow breathing, holographic layers |

**Rules:**

- No animation exceeds 800ms unless it is ambient.
- No ambient animation runs faster than 2000ms.
- Exit transitions are 20–30% faster than enter transitions of the same element.
- Stagger delay between sibling elements: 40–80ms.

## 5. Easing System

| Token | Cubic Bezier | Use Case |
|-------|-------------|----------|
| `ease-out-expo` | `cubic-bezier(0.16, 1, 0.3, 1)` | Default enter transitions, panel arrivals, modal opens |
| `ease-out-quart` | `cubic-bezier(0.25, 1, 0.5, 1)` | Interactive feedback, hover, button states |
| `ease-in-out-sine` | `cubic-bezier(0.37, 0, 0.63, 1)` | Ambient motion, breathing effects, gradient shifts |
| `ease-out-cubic` | `cubic-bezier(0.33, 1, 0.68, 1)` | Cinematic reveals, hero section entrances |
| `ease-in-quart` | `cubic-bezier(0.5, 0, 0.75, 0)` | Exit transitions, panel dismissal, fade out |
| `linear` | `linear` | Only for L0 ambient background effects (gradients, scanlines) |

**Forbidden easing:**

- `ease-out-back` / `back` — cartoon overshoot
- `ease-out-elastic` / `elastic` — spring bounce
- `ease-out-bounce` / `bounce` — playful/childish
- `cubic-bezier` values with overshoot (any value > 1.0 or < 0 on the y-axis control points)
- `steps()` — mechanical/jarring, unless specifically used for scanline or glitch effects

**Cinematic easing rule:** Enter animations start fast and decelerate (ease-out). Exit animations start slow and accelerate (ease-in). This mimics how physical objects move under intention.

## 6. Component Motion Standards

### Panels

| Aspect | Rule |
|--------|------|
| Enter | Slide 12px + fade in, `ease-out-expo`, 300ms |
| Exit | Fade out + scale 0.98, `ease-in-quart`, 200ms |
| Reorder | Layout animation via FLIP, 300ms |
| Forbidden | Bounce, overshoot, rotate, color shift on enter/exit |
| Intensity | L2 |

### KPI Cards

| Aspect | Rule |
|--------|------|
| Initial render | Fade in + subtle Y lift (8px), staggered 60ms |
| Value update | Number roll animation, 600ms, ease-out |
| Threshold breach | Subtle glow pulse (1 cycle), no movement |
| Forbidden | Scale bounce, card flip, color flash |
| Intensity | L2-L3 |

### Charts

| Aspect | Rule |
|--------|------|
| Initial render | Bars/lines draw left-to-right or bottom-to-top, 400ms staggered by series |
| Data update | Old values crossfade to new, axis labels slide 4px |
| Hover | Series highlight via opacity shift (0.4 → 1.0), no movement |
| Forbidden | Chart spinning, explosive entry, rainbow color cycling |
| Intensity | L2 |

### Tables

| Aspect | Rule |
|--------|------|
| Row appear | Fade in + 4px Y, staggered 30ms per row |
| Row delete | Fade out + collapse height, 200ms |
| Sort | Values crossfade, column header slides 4px with chevron rotation (15deg) |
| Forbidden | Row bounce, full table re-render flash |
| Intensity | L2 |

### Modals

| Aspect | Rule |
|--------|------|
| Enter | Backdrop fade 150ms, then modal scale 0.96→1.0 + fade, `ease-out-expo`, 300ms |
| Exit | Modal fade + scale 1.0→0.98, backdrop fade, 200ms |
| Focus trap | Focus ring appears instantly, no animation |
| Forbidden | Modal slide from edge, bounce, rotate |
| Intensity | L3-L4 |

### Hover States

| Aspect | Rule |
|--------|------|
| Default | Glow border fade-in (40ms), background opacity shift 0→0.04, 100ms |
| Elevated elements | Y lift 2px + shadow deepen, 150ms |
| Forbidden | Scale change > 1.02, rotation, color shift |
| Intensity | L3 |

### Navigation

| Aspect | Rule |
|--------|------|
| Active indicator | Smooth slide to new position, `ease-out-expo`, 200ms |
| Expand/collapse | Height animation via content measurement, 250ms |
| Page transition | Crossfade 150ms, optional 8px Y shift |
| Forbidden | Swipe gestures, spring navigation, parallax scrolling |
| Intensity | L2-L3 |

### Sidebars

| Aspect | Rule |
|--------|------|
| Expand | Width animation with content fade-in, `ease-out-expo`, 300ms |
| Collapse | Content fade-out first, then width collapse, 250ms |
| Forbidden | Overlay slide without backdrop, content jump |
| Intensity | L2 |

### Tooltips

| Aspect | Rule |
|--------|------|
| Appear | Fade + 4px Y, 100ms, `ease-out-quart` |
| Disappear | Fade only, 80ms |
| Follow cursor | Disabled — tooltips are anchored, not cursor-following |
| Forbidden | Bounce, rotate, scale pop-in |
| Intensity | L3 |

### Notifications

| Aspect | Rule |
|--------|------|
| Enter | Slide from top-right 12px + fade, `ease-out-expo`, 250ms |
| Exit | Fade + slide right 12px, `ease-in-quart`, 200ms |
| Auto-dismiss | 4000ms, then exit animation |
| Forbidden | Shake, bounce, flash |
| Intensity | L3-L4 |

### AI Chat Interfaces

| Aspect | Rule |
|--------|------|
| Message appear | Fade + 8px Y, 250ms, `ease-out-expo` |
| Streaming text | Character-by-character reveal, 20–30ms per character, no animation on individual chars |
| Thinking state | Subtle dot pulse (3 dots, 800ms cycle), `ease-in-out-sine` |
| Tool execution | Small indicator expands from 4px→8px circle, fade in/out, 200ms |
| Response complete | Subtle border glow (1 cycle), 400ms |
| Forbidden | Typewriter sound effects, flashy cursor animations, bouncing dots |
| Intensity | L2-L4 |

### Loading States

| Aspect | Rule |
|--------|------|
| Skeleton | Shimmer gradient sweep left-to-right, 1200ms cycle, `linear` |
| Spinner | Single ring, 800ms rotation, `linear`, max 20px diameter |
| Page load | Skeleton preserves layout, content crossfades into place, 200ms |
| Forbidden | Full-screen spinners, loading overlays that block interaction, rainbow loaders |
| Intensity | L2 |

## 7. AI Native Motion Rules

AI interactions require motion patterns that communicate non-human agency — the system is thinking, processing, deciding.

### Streaming Response

- Text appears character by character (20–30ms/char) OR in word-sized chunks (50–80ms/word).
- No cursor blink — use a subtle fade-in per chunk.
- The message container does not jump; use `layout` smoothing to grow the container as content arrives.
- Streaming indicator (small pulse) is visible only during streaming, fades out 200ms after completion.

### Thinking State

- Three-dot pulse: dots fade in sequence (left→center→right), 800ms cycle.
- Opacity range: 0.3–0.7. Never reaches 1.0 — thinking is background activity.
- Accompanying container has subtle opacity breathing (0.95→1.0, 2s cycle).
- If thinking exceeds 5s, add a secondary indicator: "still thinking..." text fades in after 5s.

### Skeleton Strategy

- Skeletons preserve the exact layout of the final content.
- Shimmer direction matches reading direction (left-to-right for LTR locales).
- Skeleton-to-content transition is a crossfade, not a hard swap.
- Skeleton opacity: 0.06–0.12. Subtle, not glaring.

### Progressive Rendering

- High-priority content (primary KPI, main chart) renders first with motion.
- Secondary content follows with stagger (100–200ms delay).
- Low-priority content (footnotes, secondary stats) fades in without positional animation.
- Total render sequence should not exceed 1500ms from first paint to complete.

### Tool Execution Feedback

- When AI calls a tool: small indicator appears near the message (4px circle → 8px).
- Tool name appears as a compact pill, fades in 150ms.
- Tool result appears with a subtle divider line that draws left-to-right (200ms).
- Success: green border flash (1 cycle, 300ms). Failure: amber border flash (1 cycle, 300ms).

### AI Confidence Feedback

- High confidence: subtle checkmark fade-in beside response, 150ms.
- Low confidence: subtle disclaimer badge slides in from right, 200ms.
- No color flashing or dramatic indicators — confidence is information, not alarm.

### Retry / Failure Transitions

- Error state: content area fades to error state, 200ms.
- Error icon appears with subtle scale 0.9→1.0, 150ms.
- No shake, no flash, no red screen — errors are handled calmly.
- Retry button appears with 100ms delay after error content.

## 8. Dashboard Ambient Motion

Ambient motion gives static dashboards a living, breathing quality. It operates at the edge of perception.

### Background Gradients

- Two to three color stops, slowly shifting positions.
- Cycle time: 8000–15000ms.
- Opacity change per cycle: < 0.08.
- Color shift delta: < 10 lightness units in OKLCH.
- Gradient stops move, colors do not cycle through the spectrum.

### Particle Drift

- Maximum 15 visible particles at any time.
- Size: 1–3px, opacity 0.05–0.1.
- Movement: linear or near-linear drift, 10000–20000ms per traversal.
- No attraction, no repulsion, no clustering behavior.
- Particles fade in/out at edges, never pop into existence.

### Scanlines

- Optional overlay, opacity 0.02–0.04.
- Static or extremely slow vertical drift (1px per 500ms).
- No horizontal movement.
- Disable on reduced motion preference.

### Glow Breathing

- Applied to active panels or AI indicators only.
- Opacity oscillation: 0.6–1.0 on the glow layer.
- Cycle: 2000–4000ms, `ease-in-out-sine`.
- Never applied to text or data elements.
- Glow radius changes < 4px during the cycle.

### Grid Movement

- Background grid (if present) shifts imperceptibly.
- Maximum movement: 2px per axis over 10000ms.
- Grid opacity: 0.03–0.06.
- Only visible on close inspection.

### Holographic Layers

- Optional layered transparency effect on hero panels.
- 2–3 layers with slight parallax offset (1–2px).
- Opacity per layer: 0.05–0.1.
- Movement synced to ambient cycle (4000–8000ms).
- Disabled on low-performance devices.

### Ambient Rules

| Rule | Detail |
|------|--------|
| Opacity cap | No ambient element exceeds 0.15 opacity |
| Motion cap | No ambient element moves > 4px from its origin |
| Color cap | Ambient colors are desaturated variants of the palette |
| Performance cap | Total ambient CPU cost < 2% frame budget |
| Reduced motion | All ambient motion disables when `prefers-reduced-motion: reduce` |

## 9. Hover Philosophy

Hover is a whisper, not a shout.

| Principle | Rule |
|-----------|------|
| **Glow-first** | Primary hover feedback is a subtle border/element glow fade-in (100ms). Movement is secondary. |
| **No aggressive movement** | Hover movement is capped at 4px translation or 1.02 scale. Nothing larger. |
| **Stable layout** | Hover never changes the layout. No reflow, no push, no overlap (except intentional overlays). |
| **Immediate response** | Hover feedback starts within 50ms of pointer entry. If the animation is 150ms, it starts immediately — no delay. |
| **Graceful exit** | Hover exit is 50% faster than hover enter. Users should not wait for hover to unwind. |
| **Touch parity** | On touch devices, hover effects are replaced by active/pressed states. No hover-only information. |
| **Keyboard parity** | Focus-visible triggers the same visual treatment as hover. No keyboard user sees less feedback. |

### Hover Intensity Scale

| Element Type | Glow Intensity | Movement | Duration |
|-------------|---------------|----------|----------|
| Data cells | None | None | N/A |
| Secondary buttons | 0.03 opacity | None | 100ms |
| Primary buttons | 0.06 opacity | 1px Y lift | 100ms |
| Cards / panels | 0.08 opacity + 2px shadow | 2px Y lift | 150ms |
| Navigation items | Active indicator slide | None | 200ms |

## 10. Loading Philosophy

Loading is a state to be managed, not a moment to be decorated.

| Principle | Rule |
|-----------|------|
| **Never freeze** | The UI always responds to input, even during loading. Buttons enter disabled state instantly; they do not ignore clicks. |
| **Preserve layout** | Skeleton screens match the final layout pixel-for-pixel. No layout shift when content arrives. |
| **Reassure users** | Show what is loading, not that something is loading. "Loading revenue data" > spinning circle. |
| **Show system activity** | When multiple things load, show progress per item, not a single global spinner. |
| **Avoid blank states** | Never show a blank page during navigation. Show skeleton immediately, crossfade content in. |
| **Timeout gracefully** | After 5000ms of loading, show a "still loading" message. After 15000ms, show retry options. |
| **Optimistic where safe** | For non-destructive actions (navigation, filter), show the target state immediately with loading indicators. |

## 11. Forbidden Motion Patterns

The following patterns are explicitly banned from all surfaces. These are not "avoid when possible" — they are **not allowed**.

| Pattern | Why |
|---------|-----|
| **Flashing neon** | Causes eye strain, triggers photosensitive epilepsy, reads as cheap. |
| **Excessive looping** | Ambient loops should be imperceptible. If a user can see the loop, it is too fast or too strong. |
| **Spinning dashboards** | Dashboard elements do not spin. Ever. |
| **Bouncing cards** | Bounce implies playfulness. Enterprise data is not playful. |
| **Aggressive parallax** | Parallax > 2px offset is disorienting on data-heavy pages. |
| **Rainbow effects** | Color cycling, gradient rainbows, hue shifts — all banned. Color changes are intentional and discrete. |
| **Hyperactive animations** | Any animation with duration < 80ms or intensity that demands attention is forbidden. |
| **Chaotic movement** | Elements must move on predictable paths (straight lines, simple curves). No random, jittery, or erratic motion. |
| **Motion noise** | When >3 elements animate simultaneously, it is noise. Stagger or eliminate. |
| **Spinners > 30px** | Loading indicators are compact. Large spinners read as "something is wrong." |
| **Entrance + exit on same element in < 1s** | Flicker. If an element appears and disappears rapidly, use a different UX. |
| **Sound + motion combos** | No sound effects paired with motion. Ever. |
| **Confetti / celebration animations** | Banned in enterprise context. |
| **3D card flips** | Banned. Data does not have a "back." |

## 12. Motion Token System

Engineering-ready tokens. Implement in your design token system.

### Duration Tokens

```typescript
export const motionDuration = {
  instant:   0,       // Critical state changes
  fast:      120,     // Hover, micro-feedback
  medium:    250,     // Panel transitions, dropdowns
  slow:      500,     // Modal enter/exit, page transitions
  ambient:   4000,    // Background gradients, glow breathing
  ambientMax: 15000,  // Maximum ambient cycle time
  skeleton:  1200,    // Shimmer cycle
  thinking:  800,     // AI thinking pulse cycle
  streaming: 25,      // ms per character during streaming
} as const;
```

### Easing Tokens

```typescript
export const motionEasing = {
  enter:        [0.16, 1, 0.3, 1],    // ease-out-expo
  feedback:     [0.25, 1, 0.5, 1],    // ease-out-quart
  ambient:      [0.37, 0, 0.63, 1],   // ease-in-out-sine
  cinematic:    [0.33, 1, 0.68, 1],   // ease-out-cubic
  exit:         [0.5, 0, 0.75, 0],    // ease-in-quart
  linear:       [0, 0, 1, 1],         // linear (ambient backgrounds only)
} as const;
```

### Opacity Tokens

```typescript
export const motionOpacity = {
  ambientMin:    0.02,
  ambientMax:    0.15,
  hoverGlow:     0.06,
  hoverGlowMax:  0.10,
  skeleton:      0.08,
  shimmer:       0.12,
  thinking:      0.5,
  thinkingMin:   0.3,
  thinkingMax:   0.7,
  backdrop:      0.5,
  tooltip:       0.95,
} as const;
```

### Glow Pulse Tokens

```typescript
export const motionGlow = {
  radius:      8,       // px, max glow spread
  pulseDelta:  4,       // px oscillation during breathing
  duration:    3000,    // ms per glow cycle
  opacity:     0.08,    // base glow opacity
  maxOpacity:  0.15,    // peak glow opacity
} as const;
```

### Hover Intensity Tokens

```typescript
export const motionHover = {
  none: {
    movement: 0,
    scale: 1.0,
    glow: 0,
    duration: 0,
  },
  subtle: {
    movement: 1,     // px
    scale: 1.0,
    glow: 0.03,
    duration: 100,   // ms
  },
  standard: {
    movement: 2,     // px
    scale: 1.0,
    glow: 0.06,
    duration: 150,   // ms
  },
  elevated: {
    movement: 4,     // px
    scale: 1.01,
    glow: 0.10,
    duration: 200,   // ms
  },
} as const;
```

### Transition Distance Tokens

```typescript
export const motionDistance = {
  xxs: 2,    // px, ambient drift
  xs:  4,    // px, tooltip offset
  sm:  8,    // px, panel enter, message appear
  md:  12,   // px, notification slide
  lg:  24,   // px, hero entrance (rare)
} as const;
```

### CSS Custom Properties

```css
:root {
  /* Duration */
  --motion-instant:    0ms;
  --motion-fast:       120ms;
  --motion-medium:     250ms;
  --motion-slow:       500ms;
  --motion-ambient:    4000ms;
  --motion-skeleton:   1200ms;
  --motion-thinking:   800ms;
  --motion-streaming:  25ms;

  /* Easing */
  --ease-enter:        cubic-bezier(0.16, 1, 0.3, 1);
  --ease-feedback:     cubic-bezier(0.25, 1, 0.5, 1);
  --ease-ambient:      cubic-bezier(0.37, 0, 0.63, 1);
  --ease-cinematic:    cubic-bezier(0.33, 1, 0.68, 1);
  --ease-exit:         cubic-bezier(0.5, 0, 0.75, 0);

  /* Distance */
  --motion-xs:         4px;
  --motion-sm:         8px;
  --motion-md:         12px;
  --motion-lg:         24px;

  /* Opacity */
  --motion-ambient-max:  0.15;
  --motion-hover-glow:   0.06;
  --motion-skeleton:     0.08;
  --motion-thinking:     0.5;

  /* Glow */
  --glow-radius:       8px;
  --glow-pulse-delta:  4px;
  --glow-duration:     3000ms;
  --glow-opacity:      0.08;
}
```

## 13. Framer Motion Best Practices

If using Framer Motion (or equivalent animation library):

### AnimatePresence

- Wrap all mount/unmount transitions with `AnimatePresence`.
- Use `mode="popLayout"` for overlapping panel transitions.
- Set `initial={false}` on page-level routes to skip animation on first load.

```tsx
<AnimatePresence mode="popLayout">
  {isVisible && (
    <motion.div
      initial={{ opacity: 0, y: 8 }}
      animate={{ opacity: 1, y: 0 }}
      exit={{ opacity: 0, y: -4, scale: 0.98 }}
      transition={{ duration: 0.25, ease: [0.16, 1, 0.3, 1] }}
    />
  )}
</AnimatePresence>
```

### Stagger

- Use `transition.staggerChildren` for list animations.
- Stagger delay: 40–80ms. Never exceed 100ms between siblings.
- Total staggered sequence should not exceed 1500ms.

```tsx
const container = {
  transition: { staggerChildren: 0.06, delayChildren: 0.1 }
};
```

### Lazy Motion

- Use `whileInView` for below-the-fold content.
- Set viewport margin to trigger 50px before element enters.
- Do not animate above-the-fold content with `whileInView` — it is already visible.

```tsx
<motion.div
  whileInView={{ opacity: 1, y: 0 }}
  initial={{ opacity: 0, y: 8 }}
  viewport={{ once: true, margin: "0px 0px -50px 0px" }}
/>
```

### Layout Animation

- Use `layout` for FLIP-based reordering.
- Set `layoutId` for shared element transitions across route changes.
- Use `transition={{ layout: { duration: 0.3 } }}` for layout animations.
- Avoid `layout` on elements that change size frequently (tables, charts).

```tsx
<motion.div layout transition={{ layout: { duration: 0.3, ease: "easeInOut" } }}>
```

### Reduced Motion Support

- Wrap all motion components with `useReducedMotion` hook.
- When reduced motion is active: replace all animations with instant opacity changes.
- Disable ambient layers entirely.
- Preserve hover focus/active states (these are not motion, they are interaction).

```tsx
const shouldReduceMotion = useReducedMotion();

<motion.div
  transition={shouldReduceMotion ? { duration: 0 } : { duration: 0.25, ease: [0.16, 1, 0.3, 1] }}
/>
```

### Performance Optimization

- Use `transform` and `opacity` exclusively for animated properties.
- Never animate `width`, `height`, `top`, `left`, `margin`, `padding` — use `transform` instead.
- Use `will-change: transform, opacity` only during active animation, remove afterward.
- Use `transformTemplate` to ensure GPU-composited transforms.
- Limit concurrent `layout` animations to 10 per frame.
- Use `custom` prop for dynamic transitions instead of inline `transition` objects.

## 14. Accessibility Rules

Motion must serve all users, not just those without vestibular or neurological conditions.

### Reduced Motion

- Respect `prefers-reduced-motion: reduce` at the CSS level and JavaScript level.
- When active:
  - All L0/L1 (background/ambient) motion is **disabled**.
  - All L2/L3 transitions become **instant opacity changes** (no positional animation).
  - L4 (critical attention) transitions are **simplified** to opacity + no movement.
  - Stagger delays are removed — all elements appear simultaneously.
  - AI thinking dots become static (no pulse).
  - Skeleton shimmer is **disabled** — show solid placeholder instead.

### Epilepsy-Safe Motion

- No animation flashes more than 3 times per second.
- No animation alternates between light and dark at > 3 Hz.
- No animation covers > 25% of the viewport while flashing.
- All ambient loops exceed 2000ms cycle time (well below flash threshold).

### Motion Intensity Fallback

- Provide a user-facing toggle in settings: "Animation intensity" (Full / Reduced / Off).
- "Reduced" maps to `prefers-reduced-motion: reduce` behavior.
- "Off" disables all non-essential motion (preserves focus rings and cursor changes).
- Persist the user's choice in local storage.

### Keyboard Navigation Consistency

- Focus-visible rings appear **instantly** (no animation).
- Focus-visible ring style matches hover style exactly.
- Tab order does not change based on animated state.
- Focus trap in modals activates before the modal enter animation begins.
- Screen reader announcements are synchronized with visual transitions.

## 15. Motion Manifesto

**Motion is infrastructure.**

We do not animate to impress. We animate to inform.

- If motion helps the user understand state, we use it.
- If motion helps the user maintain spatial memory, we use it.
- If motion makes the system feel alive without demanding attention, we use it.
- If motion exists because it looks cool, we remove it.

The best motion design is the kind users do not consciously notice. They simply feel that the interface is calm, responsive, and coherent. That is the standard.

**Calm is the default. Purpose is the exception. Motion serves both.**
