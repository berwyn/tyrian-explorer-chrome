chrome.app.runtime.onLaunched.addListener (launchData) ->
	chrome.app.window.create 'cloudsdale.html', {
		id: '_mainWindow'
		bounds: {
			width: 800
			height: 600
		}
	}