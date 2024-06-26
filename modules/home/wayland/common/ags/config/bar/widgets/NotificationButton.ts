const notifications = await Service.import('notifications')

function Notification() {
  return Widget.Button({
    class_name: 'notification',
    on_primary_click: () => App.toggleWindow('notifications'),
    child: Widget.Icon({
      icon: 'preferences-system-notifications-symbolic',
    }),
  })
}
export default Notification
