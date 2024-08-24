const network = await Service.import('network')

const wifiWidget = Widget.Button({
  className: 'transparent-button',
  cursor: 'pointer',
  onPrimaryClickRelease: () => Utils.execAsync('kitty --detach nmtui'),
  onSecondaryClickRelease: () => Utils.execAsync('nm-connection-editor'),
  child: Widget.Box({
    tooltipText: network.wifi.bind('ssid').as((ssid) => ssid || ''),
    children: [
      Widget.Icon({
        icon: network.wifi.bind('icon_name'),
      }),
    ],
  }),
})

const wiredWidget = Widget.Button({
  className: 'transparent-button',
  cursor: 'pointer',
  onClicked: () => Utils.execAsync('kitty --detach nmtui'),
  onSecondaryClickRelease: () => Utils.execAsync('nm-connection-editor'),
  child: Widget.Icon({
    icon: network.wired.bind('icon_name'),
  }),
  tooltipText: network.bind('primary').as((p) => p == 'wired'),
})

export default () =>
  Widget.Box({
    children: [Widget.Box({ css: `opacity: 1;`, children: [wifiWidget] })],
  })
