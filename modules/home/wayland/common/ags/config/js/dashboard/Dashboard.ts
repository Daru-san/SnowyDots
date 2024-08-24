import { PopupWindow } from '../PopupWindow'

const Dashboard = PopupWindow({
  name: 'Dashboard',
  transition: 'slide_up',
  transition_duration: 300,
  anchor: ['top', 'right'],
  margins: 4,
  child: Widget.Box({
    className: 'Dashboard',
    children: [],
}),
export default Dashboard
