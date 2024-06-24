import volumeIndicator from './volumeIndicator'
import NetworkIndicator from './NetworkIndicator'

export default () =>
  Widget.Box({
    children: [NetworkIndicator(), volumeIndicator()],
  })
