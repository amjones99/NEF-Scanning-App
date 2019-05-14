#Application_helper is a ruby helper used to extract complex logic out of the view in order to organize code better.

module ApplicationHelper
  def nav_link_to(current_identifier, *args, &block)
    identifier = block_given? ? args[1].delete(:identifier) : args[2].delete(:identifier)
    content_tag :li, class: (:active if identifier == current_identifier) do
      link_to(*args, &block)
    end
  end

  def navbar_link_to(*args, &block)
    nav_link_to(@current_nav_identifier, *args, &block)
  end

  def subnav_link_to(*args, &block)
    nav_link_to(@current_subnav_identifier, *args, &block)
  end

  def no_record_tr(colspan, text = 'No records to display')
    content_tag(:tr, content_tag(:td, text, colspan: colspan, class: 'text-center text-muted' ), class: 'tr-no-record')
  end

  def partial_exist?(partial_name, prefixes = lookup_context.prefixes)
    lookup_context.exists?(partial_name, prefixes, true)
  end

  def bool_to_glyph(value)
        value ? "<span class='glyphicon glyphicon-ok' aria-hidden='true'></span>".html_safe : "<span class='glyphicon glyphicon-remove' aria-hidden='true'></span>".html_safe
  end

end
