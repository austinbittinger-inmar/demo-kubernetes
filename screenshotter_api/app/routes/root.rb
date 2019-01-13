post '/' do
  puts params
  ScreenshotWorker.perform_async(params['url'])
end

get '/' do
  Screenshot.order(id: :desc).to_json  
end