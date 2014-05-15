module MarkdownSnippets

  def markdown_with_commitate_annotations
<<MARKDOWN
This is a paragraph of text.

```ruby
>>[hello.rb](af68c6261b14feccdd354b5c1055dcc733cad1e3)
```

This is another paragraph of text.
MARKDOWN
  end

  def basic_markdown
<<MARKDOWN
This is a paragraph of text.

This is another paragraph of text.
MARKDOWN
  end

  def commitate_missing_sha
<<MARKDOWN
This is a paragraph of text.

```ruby
>>[hello.rb]
```

This is another paragraph of text.
MARKDOWN
  end

  def commitate_empty_sha_parens
<<MARKDOWN
This is a paragraph of text.

```ruby
>>[hello.rb]()
```

This is another paragraph of text.
MARKDOWN
  end

  def markdown_with_commitate_annotations_options
<<MARKDOWN
This is a paragraph of text.

```ruby
>>[hello.rb](af68c6261b14feccdd354b5c1055dcc733cad1e3){'lines': '1,5-8'}
```

This is another paragraph of text.
MARKDOWN
  end
end
