+++
title = "Welcome to Zola!"
date = 2026-01-31T10:00:00Z
draft = false

[taxonomies]
tags = ["zola", "github-pages", "blogging"]
categories = ["tutorial"]

[extra]
toc = true
+++

Welcome to your new Zola blog! This post will introduce you to the basics of Zola and how to get started with writing your own posts.

## What is Zola?

Zola is a blazingly fast static site generator written in Rust. It's a single binary with no dependencies, making it incredibly easy to install and use. Unlike Jekyll which requires Ruby, Bundler, and dozens of gems, Zola just works out of the box.

### Key Features

- **Single Binary**: No dependencies, no gem hell, just download and run
- **Blazingly Fast**: Builds complete in milliseconds (22x faster than Jekyll!)
- **Built-in Everything**: Sass compilation, syntax highlighting, RSS feeds, search - all included
- **Modern Templates**: Uses Tera templating engine (similar to Jinja2)
- **Zero Configuration**: Sensible defaults that just work
- **Free Hosting**: GitHub Pages provides free hosting with CI/CD

### Performance Comparison

- **Jekyll**: 2.9+ seconds per build, requires Ruby environment
- **Zola**: 0.13 seconds per build, single binary
- **Speed improvement**: 22x faster!

## Writing Posts

To write a new post, create a file in the `content/blog` directory with the naming format:

```
YEAR-MONTH-DAY-title.md
```

For example: `2026-01-31-welcome-to-zola.md`

### Front Matter

Every post starts with TOML front matter (note the `+++` delimiters):

```toml
+++
title = "Your Post Title"
date = 2026-01-31T10:00:00Z
draft = false

[taxonomies]
tags = ["tag1", "tag2", "tag3"]
categories = ["category1"]

[extra]
toc = true
+++
```

### Markdown Formatting

You can use all standard markdown features:

- **Bold text**
- *Italic text*
- [Links](https://www.getzola.org)
- `Inline code`
- Lists (like this one!)

### Code Blocks

Zola has excellent built-in syntax highlighting:

```rust
fn main() {
    println!("Hello, Zola!");
}
```

```javascript
const greet = (name) => {
  console.log(`Hello, ${name}!`);
};

greet("Zola");
```

```python
def greet(name):
    print(f"Hello, {name}!")

greet("Zola")
```

## Local Development

To preview your blog locally, use the Nix shell:

```bash
cd ~/eiger/repos/blog
nix-shell
zola serve
```

Then visit `http://127.0.0.1:1111` in your browser. Zola automatically reloads when you make changes!

## Deploying to GitHub Pages

Simply commit and push your changes:

```bash
git add .
git commit -m "Add new post"
git push
```

GitHub Actions will automatically build and deploy your site in under a minute!

## Advantages Over Jekyll

### Dependencies
- **Jekyll**: Ruby 3.1, Bundler, ~50 gems, version conflicts
- **Zola**: Single binary, zero dependencies

### Build Speed
- **Jekyll**: 2.9+ seconds, slow incremental builds
- **Zola**: 0.13 seconds, instant rebuilds

### Setup Complexity
- **Jekyll**: Gemfile, Gemfile.lock, bundle install, gem updates
- **Zola**: Download binary, run zola serve

### Features
- **Jekyll**: Requires plugins for most features
- **Zola**: Everything built-in (Sass, syntax highlighting, RSS, search, sitemap)

## Next Steps

- Customize your `config.toml` with your information
- Update the About page with your bio
- Write your first original post
- Explore the [Zola documentation](https://www.getzola.org/documentation/)
- Customize the [tabi theme](https://github.com/welpo/tabi)

Happy blogging! 🚀
