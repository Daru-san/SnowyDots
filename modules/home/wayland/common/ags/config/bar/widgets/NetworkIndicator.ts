const network = await Service.import('network')

const wifiWidget = Widget.Button({
  className: 'transparent-button',
  cursor: 'pointer',
  onPrimaryClickRelease: () => Utils.execAsync('kitty --detach nmtui'),
  onSecondaryClickRelease: () => Utils.execAsync('nm-connection-editor'),
  child: Widget.Box({
    children: [
      Widget.Icon({
        icon: network.wifi.bind('icon_name'),
      }),
      Widget.Label({
        css: `margin-left: 6px;`,
        label: network.wifi.bind('ssid').as((ssid) => ssid || ''),
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
  visible: network.bind('primary').as((p) => p == 'wired'),
})

export default () =>
  Widget.Box({
    children: [
      Widget.Box({ css: `opacity: 1;`, children: [wifiWidget, wiredWidget] }),
    ],
  })
