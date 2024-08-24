import Clock from './widgets/Clock'
import Workspaces from './widgets/Workspaces'
import Music from './widgets/music'
import SysTray from './widgets/SysTray'
import SysIndicators from './widgets/SysIndicators'
// import ActiveWindow from './widgets/ActiveWindow'
import SysResources from './widgets/Resources'
import NotificationButton from './widgets/NotificationButton'

const Left = () =>
  Widget.Box({
    spacing: 8,
    children: [
      Workspaces(),
      // ActiveWindow()
    ],
  })

const Center = () =>
  Widget.Box({
    spacing: 8,
    children: [Clock(), NotificationButton()],
  })

const Right = () =>
  Widget.Box({
    hpack: 'end',
    spacing: 8,
    children: [SysResources(), SysIndicators(), SysTray()],
  })

const Bar = (monitor = 0) => {
  return Widget.Window({
    name: `bar-${monitor}`,
    class_name: 'bar',
    monitor,
    anchor: ['top', 'left', 'right'],
    exclusivity: 'exclusive',
    child: Widget.CenterBox({
      start_widget: Left(),
      center_widget: Center(),
      end_widget: Right(),
    }),
  })
}
export default Bar
