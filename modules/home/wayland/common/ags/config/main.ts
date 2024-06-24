import Bar from './bar/bar.ts'
import notificationPopups from './windows/notificationPopups.js'
import MusicWidget from './windows/MusicWidget.ts'

App.config({
  style: './style/style.scss',
  windows: [
    Bar(0),
    notificationPopups(),
    // MusicWidget() //TODO: Make this not show up by default
  ],
})
