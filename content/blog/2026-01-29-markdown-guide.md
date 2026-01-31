+++
title = "Markdown Formatting Guide"
date = 2026-01-29T09:00:00Z
draft = false

[taxonomies]
tags = ["markdown", "formatting", "writing", "reference"]
categories = ["reference"]

[extra]
toc = true
+++

This is a comprehensive guide to Markdown formatting for your Zola blog posts. Use it as a reference when writing new content.

## Headings

Use `#` for headings (H1 through H6):

```markdown
# Heading 1
## Heading 2
### Heading 3
#### Heading 4
##### Heading 5
###### Heading 6
```

## Text Formatting

### Basic Styles

- **Bold**: `**bold text**` or `__bold text__`
- *Italic*: `*italic text*` or `_italic text_`
- ***Bold and Italic***: `***text***` or `___text___`
- ~~Strikethrough~~: `~~strikethrough~~`
- `Inline code`: `` `code` ``

### Blockquotes

Use `>` for blockquotes:

> This is a blockquote.
>
> It can span multiple lines.
>
> > And can be nested!

```markdown
> This is a blockquote.
>
> It can span multiple lines.
```

## Lists

### Unordered Lists

Use `-`, `*`, or `+`:

- Item 1
- Item 2
  - Nested item 2.1
  - Nested item 2.2
- Item 3

```markdown
- Item 1
- Item 2
  - Nested item 2.1
  - Nested item 2.2
- Item 3
```

### Ordered Lists

Use numbers followed by `.`:

1. First item
2. Second item
3. Third item
   1. Nested item 3.1
   2. Nested item 3.2

```markdown
1. First item
2. Second item
3. Third item
   1. Nested item 3.1
   2. Nested item 3.2
```

### Task Lists

Use `- [ ]` for unchecked and `- [x]` for checked:

- [x] Completed task
- [ ] Incomplete task
- [ ] Another task

```markdown
- [x] Completed task
- [ ] Incomplete task
- [ ] Another task
```

## Links

### Basic Links

[Link text](https://example.com)

```markdown
[Link text](https://example.com)
```

### Links with Titles

[Link with title](https://example.com "This is a title")

```markdown
[Link with title](https://example.com "This is a title")
```

### Internal Links

Link to other pages in your blog:

```markdown
[About page](/pages/about/)
[Blog section](/blog/)
[Specific post](/blog/2026-01-31-welcome-to-zola/)
```

### Automatic Links

<https://example.com>

```markdown
<https://example.com>
```

## Images

### Basic Image

![Alt text](https://via.placeholder.com/400x200)

```markdown
![Alt text](image-url.jpg)
```

### Image with Title

![Alt text](https://via.placeholder.com/400x200 "Image title")

```markdown
![Alt text](image-url.jpg "Image title")
```

### Local Images

Store images in the `static/` directory:

```markdown
![My image](/images/photo.jpg)
```

The file would be at: `static/images/photo.jpg`

## Code

### Inline Code

Use backticks for `inline code`.

```markdown
Use backticks for `inline code`.
```

### Code Blocks

Use triple backticks with optional language identifier:

```python
def hello_world():
    print("Hello, World!")

hello_world()
```

````markdown
```python
def hello_world():
    print("Hello, World!")
```
````

### Supported Languages

Zola has excellent built-in syntax highlighting for many languages:

```rust
// Rust
fn main() {
    println!("Hello, World!");
}
```

```javascript
// JavaScript
const greet = (name) => {
  console.log(`Hello, ${name}!`);
};
```

```bash
# Bash
#!/bin/bash
echo "Hello, World!"
```

```html
<!-- HTML -->
<!DOCTYPE html>
<html>
  <head>
    <title>Page Title</title>
  </head>
  <body>
    <h1>Hello, World!</h1>
  </body>
</html>
```

```css
/* CSS */
body {
  font-family: Arial, sans-serif;
  margin: 0;
  padding: 20px;
}
```

```toml
# TOML (Zola config format)
title = "My Blog"
base_url = "https://example.com"

[extra]
author = "Your Name"
```

## Tables

Use pipes `|` and hyphens `-`:

| Header 1 | Header 2 | Header 3 |
|----------|----------|----------|
| Row 1    | Data     | Data     |
| Row 2    | Data     | Data     |
| Row 3    | Data     | Data     |

```markdown
| Header 1 | Header 2 | Header 3 |
|----------|----------|----------|
| Row 1    | Data     | Data     |
| Row 2    | Data     | Data     |
```

### Table Alignment

Use colons for alignment:

| Left-aligned | Center-aligned | Right-aligned |
|:-------------|:--------------:|--------------:|
| Left         | Center         | Right         |
| Text         | Text           | Text          |

```markdown
| Left-aligned | Center-aligned | Right-aligned |
|:-------------|:--------------:|--------------:|
| Left         | Center         | Right         |
```

## Horizontal Rules

Use three or more hyphens, asterisks, or underscores:

---

***

___

```markdown
---
***
___
```

## Escaping Characters

Use backslash `\` to escape special characters:

\*Not italic\* and \`not code\`

```markdown
\*Not italic\* and \`not code\`
```

## HTML in Markdown

You can use HTML directly in Markdown:

<div style="background-color: #f0f0f0; padding: 10px; border-radius: 5px;">
  This is a custom HTML block with <strong>styling</strong>.
</div>

```html
<div style="background-color: #f0f0f0; padding: 10px;">
  This is a custom HTML block with <strong>styling</strong>.
</div>
```

## Emoji

Zola supports emoji rendering when `render_emoji = true` in config.toml:

:smile: :heart: :rocket: :computer:

```markdown
:smile: :heart: :rocket: :computer:
```

Or use Unicode emoji directly:

😀 ❤️ 🚀 💻

## Front Matter Examples

Every post needs TOML front matter at the top (note the `+++` delimiters):

### Minimal

```toml
+++
title = "Post Title"
date = 2026-01-29T09:00:00Z
+++
```

### Complete

```toml
+++
title = "Complete Post Title"
date = 2026-01-29T09:00:00Z
draft = false

description = "A brief description of your post"

[taxonomies]
tags = ["tag1", "tag2", "tag3"]
categories = ["category1", "category2"]

[extra]
toc = true
author = "Your Name"
+++
```

### With Custom Fields

```toml
+++
title = "Advanced Post"
date = 2026-01-29T09:00:00Z

[taxonomies]
tags = ["tutorial", "advanced"]

[extra]
toc = true
featured = true
cover_image = "/images/cover.jpg"
+++
```

## Zola-Specific Features

### Internal Links

Use `@/` to reference content from the root:

```markdown
[Link to about page](@/pages/about.md)
[Link to another post](@/blog/2026-01-31-welcome-to-zola.md)
```

### Anchor Links

Zola automatically generates anchor links for headings when `insert_anchor_links` is set in section front matter.

### Shortcodes

Zola supports custom shortcodes for reusable content blocks. Check your theme documentation for available shortcodes.

## Tips for Great Posts

1. **Use descriptive headings** - Help readers scan your content
2. **Break up text** - Use lists, code blocks, and images
3. **Add code examples** - Show, don't just tell
4. **Link to resources** - Help readers learn more
5. **Proofread** - Use `zola serve` to preview before publishing
6. **Use tags wisely** - 3-5 relevant tags per post
7. **Write good descriptions** - Show up in search results and feeds
8. **Enable table of contents** - Set `toc = true` for long posts

## Resources

- [Markdown Guide](https://www.markdownguide.org/)
- [CommonMark Spec](https://commonmark.org/)
- [Zola Documentation](https://www.getzola.org/documentation/)
- [Tera Template Engine](https://keats.github.io/tera/)

---

Save this post as a reference when writing! You can always refer back to it for formatting examples. Happy writing! ✍️
