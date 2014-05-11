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

Render processing
-----------------

Because we are being invoked via Redcarpet hook method, we can't simply change
the `preprocess` method signature to inject the processor we want to use, even
though the processor is the external dependency. So we substitute a processor on
the renderer instance, then pass that instance to the Redcarpet method for
rendering. So, we can test with a stubbed processor and have it render some
expected output and that way specify that the regular expression is matching
when we expect it to, and not matching when we do not expect it to.
