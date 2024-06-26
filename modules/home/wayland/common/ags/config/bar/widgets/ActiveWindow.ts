const hyprland = await Service.import('hyprland')

const windowClass = Widget.Label({
  label: hyprland.active.client.bind('class'),
  visible: hyprland.active.client.bind('address').as((addr) => !!addr),
})

const ActiveWindow = () => {
  return Widget.Box({
    child: windowClass,
  })
}
export default ActiveWindow
