const hyprland = await Service.import('hyprland')

const Workspace = (id) =>
  Widget.Button({
    attribute: id,
    on_clicked: () => hyprland.messageAsync(`dispatch workspace ${id}`),
    child: Widget.Label(`${id}`),
    setup: (self) =>
      self.hook(hyprland, (self) => {
        if (hyprland.active.workspace.id === self.attribute)
          self.toggleClassName('focused', true)
        else self.toggleClassName('focused', false)
      }),
  })

export default () =>
  Widget.Box({
    class_name: 'workspaces',
    children: Array.from({ length: 10 }, (_, i) => i + 1).map((i) =>
      Workspace(i),
    ),
    setup: (self) =>
      self.hook(hyprland, (self) => {
        for (let i = 5; i < 10; i++) {
          self.children[i].visible = hyprland.workspaces.some(
            (ws) => ws.id === i + 1,
          )
        }
      }),
  })
