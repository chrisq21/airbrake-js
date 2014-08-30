jsonifyNotice = require('../util/jsonify_notice.coffee')


report = (notice, opts) ->
  url = "https://exceptions.codebasehq.com/notifier_api/v2/notices"
  payload = jsonifyNotice(notice)

  req = new global.XMLHttpRequest()
  req.open('POST', url, true)
  req.setRequestHeader('Content-Type', 'application/json')
  req.send(payload)
  req.onreadystatechange = ->
    if req.readyState == 4 and req.status == 201 and console?.debug?
      resp = JSON.parse(req.responseText)
      console.debug("airbrake: error #%s was reported: %s", resp.id, resp.url)


module.exports = report
