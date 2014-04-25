package manager
{
	import consts.CsvConst;
	
	import flash.utils.Dictionary;
	
	import util.csvutil.CSV;

	public class CSVManager
	{
		private static var _instance:CSVManager;
		private var _csvDic:Dictionary;
		public function CSVManager()
		{
			this._csvDic = new Dictionary();
		}
		
		public static function getInstance():CSVManager
		{
			if(_instance == null)
			{
				_instance = new CSVManager();
			}
			
			return _instance;
		}
		
		public function get list():Array{
			return [CsvConst.rule_polish_column, CsvConst.rule_strengthen, CsvConst.gem_exp, CsvConst.rule_gem_column, CsvConst.cha_list, CsvConst.cha_still_list, CsvConst.cha_talk_list, CsvConst.cha_user_list, CsvConst.cha_son_list, CsvConst.edited_data_list, CsvConst.exp_level, CsvConst.rule_attr, CsvConst.dungeon_list, CsvConst.dungeon_elite_list, CsvConst.dungeon_devil_list, CsvConst.dungeon_guide_list, CsvConst.shop_list, CsvConst.shop_goods, CsvConst.cha_attr, CsvConst.cha_grow, CsvConst.task, CsvConst.taskChapter, CsvConst.drop_list, CsvConst.drop_profession, CsvConst.tan_suo, CsvConst.copy_csv, CsvConst.chapter_list_csv, CsvConst.rule_strengthen_talisman, CsvConst.demon_list, CsvConst.rule_demon_column, CsvConst.town_list, CsvConst.vip, CsvConst.scene_list, CsvConst.skill_upgrade_price, CsvConst.skill_list, CsvConst.key_user, CsvConst.key_demon, CsvConst.chatRule, CsvConst.rule_fight_column, CsvConst.friendsBlessingRule, CsvConst.rule_user_column, CsvConst.achieve, CsvConst.achievementsSubType, CsvConst.achievementsParentType, CsvConst.rule_user_column, CsvConst.daily_task_list, CsvConst.daily_task_reward, CsvConst.rule_daily_task, CsvConst.title_list, CsvConst.title_type_list, CsvConst.price_type_config, CsvConst.world_boss, CsvConst.scene_list, CsvConst.bag_csv, CsvConst.buff_list, CsvConst.effect_list, CsvConst.openModuleCsv, CsvConst.dragonPalaceNpcListCsv, CsvConst.dragonPalaceRuleCsv, CsvConst.valuableBookCsv, CsvConst.guildAttrCsv, CsvConst.guildAttrGrowCsv, CsvConst.guildListCsv, CsvConst.guildRuleCsv, CsvConst.guildWarRuleCsv, CsvConst.pkPrice, CsvConst.pkLevelReward, CsvConst.arenaCSRule, CsvConst.arenaRule, CsvConst.guildScoreBossListCsv, CsvConst.guildBossListCsv, CsvConst.guildScoreBossRewardCsv, CsvConst.guildBossRewardCsv, CsvConst.extra_list, CsvConst.dungeon_activities_list, CsvConst.rule_copy_csv, CsvConst.activities_vip_package, CsvConst.activities_online_package, CsvConst.activities_recharge_package_frist, CsvConst.action_price, CsvConst.gold_prompt_list, CsvConst.active_list, CsvConst.skillOpenList, CsvConst.active_reward, CsvConst.skill_special_list, CsvConst.mail_template, CsvConst.activities_open_server, CsvConst.activities_open_server_contents_list, CsvConst.activities_mammon, CsvConst.message_template, CsvConst.activities_money_tree, CsvConst.activities_money_tree_price, CsvConst.demon_star_list, CsvConst.demon_star_page_list, CsvConst.activities_rule_money_column, CsvConst.activities_check_total, CsvConst.activities_landing_continue, CsvConst.activities_million_copper, CsvConst.activities_list, CsvConst.killDropList, CsvConst.pkRandReward, CsvConst.activities_xiaofeileiji, CsvConst.activities_recharge_package, CsvConst.arena_exchange_csv, CsvConst.dungeon_devil_price, CsvConst.dungeon_elite_price, CsvConst.task_open_town, CsvConst.arenaRankRewards, CsvConst.shortcut_links_list, CsvConst.wing_list, CsvConst.rule_wing_column, CsvConst.openSkillsConfig, CsvConst.rule_exercise_fight, CsvConst.worldBossRewardCsv, CsvConst.activities_seven_day, CsvConst.robotName, CsvConst.fp_reward];
		}
		
		public function saveCSV(csvName:String,csvData:CSV):void
		{
			this._csvDic[csvName] = csvData;
		}
	}
}