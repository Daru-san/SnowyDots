const date = Variable('', {
  poll: [1000, 'date "+%R"'],
})
const fullDate = Variable('', {
  poll: [100, 'date +"%X | %A %d %B %Y"'],
})

export default () =>
  Widget.Button({
    child: Widget.Label({
      class_name: 'clock',
      tooltip_text: fullDate.bind(),
      label: date.bind(),
    }),
  })
