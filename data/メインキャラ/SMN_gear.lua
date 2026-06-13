function init_weaponns()
    send_command('gs c set MainWeapons '..windower.to_shift_jis('オパショーロ')..'; wait 1; gs c set SubWeapons '..windower.to_shift_jis('エランストラップ'))
end


function init_gear_sets()
    --ロックスタイル番号
    lockstyleset = 15

    --武器
    gear['グリダーヴォル']      = {name="グリダーヴォル"}
    gear['オパショーロ']        = {name="オパショーロ"}
    gear['エランストラップ']    = {name="エランストラップ+1"}
    gear.Slip                   = {name="プライムスタッフ"}

    sets.SmnSkill = {
        head="バヤミハット",
        body="バヤミローブ",
        hands={ name="ＧＬブレーサー+3", augments={'Inc. Sp. "Blood Pact" magic burst dmg.',}},
        legs="ＢＣスパッツ+2",
        feet="バヤミサボ",
        neck="インカンタートルク",
        waist="ルセデティサッシュ",
        left_ear="パルーグピアス",
        right_ear="ロードルピアス",
        left_ring="エボカーリング",
        right_ring="スティキニリング+1",
        back={ name="コンベイケープ", augments={'Summoning magic skill +4','Pet: Enmity+8','Blood Pact Dmg.+2','Blood Pact ab. del. II -2',}},
    }

    --バフ
    sets.precast.JA['アストラルフロウ']     = {head="ＧＬホーン+3"}
    sets.precast.JA['エレメントサイフォン'] = set_combine(sets.SMNSkill,{feet="ＢＣピガッシュ+2"})
    sets.precast.JA['神獣の加護']           = {head="ＢＣホーン+2"}
    sets.precast.JA['アポジー']             = {}
    sets.precast.JA['マナシード']           = {hads="ＢＣブレーサー+3"}
    sets.precast.JA['アストラルパッセージ'] = {}

    --待機装備（通常）
    sets.idle = {
        ammo="ストンチタスラム+1",
        head="ＢＣホーン+2",
        body="ＢＣダブレット+2",
        hands={ name="マーリンダスタナ", augments={'Attack+4','CHR+2','"Refresh"+2',}},
        legs="ＢＣスパッツ+2",
        feet={ name="マーリンクラッコー", augments={'CHR+12','Accuracy+5','"Refresh"+2',}},
        neck="シビルスカーフ",
        waist={name="プラチナモグベルト",priority=16},
        left_ear="パルーグピアス",
        right_ear={ name="ベコナーピアス+1", augments={'System: 1 ID: 1676 Val: 0','Pet: Accuracy+15 Pet: Rng. Acc.+15','Pet: Mag. Acc.+15','Damage taken-5%',}},
        left_ring="メランリング",
        right_ring="シュネデックリング",
        back={name="月明の羽衣",priority=15}
    }
    
    --待機装備（ペット呼び出し時）
    sets.idle.Avatar = {
        ammo="ストンチタスラム+1",
        head="ＢＣホーン+2",
        body="ＢＣダブレット+2",
        hands="ニャメガントレ", 
        legs="ＢＣスパッツ+2",
        feet="ＢＣピガッシュ+2",
        neck="シビルスカーフ",
        waist={name="プラチナモグベルト",priority=16},
        left_ear="パルーグピアス",
        right_ear={ name="ベコナーピアス+1", augments={'System: 1 ID: 1676 Val: 0','Pet: Accuracy+15 Pet: Rng. Acc.+15','Pet: Mag. Acc.+15','Damage taken-5%',}},
        left_ring="メランリング",
        right_ring="シュネデックリング",
        back={name="月明の羽衣",priority=15}
    }
    sets.idle.Avatar.Favor = sets.idle.Avatar

    --FC
    sets.precast.FC = {
        ammo="サピエンスオーブ",
        head={ name="マーリンフード", augments={'"Mag.Atk.Bns."+24','"Fast Cast"+7','Mag. Acc.+1',}},
        body="インヤガジュバ+2",
        hands="ニャメガントレ",
        legs="ニャメフランチャ",
        feet={ name="マーリンクラッコー", augments={'"Fast Cast"+7','MND+5',}},
        neck="オルンミラトルク",
        waist={name="プラチナモグベルト",priority=16},
        left_ear="マリグナスピアス",
        right_ear="エンチャンピアス+1",
        left_ring={ name="ゼラチナスリング+1", augments={'Path: A',},priority=14},
        right_ring="ラハブリング",
        back="フィフォレケープ+1"
    }

    --履行短縮（バフ・デバフ）
    sets.precast.BloodPactWard = {
        ammo="エピタフサシェ",
        body="ＣＮダブレット+4",
    }

    --履行短縮（物理履行・魔法履行）
    sets.precast.BloodPactRage = sets.precast.BloodPactWard

    --共通WS定義読み込み
    init_weapon_skill()
    
    --回復 
    sets.midcast.Cure = {
        ammo="ストンチタスラム+1",
        head={ name="テルキネキャップ", augments={'"Cure" potency +5%','Enh. Mag. eff. dur. +10',}},
        body={ name="テルキネシャジュブ", augments={'"Cure" potency +7%','Enh. Mag. eff. dur. +10',}},
        hands={ name="テルキネグローブ", augments={'"Cure" potency +7%','Enh. Mag. eff. dur. +10',}},
        legs={ name="テルキネブラコーニ", augments={'"Cure" potency +8%','Enh. Mag. eff. dur. +10',}},
        feet={ name="テルキネピガッシュ", augments={'"Cure" potency +8%','Enh. Mag. eff. dur. +10',}},
        neck="オルンミラトルク",
        waist="コーネリアの黒帯",
        left_ear="メンデカントピアス",
        left_ring="メネロスリング",
        right_ring="レベッチェリング",
        back={name="月明の羽衣",priority=15}
    }
    
    --強化魔法
    sets.midcast['強化魔法'] = {
        head={ name="テルキネキャップ", augments={'"Cure" potency +5%','Enh. Mag. eff. dur. +10',}},
        body={ name="テルキネシャジュブ", augments={'"Cure" potency +7%','Enh. Mag. eff. dur. +10',}},
        hands={ name="テルキネグローブ", augments={'"Cure" potency +7%','Enh. Mag. eff. dur. +10',}},
        legs={ name="テルキネブラコーニ", augments={'"Cure" potency +8%','Enh. Mag. eff. dur. +10',}},
        feet={ name="テルキネピガッシュ", augments={'"Cure" potency +8%','Enh. Mag. eff. dur. +10',}},
        waist="エンブラサッシュ",
    }

    --物理履行
    sets.midcast.Pet.AvatarPhysicalPacts = {
        ammo="エピタフサシェ",
        head={ name="ヘリオスバンド", augments={'Pet: Accuracy+30 Pet: Rng. Acc.+30','Pet: "Dbl. Atk."+8','Blood Pact Dmg.+7',}},
        body="ＧＬダブレット+3",
        hands="ＢＣブレーサー+3",
        legs={ name="エンタイサーパンツ", augments={'MP+45','Pet: Accuracy+14 Pet: Rng. Acc.+14','Pet: Mag. Acc.+13','Pet: Damage taken -3%',}},
        feet="ブンジサボ",
        neck={ name="召喚士の首輪+2", augments={'Path: A',}},
        waist="インカーネトサッシュ",
        left_ear="ルガルバンダピアス",
        right_ear={ name="ベコナーピアス+1", augments={'System: 1 ID: 1676 Val: 0','Pet: Accuracy+15 Pet: Rng. Acc.+15','Pet: Mag. Acc.+15','Damage taken-5%',}},
        left_ring="ヴァラールリング+1",
        right_ring="ヴァラールリング+1",
        back={ name="カンペストレケープ", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Attack+10 Pet: Rng.Atk.+10',}},
    }

    --フレイムクラッシュ
    sets.midcast.Pet['フレイムクラッシュ'] = set_combine(sets.midcast.Pet.AvatarPhysicalPacts,{
        head="パルーグクラウン",
        body="ＣＮダブレット+4",
        waist="王将の帯",
        back={ name="カンペストレケープ", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10',}},
    })

    --魔法履行
    sets.midcast.Pet.AvatarMagicalPacts = {
--        main={ name="グリオアヴァール", augments={'Blood Pact Dmg.+5','Pet: INT+15','Pet: Mag. Acc.+14','Pet: "Mag.Atk.Bns."+25',}},
        ammo="エピタフサシェ",
        head="パルーグクラウン",
        body="ウドゥグジャケット",
        hands={ name="マーリンダスタナ", augments={'Pet: "Mag.Atk.Bns."+24','Blood Pact Dmg.+10','Pet: Mag. Acc.+9',}},
        legs={ name="エンタイサーパンツ", augments={'MP+45','Pet: Accuracy+14 Pet: Rng. Acc.+14','Pet: Mag. Acc.+13','Pet: Damage taken -3%',}},
        feet="ブンジサボ",
        neck={ name="召喚士の首輪+2", augments={'Path: A',}},
        waist="王将の帯",
        left_ear="ルガルバンダピアス",
        right_ear={ name="ベコナーピアス+1", augments={'System: 1 ID: 1676 Val: 0','Pet: Accuracy+15 Pet: Rng. Acc.+15','Pet: Mag. Acc.+15','Damage taken-5%',}},
        left_ring="ヴァラールリング+1",
        right_ring="ヴァラールリング+1",
        back={ name="カンペストレケープ", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Pet: Magic Damage+10',}},
    }

    --バフ履行
    sets.midcast.Pet.AvatarBuffWard = sets.SmnSkill

    --デバフ履行
    sets.midcast.Pet.AvatarDeBuffWard = 
    {
        ammo="ストンチタスラム+1",
        head="ＢＣホーン+2",
        body="ＢＣダブレット+2",
        hands="ラマスミトン+1",
        legs="ＢＣスパッツ+2",
        feet="ＢＣピガッシュ+2",
        neck={ name="召喚士の首輪+2", augments={'Path: A',}},
        waist="インカーネトサッシュ",
        left_ear="ルガルバンダピアス",
        right_ear={ name="ベコナーピアス+1", augments={'System: 1 ID: 1676 Val: 0','Pet: Accuracy+15 Pet: Rng. Acc.+15','Pet: Mag. Acc.+15','Damage taken-5%',}},
        left_ring="パルーグリング",
        right_ring="メランリング",
        back={ name="カンペストレケープ", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Magic Damage+10',}},
    }
end