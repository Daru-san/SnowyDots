const audio = await Service.import('audio')

export default () => {
  const icon = Widget.Icon({
    icon: Utils.watch(getIcon(), audio.speaker, getIcon),
  })

  return Widget.EventBox({
    onScrollUp: Utils.subprocess([
      'swayosd-client',
      '--output-volume',
      'raise',
    ]),
    onScrollDown: Utils.subprocess([
      'swayosd-client',
      '--output-volume',
      'lower',
    ]),
    child: Widget.Button({
      css: `opacity: 1; min-width: 10px;`,
      class_name: 'volume',
      child: icon,
    }),
  })
}

const icons = {
  101: 'overamplified',
  67: 'high',
  34: 'medium',
  1: 'low',
  0: 'muted',
}

const getIcon = () => {
  const icon = audio.speaker.is_muted
    ? 0
    : [101, 67, 34, 1, 0].find(
        (threshold) => threshold <= audio.speaker.volume * 100,
      )
  // @ts-ignore
  return `audio-volume-${icons[icon]}-symbolic`
}
