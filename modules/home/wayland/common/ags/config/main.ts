import Bar from './bar/bar.ts'
import notificationPopups from './windows/notificationPopups.js'
import NotificationWindow from './windows/NotificationWindow.ts'
import MusicPlayer from './windows/MusicPlayer.ts'

App.config({
  style: './style/style.scss',
  windows: [Bar(0), notificationPopups(), MusicPlayer(), NotificationWindow],
})
