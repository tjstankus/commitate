Notes
=====

Command line possibilities
--------------------------

- commitate markdown_file

  Preprocesses the markdown file, replaces commitate-formatted content with
  content from the configured git repository, and saves the file as the same
  name, overwriting the original.

- commitate --output markdown_output_file markdown_file

  Preprocesses the markdown file, replaces commitate-formatted content with
  content from the configured git repository, and creats a new output file,
  leaving the processed file as is.

Renderer verfication
--------------------

`Renderer#preprocess` is a hook method that gets invoked by Redcarpet. Our
implementation has a dependency on a processor object that responds to
'#process'.

Because we are being invoked via Redcarpet hook method, we can't simply change
the `preprocess` method signature to inject the processor. To satisfy the
processor dependency for verification/testing, we inject the processor on the
renderer instance, then pass that instance to `Redcarpet::Markdown.new` for
rendering. So, we test with a minimal processor that renders expected output
and, in that way, specify behaviors such as regular expression matching.
