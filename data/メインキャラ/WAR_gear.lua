function init_weaponns()
    --デフォルト武器を設定
end


function init_gear_sets()
    -- ロックスタイル番号
    lockstyleset = 1

    -- 武器
    gear.ShiningOne                 = {name="シャイニングワン"}
    gear.UtuGrip                    = {name="ウトゥグリップ"}
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


    --sets.buff['バーサク']                   = {feet="ＡＧカリガ+4"}
    --sets.buff['ディフェンダー']             = {hands="ＡＧマフラ+3"}
    sets.buff['リタリエーション']           = {hands="ＰＭマフラ+4",feet="ＢＩカリガ+3"}
    --sets.buff['ウォリアーチャージ']         = {legs="ＡＧクウィス+4"}
    --sets.buff['リストレント']               = {hands="ＢＩマフラ+3"}
    sets.precast.JA['マイティストライク']   = {hands="ＡＧマフラ+4"}
    sets.precast.JA['挑発']                 = sets.Enmity
    sets.precast.JA['バーサク']             = {head="ＰＭロリカ+4",feet="ＡＧカリガ+4",back="シコルマント"}
    sets.precast.JA['ディフェンダー']       = {hands="ＡＧマフラ+4"}
    sets.precast.JA['ウォークライ']         = {head="ＡＧマスク+4"}
    sets.precast.JA['アグレッサー']         = {head="ＰＭマスク+4",body="ＡＧロリカ+4"}
    sets.precast.JA['リタリエーション']     = {}
    sets.precast.JA['ウォリアーチャージ']   = {}
    sets.precast.JA['トマホーク']           = {feet="ＡＧカリガ+4"}
    sets.precast.JA['リストレント']         = {}
    sets.precast.JA['ブラッドレイジ']       = {body="ＢＩロリカ+3"}
    sets.precast.JA['ブラーゼンラッシュ']   = {}


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