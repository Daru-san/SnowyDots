import Bar from './js/bar/bar'
import notificationPopups from './js/notifications/notificationPopups'
import NotificationWindow from './js/NotifWindow/NotificationWindow'
// import DashBoard from './js/dashboard/Dashboard'

App.config({
  style: './style/style.scss',
  windows: [Bar(0), notificationPopups(), NotificationWindow()],
})
