window.onload = ->
	$ = (sel) ->
		return document.querySelector(sel)

	appView = $('#cloudsdale_webview')
	appWindow = chrome.app.window.current()

	window.onresize = ->
		bounds = appWindow.getBounds()
		unless appView.nil?
			appView.setAttribute "width", bounds["width"]
			appView.setAttribute "height", bounds["height"]