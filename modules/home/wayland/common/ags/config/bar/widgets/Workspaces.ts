import Widget from 'resource:///com/github/Aylur/ags/widget.js'
import Sway from 'resource:///com/github/Aylur/ags/service/sway.js'

const Workspaces = () => {
  return Widget.Box({
    children: Array.from({ length: 20 }, (_, i) => {
      i += 1
      return Widget.Button({
        setup: (btn) => {
          btn.hook(
            Sway,
            (btn) => {
              const ws = Sway.getWorkspace(`${i}`)
              btn.visible = ws !== undefined
              btn.toggleClassName(
                'occupied',
                ws?.nodes.length + ws?.floating_nodes.length > 0,
              )
            },
            'notify::workspaces',
          )

          btn.hook(Sway.active.workspace, (btn) => {
            btn.toggleClassName('active', Sway.active.workspace.name == i)
          })
        },
        on_clicked: () => Sway.msg(`workspace ${i}`),
        child: Widget.Label({
          label: `${i}`,
          class_name: 'indicator',
          vpack: 'center',
        }),
      })
    }),
  })
}

export default () =>
  Widget.EventBox({
    class_name: 'workspaces',
    child: Widget.Box({
      child: Widget.EventBox({
        on_scroll_up: () => Sway.msg('workspace next'),
        on_scroll_down: () => Sway.msg('workspace prev'),
        class_name: 'eventbox',
        child: Workspaces(),
      }),
    }),
  })
