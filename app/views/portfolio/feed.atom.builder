atom_feed :language => 'en-US', :root_url => portfolio_url do |feed|
  feed.title @title
  feed.updated @updated

  @entries.each do |item|
    next if item.pub_date.blank?

    feed.entry( item, :url => portfolio_url ) do |entry|
      entry.url portfolio_url
      entry.title item.name
      entry.content item.description, :type => 'html'

      # the strftime is needed to work with Google Reader.
      entry.updated(item.pub_date.strftime("%Y-%m-%dT%H:%M:%SZ"))

      entry.author "Jeffrey Carl Faden"
    end
  end
end