module TodosHelper
  def new_line(text="kakushi")
    raw( h(text).gsub(/\n/, "<BR />"))
  end
end
