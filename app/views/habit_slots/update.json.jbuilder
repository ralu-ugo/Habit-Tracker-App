if @habitslot.persisted?
  json.card "<h1>Result</h1>"
else
  json.card "failure"
end
