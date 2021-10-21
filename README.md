# Printing GDS files with KLayout

I've been using a 300dpi colour laser printer for these experiments.

Each level of zoom (full chip, macro, standard cell) needs a different layout properties file to keep the level of detail managable.

Results are [here](https://photos.app.goo.gl/TV9q7g9eB4HCG9fF9)

# Klayout setup

* For the detailed views (macro, standard cell), I turn off all the fill and decap cells.
* For print - run this in (ruby) macro development:
    RBA::Application.instance.main_window.current_view.save_image("/tmp/filename.png",10000,10000)
