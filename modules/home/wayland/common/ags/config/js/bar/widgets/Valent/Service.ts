import GLib from 'gi://GLib'
import GObject from 'gi://GObject'
import Gio from 'gi://Gio'

import { Battery, exec } from 'ags-ts';
import * as Remote from './remote';
import { Widget } from 'ags-ts';

function _getBatteryIconName(percentage, charging) {
    // This is particular to KDE Connect
    if (percentage < 0)
        return 'battery-missing-symbolic';

    if (percentage >= 100)
        return 'battery-level-100-charged-symbolic';

    const level = Math.floor(percentage / 10) * 10;

    return charging
        ? `battery-level-${level}-charging-symbolic`
        : `battery-level-${level}-symbolic`;
}


class DeviceBattery extends GObject.Object {
  static {
    this[GObject.properties] = {
      'device': GObject.ParamSpec.object('device',null,null,GObject.ParamFlags.READWRITE, Remote.Device),
    };
    GObject.registerClass(this);
  } 
  constructor() {
    super();

    private _icon : string;

    public get icon() : string {
      return this._icon;
    }
    public set icon(v : string) {
      this._icon = v;
    }

    private _label : string;

    public get label() : string {
      return this._label;
    }
    public set label(v: string) {
      this._label = v;
    }
  }
  get device() {
    if (this._device === 'undefile')
      this._device = null;
    return this._device;
  }
}
