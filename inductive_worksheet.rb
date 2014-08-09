gem 'prawn'
require 'prawn'

def headed_box(grid_begin, grid_end, header, &block)
  grid(grid_begin, grid_end).bounding_box do
    move_down 6
    indent 6 do
      text header
    end
    stroke_horizontal_rule

    if block_given?
      move_down 4
      indent 6, &block
    end

    stroke_bounds
  end
end

def b &block
  font "LMRoman10-Bold.ttf", &block
end

Prawn::Document.generate "inductive_worksheet.pdf" do
  font "LMRoman10-Regular.ttf"
  define_grid(:columns => 12, :rows => 12, :gutter => 2)

  grid([0,0], [0,11]).bounding_box do
    font_size 16 do
      text "Inductive Study Worksheet"
    end

    b { text "Passage: "}
  end

  headed_box([1,0], [1,5], "Context Before this Section")
  headed_box([1,6], [1,11], "Context After this Section")
  headed_box([2,0], [10,5], "Observations of the Text") do
    font_size 8 do
      text "These include: indicatives, imperatives, and theological points
Observations on language used: repeated points and grammar
Observations that are infered mark with (*)"
    end
  end

  headed_box([2,6], [5, 11], "Structure of the Section")
  headed_box([6,6], [7, 11], "Key Terms")
  headed_box([8,6], [8, 11], "People Involved")
  headed_box([9,6], [10, 11], "Cross References")

  headed_box([11, 0], [11, 11], "Identify the Main Point:")


  start_new_page

  headed_box([0,0], [2, 11], "What does the passage tell us about topics like God, Christ, the Holy Spirit, Us, Sin, Salvation?")
  headed_box([3,0], [4, 11], "How does this passage fit into the entire book? (Why is this written here?)")

  headed_box([5,0], [7, 11], "What is the application of the passage?")
  headed_box([8,0], [10, 11], "Personal Convictions from Passage")
  headed_box([11, 0], [11, 11], "Other Remarks")
end
