window.onload = ->

	appView = document.querySelector("#cloudsdale_webview")
	appWindow = chrome.app.window.current()

	doLayout = ->
		bounds = appWindow.getBounds()
		if appView?
			console.log 'Resizing webview'
			appView.setAttribute "width", bounds["width"]
			appView.setAttribute "height", bounds["height"]

	# appWindow.onBoundsChanged.addListener doLayout
	# appWindow.onFullscreened.addListener doLayout
	# appWindow.onMaximized.addListener doLayout
	# appWindow.onRestored.addListener doLayout