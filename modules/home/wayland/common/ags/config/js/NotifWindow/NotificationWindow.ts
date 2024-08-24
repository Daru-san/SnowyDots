import { PopupWindow } from '../PopupWindow'
import notification from './Notification'
import { Media } from '../media/Media'
export const WINDOW_NAME = 'NotificationMenu'

const BottomBox = () =>
  Widget.Box({
    spacing: 12,
    vertical: true,
    children: [Media(), notification()],
  })

const NotificationMenu = PopupWindow({
  name: 'NotificationMenu',
  transition: 'slide_up',
  transition_duration: 300,
  anchor: ['top', 'middle'],
  margins: [4],

  keymode: 'on-demand',
  child: Widget.Box({
    className: 'notif-window',
    spacing: 12,
    vertical: true,
    children: [BottomBox()],
  }),
})

export default NotificationMenu
