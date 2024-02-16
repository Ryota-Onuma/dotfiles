const postHandler = (e)  => {
  const postData = JSON.parse(e.postData.contents);
  const spreadSheetById = SpreadsheetApp.openById(SPREAD_SHEET_ID)
  const sheet = spreadSheetById.getSheetByName(SHEET_NAME);

  const webSiteData = fetchWebSiteData(postData.url)
  // 未登録のWebサイトの場合、スプレッドシートに登録する
  if (shouldAppend(webSiteData.URL)) {
    const currentTime = getCurrentDateTimeFormatted(TIME_FORMAT)
    sheet.appendRow([webSiteData.Title,webSiteData.URL,currentTime])
  }
}

const fetchWebSiteData = (rawURL) => {
  const url = getFormattedURL(rawURL)
  const webSiteData = {
    "Title": "Title is not found.",
    "URL": url
  }
  const response = UrlFetchApp.fetch(url)
  const html = response.getContentText();
  const title = getTitleFromHTML(html)
  if (title !== "") {
    webSiteData.Title = title
  }

  return webSiteData
}

const getTitleFromHTML = (html) => {
   // HTMLから<title>タグを抽出する正規表現
  const titleRegex = /<title>(.*?)<\/title>/;
  
  // HTML内の<title>タグからサイトの名前を取得する
  const match = html.match(titleRegex);
  
  if (match && match[1]) {
    return match[1]
  } 
  return ""
}

// 余計な空白があったら削除。末尾の/を削除。
const getFormattedURL = (rawURL) => {
  const spaceRemovedURL = rawURL.trim();
  return removeTrailingSlash(spaceRemovedURL)
}

const removeTrailingSlash = (url) => {
  if (url.endsWith('/')) {
    return url.slice(0, -1);
  } 
  return url;
}

const getCurrentDateTimeFormatted = (format) => {
  const now = new Date();
  const formattedDateTime = Utilities.formatDate(now, Session.getScriptTimeZone(), format);
  return formattedDateTime;
}

// NOTE: スプレッドシートに登録されていないサイトのみ追加したいので、その判定
const shouldAppend = (url) => {
  const allRows = rowsWithoutHeader()
  // スプレッドシートからURLの列だけ抽出する
  const urls = allRows.slice(1).map(row => row[1]);
  const hasSpecifiedURL = urls.includes(url)
  return !hasSpecifiedURL // 含まれていなかったら追加させる
}

const rowsWithoutHeader = () => {
  const spreadSheetById = SpreadsheetApp.openById(SPREAD_SHEET_ID)
  const sheet = spreadSheetById.getSheetByName(SHEET_NAME);
  const dataRange = sheet.getDataRange();
  const rows = dataRange.getValues();
  return rows.slice(1)
}
