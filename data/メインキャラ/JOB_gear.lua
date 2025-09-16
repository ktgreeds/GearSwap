function init_gear_sets()
    sets.buff['']     = {head=""}
    sets.buff['']     = {body=""}
    sets.buff['']     = {hands=""}
    sets.buff['']     = {legs=""}
    sets.buff['']     = {feet=""}
    sets.Weapons = {}
    sets.Weapons.A = { main={name=""}, sub={ name=""}}
    sets.Weapons.B = { main={name=""}, sub={ name=""}}
    sets.Weapons.C = { main={name=""}, sub={ name=""}}

    sets.TreasureHunter = {
    }

    sets.idle = {
    }

    sets.idle.Refresh = set_combine(sets.idle, {
    })

    sets.engaged = {
    }

    sets.precast.JA[''] = {head=""}
    sets.precast.JA[''] = {body=""}
    sets.precast.JA[''] = {hands=""}
    sets.precast.JA[''] = {legs=""}
    sets.precast.JA[''] = {feet=""}

    sets.precast.FC = {
    }
  
    sets.precast.WS.Critical = {
    }

    sets.precast.WS.Damage = {
    }

    sets.precast.WS.Magic = {
    }

    sets.precast.WS[''] = set_combine(sets.precast.WS.Damage, {})
    sets.precast.WS[''] = set_combine(sets.precast.WS.Critical, {})
    sets.precast.WS[''] = set_combine(sets.precast.WS.Damage, {})

    --定義名の参考：https://greeds.net/how-to-specify-spell-and-ability-names-in-japanese-with-mote-libs/
    sets.midcast['強化魔法'] = {
    }

end