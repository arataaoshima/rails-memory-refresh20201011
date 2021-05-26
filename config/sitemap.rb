# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://www.smorq.com"
SitemapGenerator::Sitemap.sitemaps_host = "https://s3-ap-northeast-1.amazonaws.com/#{ENV['S3_BUCKET']}"
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
SitemapGenerator::Sitemap.adapter = SitemapGenerator::AwsSdkAdapter.new(
  ENV['S3_BUCKET'],
  aws_access_key_id: ENV['S3_ACCESS_KEY'],
  aws_secret_access_key: ENV['S3_SECRET_KEY'],
  aws_region: 'us-west-2',
)

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  add blogs_path
  add lectures_path
  add categories_path
  add courses_path
  add slides_path
  add sheet_links_path
  add contacts_path
  add policies_path
  add privacy_policies_path

  # Add all articles:
  Blog.find_each do |blog|
  add blog_path(blog), :lastmod => blog.updated_at
  end

  Lecture.find_each do |lecture|
  add lecture_path(lecture), :lastmod => lecture.updated_at
  end

  Course.find_each do |course|
  add course_path(course), :lastmod => course.updated_at
  end

  Category.find_each do |category|
  add category_path(category), :lastmod => category.updated_at
  end
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end
