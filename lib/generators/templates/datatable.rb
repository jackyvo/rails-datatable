class Datatable
  include Rails.application.routes.url_helpers

  delegate :params, :raw, :h, :link_to,
    :number_to_currency, :text_field_tag,
    :check_box_tag, :current_user, :image_tag, :content_tag,
    :check_box_tag, :select_tag, :options_from_collection_for_select,:number_with_precision,
    :hidden_field_tag, :request, :render, to: :@view

  DEFAULT = {
    per_page: 10,
    truncate_length: 50,
    na: 'N/A'
  }

  def initialize(view, klass, columns_for_search: [], columns_for_sort: [], options: {})
    @view = view
    @klass = klass
    @columns_for_search = columns_for_search
    @columns_for_sort = columns_for_sort
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: @klass.count,
      iTotalDisplayRecords: items.total_count,
      data: data
    }
  end

  protected

  def data
    raise NotImplementedError # Override this method in subclass
  end

  def items
    @items ||= fetch_items
  end

  def fetch_items
    items = if sort_column == '-' 
      @klass.unscope(:order).order(:created_at => :desc)
    else
      null_order = sort_direction == 'asc' ? 'FIRST' : 'LAST'
      @klass.unscope(:order).order("#{sort_column} #{sort_direction} NULLS #{null_order}")
    end
    
    items = items.page(page).per(per_page)
    
    if params[:search].present?
      search_str = @columns_for_search.map{|field| "upper(cast(#{field} as text)) like upper(:search)"}.join ' or '
      items = items.where(search_str, search: "%#{params[:search][:value].strip}%")
    end

    if params[:sSearch].present?
      search_str = @columns_for_search.map{|field| "upper(cast(#{field} as text)) like upper(:search)"}.join ' or '
      items = items.where(search_str, search: "%#{params[:sSearch].strip}%")
    end

    items
  end

  def page
    (params['start'].to_i / per_page) + 1 rescue 1
  end

  def per_page
    params['length'].to_i rescue 10
  end

  def sort_column
    sort_index = params['order']['0']['column'].to_i rescue 0
    @columns_for_sort[sort_index]
  end

  def sort_direction
    params['order']['0']['dir'] rescue 'asc'
  end
end
