NDefines.NGame.START_DATE = "1936.1.1.12"
NDefines.NGame.END_DATE = "1970.1.1.1"

NDefines.NFrontend.CAMERA_MIN_HEIGHT = 50.0
NDefines.NFrontend.CAMERA_MAX_HEIGHT = 900.0
NDefines.NGraphics.PROVINCE_NAME_DRAW_DISTANCE = 500.0 			-- Remove province names beyond this distance

NDefines.NGame.MAP_SCALE_PIXEL_TO_KM = 3.25
NDefines.NGame.SAVE_VERSION = 7

NDefines.NMilitary.LAND_SPEED_MODIFIER = 0.15

NDefines.NSupply.CAPITAL_SUPPLY_BASE = 1.6 -- base supply for capital
NDefines.NSupply.CAPITAL_INITIAL_SUPPLY_FLOW = 3.0 -- starting supply from capital
NDefines.NSupply.CAPITAL_STARTING_PENALTY_PER_PROVINCE = 0.3 -- starting penalty that will be added as supply moves away from its origin (modified by stuff like terrain)
NDefines.NSupply.CAPITAL_ADDED_PENALTY_PER_PROVINCE = 0.4 -- added penalty as we move away from origin
NDefines.NSupply.NODE_INITIAL_SUPPLY_FLOW = 2.0
NDefines.NSupply.NODE_STARTING_PENALTY_PER_PROVINCE = 0.3
NDefines.NSupply.NODE_ADDED_PENALTY_PER_PROVINCE = 0.4
NDefines.NSupply.INFRA_TO_SUPPLY = 0.15							-- each level of infra gives this many supply
NDefines.NSupply.VP_TO_SUPPLY_BONUS_CONVERSION = 0.02			-- Bonus to supply local supplies from Victory Points, multiplied by this aspect and rounded to closest integer
NDefines.NSupply.VP_TO_SUPPLY_BASE = 0							-- Bonus to supply from a VP, no matter the level
NDefines.NSupply.NAVAL_BASE_INITIAL_SUPPLY_FLOW = 0.8
NDefines.NSupply.NAVAL_BASE_STARTING_PENALTY_PER_PROVINCE = 0.6
NDefines.NSupply.NAVAL_BASE_ADDED_PENALTY_PER_PROVINCE = 0.6
NDefines.NSupply.FLOATING_HARBOR_INITIAL_SUPPLY_FLOW = 0.8

NDefines.NAir.AIR_REGION_SUPERIORITY_PIXEL_SCALE = 0.02

--NDefines.NNavy.NAVAL_SPEED_MODIFIER = 0.3
--NDefines.NNavy.NAVAL_TRANSFER_BASE_SPEED = 6
NDefines.NNavy.NAVAL_RANGE_TO_INGAME_DISTANCE = 0.24							-- Scale the ship stats "naval_range" to the ingame distance

NDefines.NGraphics.MINIMUM_PROVINCE_SIZE_IN_PIXELS = 4

NDefines.NGraphics.COUNTRY_FLAG_LARGE_STRIPE_MAX_HEIGHT = 24000        -- VANILLA: 8192
NDefines.NGraphics.COUNTRY_FLAG_SMALL_TEX_MAX_SIZE = 512            -- VANILLA: 64
NDefines.NGraphics.COUNTRY_FLAG_STRIPE_TEX_MAX_HEIGHT = 8196        -- VANILLA: 2048
NDefines.NGraphics.COUNTRY_FLAG_TEX_MAX_SIZE = 2048                    -- VANILLA: 256
NDefines.NGraphics.VICTORY_POINT_MAP_ICON_TEXT_CUTOFF = {225, 375, 750}  -- At what camera distance the VP name text disappears.
NDefines.NGraphics.VICTORY_POINTS_DISTANCE_CUTOFF = {375,750,1500} -- At what distance VPs are hidden
NDefines.NGraphics.CAPITAL_ICON_CUTOFF = 1650	-- At what camera distance capital icons disappears
NDefines.NGraphics.UNITS_DISTANCE_CUTOFF = 180
NDefines.NGraphics.SHIPS_DISTANCE_CUTOFF = 360
NDefines.NGraphics.MAP_ICONS_GROUP_CAM_DISTANCE = 145.0 -- camera distance at which the icons begin to group up
NDefines.NGraphics.MAP_ICONS_STATE_GROUP_CAM_DISTANCE = 270.0 -- Camera distance at which the icons begin to group up on state level
NDefines.NGraphics.MAP_ICONS_STRATEGIC_GROUP_CAM_DISTANCE = 525 -- second camera distance at which the icons begin to group up

NDefines.NMapMode.MAP_MODE_MANPOWER_RANGE_MAX = 5000000
NDefines.NMapMode.MAP_MODE_MANPOWER_RANGE_COLOR_FROM = { 0.2, 0.2, 0.7, 0.5 }
NDefines.NMapMode.MAP_MODE_MANPOWER_RANGE_COLOR_TO = { 1, 0.125, 0.0, 0.75 }

NDefines.NCountry.POPULATION_YEARLY_GROWTH_BASE = 0.48
