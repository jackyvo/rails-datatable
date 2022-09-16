class UsersDatatable < Datatable
  def initialize(view, klass)
    super(view, klass, columns_for_search: %w[], columns_for_sort:%w[- - - - ])
  end

  def data
    @items.each_with_index.map do |item, index|
      render(
        partial: 'users/user',
        formats: [:html],
        locals:  { item: item, index: index}).split('</td>').map {|row| row.gsub('<td>', '')}
    end
  end
end