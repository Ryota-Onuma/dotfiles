const getHandler = () => {
  const defaultDays = 3
  const rows = getRowsWithinLastNDays(defaultDays)
  const rowsWithoutRecordedAt = rows.map(row => [row[SITE_NAME_COLUMN_INDEX],row[SITE_URL_COLUMN_INDEX]])
  resultTexts = ""
  rowsWithoutRecordedAt.forEach(row => {
    resultTexts += row[0] + "\n" + row[1] + "\n\n"
  })
  return createJsonResponse(resultTexts);
}

const getRowsWithinLastNDays = (days) => {
    const allRows = rowsWithoutHeader()
    return allRows.filter(row => isWithinLastNDays(row[RECORDED_AT_COLUMN_INDEX],days))
}

const isWithinLastNDays = (dateTimeString, days) => {
  const date = new Date(dateTimeString);
  const today = new Date();

  // 直近n日間の日付を取得
  const daysAgo = new Date(today);
  daysAgo.setDate(today.getDate() - days);
  
  // 日付を比較して、直近n日以内のものかどうかを判断
  return date >= daysAgo && date <= today;
}

const createJsonResponse = (data) => {
  payload = JSON.stringify(data)
  output = ContentService.createTextOutput().setMimeType(ContentService.MimeType.JSON).setContent(payload)
  return output
}
