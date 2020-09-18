# Learning with Texts for Esperanto
This is a fork of [Learning With Texts](https://lwt.sourceforge.net/) - thanks to them for the great work!

I have made the following alterations:
- Esperanto is defined as a language by default.
- When clicking on word, instead of using the user-defined dictionary 1 to populate the defintion frame, it uses an [Esperanto dictionary](https://github.com/coljac/kindle_eo_eng), and makes the definitions clickable, so no copy-paste is needed.

I also added a Dockerfile, so the whole thing can be run conveniently as follows:

`docker run -p 8000:80 coljac/lwt-esperanto:latest` and browse to http://localhost:8000/lwt.

If you don't run via docker, you'll need to make sure that `lwt/col_dict.php` can run `src/query.py` in the target environment. See that file for details.

I'm not a PHP developer, so this is all very hacky.
