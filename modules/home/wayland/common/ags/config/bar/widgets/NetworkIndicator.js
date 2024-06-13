const network = await Service.import('network')

const WifiIndicator = () =>
  Widget.Box({
    children: [
      Widget.Icon({
        icon: network.wifi.bind('icon_name'),
      }),
      Widget.Label({
        label: network.wifi.bind('ssid').as((ssid) => ssid || 'Unknown'),
      }),
    ],
  })

const WiredIndicator = () =>
  Widget.Icon({
    icon: network.wired.bind('icon_name'),
  })

export default () =>
  Widget.Stack({
    children: {
      wifi: WifiIndicator(),
      wired: WiredIndicator(),
    },
    shown: network.bind('primary').as((p) => p || 'wifi'),
  })
