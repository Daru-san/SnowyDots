const cpuUsagePercent = Variable('', {
  poll: [
    5000,
    "bash -c \"top -bn2 | grep '%Cpu' | tail -1 | grep -P '(....|...) id,'|awk '{print 100-$8}'\"",
  ],
})

const ramUsedPercent = Variable('', {
  poll: [
    5000,
    `bash -c "free -m | awk 'NR==2{printf \\"%.0f%%\\", $3*100/$2 }'"`,
  ],
})

const ResourceButton = () =>
  Widget.Button({
    className: 'transparent-button',
    onPrimaryClickRelease: () => Utils.execAsync('missioncenter'),
    onSecondaryClickRelease: () => Utils.execAsync('kitty --detach btop'),
    child: Widget.Box({
      children: [
        Widget.Box({
          vertical: true,
          children: [
            Widget.Label({
              label: 'CPU',
              css: `font-size: 7px;`,
            }),
            Widget.Label({
              css: `margin-left: 10px; font-size: 12px;`,
              label: cpuUsagePercent.bind(),
            }),
          ],
        }),
        Widget.Box({
          vertical: true,
          children: [
            Widget.Label({
              label: 'MEM',
              css: `font-size: 7px;`,
            }),
            Widget.Label({
              css: `margin-left: 6px; font-size: 12px;`,
              label: ramUsedPercent.bind(),
            }),
          ],
        }),
      ],
    }),
  })
export default ResourceButton
