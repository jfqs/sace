module ApplicationHelper
  # def link_to_add_fields(f, association)
  #   new_object = f.object.class.reflect_on_association(association).klass.new
  #   fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
  #     render(association.to_s.singularize + "_fields", :f => builder, idx: '')
  #   end
  #   link_to_function(('<i class="fa fa-plus"></i> ' + t(:add) + ' ' + new_object.class.model_name.human).html_safe,
  #     "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\", '.add_here')",
  #     class: "btn btn-info btn-rounded  mb-10")
  # end

  def link_to_function(name, *args, &block)
     html_options = args.extract_options!.symbolize_keys

     function = block_given? ? update_page(&block) : args[0] || ''
     onclick = "#{"#{html_options[:onclick]}; " if html_options[:onclick]}#{function}; return false;"
     href = html_options[:href] || '#'

     content_tag(:a, name, html_options.merge(:href => href, :onclick => onclick))
   end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.simple_fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields btn btn-info btn-sm", data: {id: id, fields: fields.gsub("\n", "")})
  end


end
