var TYPE_REPLACE_ALL = "1"; 
var TYPE_REPLACE_SELECTED = "2";
var TYPE_APPEND_ALL = "3"
var TYPE_APPEND_SELECTED = "4"

var chromeApp = null; 

var saveTextInClipboardFromChrome = function (type) {
  var win = chromeApp.windows[0];
  var tab = win.activeTab();
  if (type === TYPE_REPLACE_ALL || type === TYPE_APPEND_ALL) {
    tab.selectAll(); 
  } 
  tab.copySelection();
  delay(0.1); 
}; 

var pasteToVimApp = function (vimAppName, type) {
  var vimApp = null;
  try { 
    vimApp = Application(vimAppName); 
  } catch(e) { 
    console.log(e); 
    return;
  } 

  // TODO:  other key pattern
  var systemEvents = Application("System Events"); 
  vimApp.activate();
  delay(0.3); 
  if (type === TYPE_REPLACE_ALL || type === TYPE_REPLACE_SELECTED) { 
    systemEvents.keystroke("g"); 
    systemEvents.keystroke("g"); 
    systemEvents.keystroke("v",{ using:["shift down"]}); 
    systemEvents.keystroke("g",{ using:["shift down"]}); 
    systemEvents.keystroke('"_d'); 
  } 
  systemEvents.keystroke("i"); 
  systemEvents.keystroke("v",{ using:["command down"]}); 
  // esc
  systemEvents.keyCode(53);
}; 

// argv[0]はtype
// argv[1]はVimAppName
function run(argv){ 
  // TODO: keyを送るappName + 最前面に戻すappName + key を受け取る 
  if (argv.length < 2) {
    console.log("Arguments are necessary more than two.");
    return; 
  } 

  try { 
    chromeApp = Application('Google Chrome'); 
    chromeApp.includeStandardAdditions = true; 
  } catch(e) {
    console.log(e); 
    return;
  } 

  saveTextInClipboardFromChrome(argv[0]); 
  pasteToVimApp(argv[1], argv[0]);
}

