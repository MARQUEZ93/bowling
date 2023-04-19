FROM ruby:latest
COPY . /var/www/ruby  
WORKDIR /var/www/ruby  
CMD ["ruby","console.rb"]  