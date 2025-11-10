# Extensions and Filters

This guide covers extending Quarto with custom extensions and Lua filters.

## Extensions

Quarto extensions add functionality beyond the core features. Common extensions:

- **Shortcodes**: Custom markdown syntax
- **Formats**: Additional output formats
- **Themes**: Custom presentation themes

### Installing Extensions

```bash
quarto add quarto-ext/extension-name
```

### Using Extensions

Extensions are typically configured in `_quarto.yml`:

```yaml
format:
  revealjs:
    theme: extension-theme
```

## Lua Filters

Lua filters allow you to customize how Quarto processes documents.

### Creating a Filter

Create a file `_extensions/custom/filters/custom.lua`:

```lua
function Div(el)
  if el.classes:includes('custom-div') then
    -- Custom processing
    return el
  end
end
```

### Using a Filter

Reference in `_quarto.yml`:

```yaml
filters:
  - custom.lua
```

Or in document front matter:

```yaml
---
filters:
  - custom.lua
---
```

## Common Use Cases

### Custom Callouts

Create custom callout types:

```lua
function Div(el)
  if el.classes:includes('callout-important') then
    el.classes:insert(1, 'callout')
    el.attributes['data-callout'] = 'important'
    return el
  end
end
```

Use in markdown:

```markdown
::: {.callout-important}
This is important!
:::
```

### Custom Shortcodes

Create shortcodes for repeated content:

```lua
function CodeBlock(el)
  if el.class == 'shortcode' then
    if el.text == 'team' then
      return pandoc.RawBlock('html', 
        '<div class="team">Team: Alice, Bob, Carol</div>')
    end
  end
  return el
end
```

Use in markdown:

````markdown
```{=shortcode}
team
```
````

### Slide Numbering Customization

Customize slide numbering format:

```lua
function Meta(meta)
  if meta['slide-number-format'] then
    -- Custom numbering logic
  end
  return meta
end
```

## Example: Custom Fragment Classes

Add custom fragment animations:

```lua
function Span(el)
  if el.classes:includes('fade-in') then
    el.attributes['data-fragment'] = 'fade-in'
    return el
  end
  return el
end
```

Use:

```markdown
This text {.fade-in} fades in.
```

## Testing Filters

1. Create filter file
2. Add to `_quarto.yml` or document front matter
3. Render: `quarto render`
4. Check output for expected behavior
5. Debug with `quarto render --debug`

## Resources

- [Quarto Extensions](https://quarto.org/docs/extensions/)
- [Lua Filter Guide](https://quarto.org/docs/extensions/lua-filters.html)
- [Pandoc Lua Filters](https://pandoc.org/lua-filters.html)

## When to Use

**Use extensions when:**
- You need functionality that doesn't exist
- You want to share functionality across projects
- You need a maintained, tested solution

**Use filters when:**
- You need project-specific customization
- You want fine-grained control
- You're comfortable with Lua

## Best Practices

1. **Start simple**: Use built-in features first
2. **Document customizations**: Explain what filters do
3. **Test thoroughly**: Filters can break rendering
4. **Version control**: Include filters in the repository
5. **Share useful filters**: Consider contributing to extensions

## Next Steps

- Set up [CI/CD with GitHub Actions](05_ci_cd_github_actions.html)
- Check [troubleshooting guide](90_troubleshooting.html) if issues arise

