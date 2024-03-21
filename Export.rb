module Export
  include RBA

  # List here cells to hide
  cells_to_hide = [ "sky130_*_decap_*", "VIA_*", "sky130_*_buf_*", "sky130_*_clkbuf_*", "sky130_*_dly*", "sky130_*_fill_*", "sky130_*_tap*" ]
  puts "info: Will hide #{cells_to_hide.length()} cells"
  # List here .lyp files to read
  lyp_files = [ "caravel", "standard-cell", "macro", "openroad" ]
  puts "info: Will generate #{lyp_files.length()} images"

  # Layer properties root
  lyp_root = Pathname("/home/scorbetta/work/tools/klayout_properties")

  # Current layout  
  layout = RBA::CellView::active.layout

  # Top-level name
  top_name = layout.top_cell.name

  # Hide selected cells
  cells_to_hide.each { |cell_name|
    cells_ptr = layout.cells(cell_name)
    cells_ptr.each { |ptr|
      RBA::CellView::active.hide_cell(ptr)
    }
  }
  
  # For each .lyp file generate an image
  lyp_files.each { | lyp_mode |
    # Output file name from GDS top-level cell
    out_file = top_name + "_" + lyp_mode + ".png"

    # Apply selected layer properties
    LayoutView::current.load_layer_props(lyp_root.to_s + "/" + lyp_mode + ".lyp")
  
    # Print image
    png_name = "/home/scorbetta/" + out_file
    puts "info: Generating #{png_name}"
    Application.instance.main_window.current_view.save_image(png_name, 10000, 10000)
  }
end
