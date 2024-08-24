function NotifButton() {
  return Widget.Button({
    class_name: 'notifButton',
    on_primary_click: () => App.toggleWindow('NotificationMenu'),
    child: Widget.Icon({
      icon: 'preferences-system-notifications-symbolic',
    }),
  })
}
export default NotifButton
