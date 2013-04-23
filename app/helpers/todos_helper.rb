module TodosHelper
  def new_line(text="kakushi")
    text.to_s.gsub(/\n/, "<BR />")
  end
end
