import Widget from 'resource:///com/github/Aylur/ags/widget.js'
import Sway from 'resource:///com/github/Aylur/ags/service/sway.js'

const windowClass = Widget.Label({
  label: Sway.active.client.bind('class'),
})

const ActiveWindow = () => {
  return Widget.Box({
    child: windowClass,
  })
}
export default ActiveWindow
