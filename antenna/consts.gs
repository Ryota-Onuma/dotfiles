const SPREAD_SHEET_ID = PropertiesService.getScriptProperties().getProperty("SPREAD_SHEET_ID")
const SHEET_NAME = "アンテナリスト"
const TIME_FORMAT = "yyyy/MM/dd HH:mm"

// SpreadSheetの行に対応
// サイト名	URL	追加日
const SITE_NAME_COLUMN_INDEX = 0
const SITE_URL_COLUMN_INDEX = 1
const RECORDED_AT_COLUMN_INDEX = 2
