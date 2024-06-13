import Clock from './widgets/Clock.js'
import Workspaces from './widgets/Workspaces.js'
import NetworkIndicator from './widgets/NetworkIndicator.js'
import Media from './widgets/mpris.js'
import VolumeSlider from './widgets/volumeSlider.js'
import SysTray from './widgets/SysTray.js'
const Left = () =>
  Widget.Box({
    spacing: 8,
    children: [Workspaces(), Media()],
  })

const Center = () =>
  Widget.Box({
    spacing: 8,
    children: [Clock()],
  })

const Right = () =>
  Widget.Box({
    hpack: 'end',
    spacing: 8,
    children: [VolumeSlider(), NetworkIndicator(), SysTray()],
  })

const Bar = (monitor = 0) => {
  return Widget.Window({
    name: `bar-${monitor}`, // name has to be unique
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
