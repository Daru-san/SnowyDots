const powerProfiles = await Service.import('powerprofiles')

const powerSaverProfile = 'power-saver'
const balancedProfile = 'balanced'
const performanceProfile = 'performance'

const availablePowerProfiles = [
  powerSaverProfile,
  balancedProfile,
  performanceProfile,
]

export default () =>
  Widget.Button({
    className: 'transparent-button',
    onClicked: () => {
      const activeProfileIndex = availablePowerProfiles.findIndex(
        (el) => el == powerProfiles.active_profile,
      )

      switch (activeProfileIndex) {
        case 1:
          powerProfiles.active_profile = performanceProfile
          break
        case 2:
          powerProfiles.active_profile = powerSaverProfile
          break
        default:
          powerProfiles.active_profile = balancedProfile
          break
      }
    },
    child: Widget.Box({
      children: [
        Widget.Icon({ icon: powerProfiles.bind('icon_name') }),
        Widget.Label({
          css: `margin-left: 6px;`,
          label: powerProfiles.bind('active_profile'),
        }),
      ],
    }),
  })
