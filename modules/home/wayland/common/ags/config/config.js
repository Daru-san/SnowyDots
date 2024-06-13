import Bar from './bar/default.js'
import NotificationPopups from './modules/notificationPopups.js'

App.config({
  style: './scss/style.scss',
  windows: [Bar(), NotificationPopups()],
})

export {}
