const audio = await Service.import('audio')

const volumeIndicator = Widget.Button({
  on_clicked: () => (audio.speaker.is_muted = !audio.speaker.is_muted),
  child: Widget.Box({
    children: [
      Widget.Icon().hook(audio.speaker, (self) => {
        const vol = audio.speaker.volume * 100
        const icon = [
          [101, 'overamplified'],
          [67, 'high'],
          [34, 'medium'],
          [1, 'low'],
          [0, 'muted'],
        ].find(([threshold]) => threshold <= vol)?.[1]

        self.icon = `audio-volume-${icon}-symbolic`
        self.tooltip_text = `Volume ${Math.floor(vol)}%`
      }),

      Widget.Label({ css: `margin-left: 8px;` }).hook(audio.speaker, (self) => {
        const vol = audio.speaker.volume * 100
        self.label = `${Math.floor(vol)}%`
      }),
    ],
  }),
})
const VolumeBox = Widget.EventBox({
  child: volumeIndicator,
  on_scroll_up: () => (audio.speaker.volume += 0.05),
  on_scroll_down: () => (audio.speaker.volume -= 0.05),
})
const Volume = () =>
  Widget.Box({
    class_name: 'volume',
    children: [VolumeBox],
  })

export default Volume
