chrome.app.runtime.onLaunched.addListener (launchData) ->
	chrome.app.window.create 'gw2.html',
		id: '_mainWindow'
		bounds:
			width: 800
			height: 600
		# frame: 'none'