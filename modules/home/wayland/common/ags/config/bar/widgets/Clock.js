const date = Variable('', {
  poll: [1000, 'date "+%A, %d %B %Y at %X"'],
})

export default () =>
  Widget.Label({
    class_name: 'clock',
    label: date.bind(),
  })
