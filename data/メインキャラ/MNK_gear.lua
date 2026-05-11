function init_weaponns()
    --デフォルト武器を設定
end


function init_gear_sets()
    -- ロックスタイル番号
    lockstyleset = 2

    -- 武器
    gear.Godhands                   = {name="ゴッドハンド"}
    gear.Slip                       = {name="フレンジーサリット"}


    -- 敵対心
    sets.Enmity = {
    }
    
    
    --モクシャ
    sets.SubtleBlow = {
    }
    
    
    -- 待機装備（通常）
    sets.idle = {
    }

    
    -- 抜刀装備
    sets.engaged = {
    }


    sets.buff['猫足立ち']                   = {feet="ＢＫゲートル+3"}
    sets.buff['絶対カウンター']             = {body="ＨＥシクラス+4"}
    sets.buff['インピタス']                 = {body="ＢＫシクラス+3"}
    sets.precast.JA['百烈拳']               = {legs="ＨＥホーズ+4"}
    sets.precast.JA['ためる']               = {hands="ＡＮグローブ+4",waist="アスクサッシュ"}
    sets.precast.JA['回避']                 = {}
    sets.precast.JA['集中']                 = {head="ＡＮクラウン+4"}
    sets.precast.JA['チャクラ']             = {body="ＡＮシクラス+4",hands="ＨＥグローブ+4"}
    sets.precast.JA['気孔弾']               = {}
    sets.precast.JA['かまえる']             = {feet="ＨＥゲートル+4"}
    sets.precast.JA['猫足立ち']             = {}
    sets.precast.JA['マントラ']             = {feet="ＨＥゲートル+4"}
    sets.precast.JA['無想無念']             = {body="ＨＥシクラス+4"}
    sets.precast.JA['絶対カウンター']       = {}
    sets.precast.JA['インピタス']           = {}
    sets.precast.JA['インナーストレングス'] = {}


    -- FC
    sets.precast.FC = {
    }

    --WSダメージ
    sets.precast.WS.Damage = {
    }

    --WSクリティカル
    sets.precast.WS.Critical = {
    }

    --WS魔攻
    sets.precast.WS.Magic = {
    }

    --WSモクシャ
    sets.precast.WS.SubtleBlow = {
    }

    --共通WS定義読み込み
    init_weapon_skill()

end