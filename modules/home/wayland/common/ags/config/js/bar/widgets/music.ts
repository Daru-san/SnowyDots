const mpris = await Service.import('mpris')

const label = Utils.watch('', mpris, 'player-changed', () => {
  if (mpris.players[0]) {
    const { track_artists, track_title } = mpris.players[0]
    return `${track_artists.join(', ')} - ${track_title}`
  } else {
    return 'Nothing is playing'
  }
})

const SongLabel = Widget.Label({
  value: label,
})

const icon = Widget.Icon({
  icon: 'multimedia-player',
  css: 'font-size: 10px',
})

export default () =>
  Widget.Button({
    class_name: 'media',
    on_secondary_click: () => mpris.getPlayer('')?.playPause(),
    on_primary_click: () => App.toggleWindow('mpris'),
    on_scroll_up: () => mpris.getPlayer('')?.next(),
    on_scroll_down: () => mpris.getPlayer('')?.previous(),
    tooltipText: label,
    child: Widget.Box({
      children: [icon, label],
    }),
  })
