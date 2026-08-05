# Per-screen worksheet

Copy one per critical screen. Fill it from a real visit to the running app, not from reading code.

```markdown
## Screen: [name]

- Route:
- User / role:
- Main job:
- Entry point:
- Expected outcome:
- Primary action:
- Success metric:

### Diagnosis

- What the user understands in the first 5 seconds:
- Elements competing for attention:
- Repeated data:
- Colours with no function:
- Components outside the system:
- Friction or frequent errors:
- Missing states:
- Trust risks:
- Accessibility problems:
- Performance problems:

### Decisions

- Keep:
- Remove:
- Reorder:
- Simplify:
- Defer behind demand:
- Instrument:
- Test with users:

### Acceptance criteria

- [ ] One unambiguous primary action
- [ ] Hierarchy understandable without colour
- [ ] No purposeless repeated data
- [ ] Only permitted components and tokens
- [ ] Loading, empty, error, permission and success resolved
- [ ] Keyboard navigation and visible focus
- [ ] Responsive validated with real content
- [ ] Success event instrumented
```

## How to fill the diagnosis honestly

- **First 5 seconds** — screenshot the route, look away, look back once, write what you actually saw
  first. Do not write what you know is there.
- **Competing elements** — count filled/solid buttons, count coloured badges, count anything with a
  shadow. More than one solid button per view is a finding.
- **Repeated data** — list every number on screen and where else that same number appears.
- **Missing states** — force them: throttle the network, log out mid-session, empty the data, revoke a
  permission, submit an invalid form. A state you never provoked is a state you cannot claim exists.
- **Greyscale test** — screenshot in greyscale; if you cannot find the primary action, the hierarchy
  depends on colour and that is a finding.
