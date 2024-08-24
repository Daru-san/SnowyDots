import NetworkIndicator from './NetworkIndicator'
import Volume from './Volume'

export default () =>
  Widget.Box({
    children: [NetworkIndicator(), Volume()],
  })
